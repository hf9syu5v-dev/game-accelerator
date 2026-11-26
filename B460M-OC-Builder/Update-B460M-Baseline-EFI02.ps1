#requires -Version 5.1
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [ValidateSet("Prepare","Apply")]
    [string]$Step,
    [string]$DriveLetter = "F"
)
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

$DriveLetter = $DriveLetter.TrimEnd(":").ToUpperInvariant()
if ($DriveLetter -notmatch '^[A-Z]$') { throw "DriveLetter must be one letter." }
$Root = $DriveLetter + ":\"
$ActiveEfi = Join-Path $Root "EFI"
$Recovery = Join-Path $Root "com.apple.recovery.boot"
$ReleaseBase = "https://github.com/hf9syu5v-dev/game-accelerator/releases/download/b460m-baseline-efi02-sequoia-oc108/"
$ZipUrl = $ReleaseBase + "B460M-Baseline-EFI-02.zip"
$ManifestUrl = $ReleaseBase + "EFI-SHA256SUMS.txt"
$ExpectedZipSha256 = "c639d82cf099da15afe6fce1b15b47e833c62a9bb77d628a1ccaff4953c1086c"
$ExpectedRecovery = @{
    "BaseSystem.dmg" = "7314eb401f5e84087f621b3599f0ad21ca3cdcc2685ea2da7f76806792328e20"
    "BaseSystem.chunklist" = "dbf262b83a16d55f1b2d8ce8ce95986561f8e889719524ea4b7aa22a2417ca27"
}
$TestSerial = "C02J5NYBPN5T"
$TestMLB = "C02231609GUPHC1JC"
$TestUUID = "78BDA777-E7DE-493E-BB3C-DE76B4D3AEE6"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$StatePath = Join-Path $ScriptDir "B460M-Baseline-EFI02-Prepared.json"

$PythonHelper = @'
import plistlib, sys, uuid, re
mode, path, serial, mlb, system_uuid, rom_hex = sys.argv[1:7]
if not re.fullmatch(r"[0-9a-fA-F]{12}", rom_hex):
    raise SystemExit("Invalid ROM: expected 12 hexadecimal characters")
rom = bytes.fromhex(rom_hex)
with open(path, "rb") as f:
    data = plistlib.load(f)
generic = data.setdefault("PlatformInfo", {}).setdefault("Generic", {})
if mode == "inject":
    generic["SystemProductName"] = "iMac20,1"
    generic["SystemSerialNumber"] = serial
    generic["MLB"] = mlb
    generic["SystemUUID"] = str(uuid.UUID(system_uuid)).upper()
    generic["ROM"] = rom
    with open(path, "wb") as f:
        plistlib.dump(data, f, fmt=plistlib.FMT_BINARY, sort_keys=False)
elif mode == "verify":
    expected = {
        "SystemProductName": "iMac20,1",
        "SystemSerialNumber": serial,
        "MLB": mlb,
        "SystemUUID": str(uuid.UUID(system_uuid)).upper(),
        "ROM": rom,
    }
    for key, value in expected.items():
        actual = generic.get(key)
        if key == "SystemUUID" and actual is not None:
            actual = str(uuid.UUID(str(actual))).upper()
        if actual != value:
            raise SystemExit("SMBIOS verification failed for " + key)
    print("SMBIOS_INJECTION_VERIFIED")
else:
    raise SystemExit("Unknown helper mode")
'@

function Get-PythonCommand {
    # Previously verified on this Windows PC: Python 3.15.2 via PyManager.
    $candidates = @(
        "C:\Program Files\PyManager\python.exe"
    )
    foreach ($candidate in $candidates) {
        if (Test-Path -LiteralPath $candidate -PathType Leaf) {
            $version = & $candidate --version 2>&1
            if ($LASTEXITCODE -eq 0 -and ($version -match '^Python 3\.')) {
                Write-Host "Using previously installed Python: $candidate ($version)" -ForegroundColor Green
                return $candidate
            }
        }
    }
    $cmd = Get-Command python.exe -ErrorAction SilentlyContinue
    if (-not $cmd) { $cmd = Get-Command python -ErrorAction SilentlyContinue }
    if ($cmd) {
        $version = & $cmd.Source --version 2>&1
        if ($LASTEXITCODE -eq 0 -and ($version -match '^Python 3\.')) {
            Write-Host "Using Python from PATH: $($cmd.Source) ($version)" -ForegroundColor Green
            return $cmd.Source
        }
    }
    throw "Python 3 was not found at the previously verified PyManager path or on PATH. No USB changes have been made."
}
function Assert-UsbIdentity {
    if (-not (Test-Path -LiteralPath $Root -PathType Container)) { throw "Drive $($DriveLetter): is not available." }
    $parts = @(Get-Partition -DriveLetter $DriveLetter)
    if ($parts.Count -ne 1) { throw "Safety stop: expected exactly one mounted partition on the selected USB." }
    $partition = $parts[0]
    $disk = Get-Disk -Number $partition.DiskNumber
    $volume = Get-Volume -DriveLetter $DriveLetter
    if ($disk.BusType -ne "USB") { throw "Safety stop: selected drive is not USB." }
    if ($disk.Model -notmatch "LITEON I T LCS-128L9S") { throw "Safety stop: unexpected USB model: $($disk.Model)" }
    if (($disk.SerialNumber -replace '\s','') -ne "000000123ADC") { throw "Safety stop: unexpected USB serial: $($disk.SerialNumber)" }
    if ($disk.Size -lt 110000000000 -or $disk.Size -gt 130000000000) { throw "Safety stop: unexpected USB capacity." }
    if ($disk.PartitionStyle -ne "GPT" -or $disk.IsBoot -or $disk.IsSystem) { throw "Safety stop: unsafe partition style or Boot/System disk." }
    if ($partition.GptType -ne "{c12a7328-f81f-11d2-ba4b-00a0c93ec93b}") { throw "Safety stop: partition is not EFI System Partition." }
    if ($volume.FileSystem -ne "FAT32") { throw "Safety stop: EFI volume is not FAT32." }
    Write-Host "USB identity verified." -ForegroundColor Green
}
function Assert-RecoveryReadOnly {
    if (-not (Test-Path -LiteralPath $Recovery -PathType Container)) { throw "Recovery directory missing." }
    foreach ($name in $ExpectedRecovery.Keys) {
        $p = Join-Path $Recovery $name
        if (-not (Test-Path -LiteralPath $p -PathType Leaf)) { throw "Recovery file missing: $name" }
        $actual = (Get-FileHash -LiteralPath $p -Algorithm SHA256).Hash.ToLowerInvariant()
        if ($actual -ne $ExpectedRecovery[$name]) { throw "Recovery hash mismatch: $name" }
    }
    Write-Host "Recovery payload hashes verified; Recovery is read-only." -ForegroundColor Green
}
function Assert-EfiFolder {
    param([string]$Path,[switch]$ForCandidate)
    foreach ($relative in @("BOOT\BOOTx64.efi","OC\OpenCore.efi","OC\config.plist","OC\Drivers\OpenRuntime.efi","OC\Drivers\HfsPlus.efi")) {
        if (-not (Test-Path -LiteralPath (Join-Path $Path $relative) -PathType Leaf)) { throw "EFI missing required file: $relative" }
    }
    if ($ForCandidate) {
        $cfg = Get-Content -LiteralPath (Join-Path $Path "OC\config.plist") -Raw
        if ($cfg -match "-radvesa" -or $cfg -match "-wegnoigpu") { throw "EFI has obsolete graphics-isolation boot arguments." }
        if ($cfg -notmatch "iMac20,1") { throw "EFI iMac20,1 marker missing." }
    }
}
function Assert-Manifest {
    param([string]$ManifestPath,[string]$EfiRoot,[switch]$SkipConfigPlist)
    if (-not (Test-Path -LiteralPath $ManifestPath -PathType Leaf)) { throw "EFI-SHA256SUMS.txt missing." }
    $count = 0
    foreach ($line in Get-Content -LiteralPath $ManifestPath) {
        if ([string]::IsNullOrWhiteSpace($line)) { continue }
        if ($line -notmatch '^([0-9a-fA-F]{64})\s+\*?(.+)$') { throw "Malformed manifest line: $line" }
        $expected = $Matches[1].ToLowerInvariant()
        $relative = $Matches[2].Replace("/","\")
        if ($relative -match '(^|\\)\.\.(\\|$)' -or [IO.Path]::IsPathRooted($relative)) { throw "Unsafe manifest path." }
        if ($SkipConfigPlist -and $relative -ieq "OC\config.plist") { continue }
        $file = Join-Path $EfiRoot $relative
        if (-not (Test-Path -LiteralPath $file -PathType Leaf)) { throw "Manifest file missing: $relative" }
        $actual = (Get-FileHash -LiteralPath $file -Algorithm SHA256).Hash.ToLowerInvariant()
        if ($actual -ne $expected) { throw "Manifest SHA256 mismatch: $relative" }
        $count++
    }
    if ($count -lt 10) { throw "Manifest contains too few verified files: $count" }
    Write-Host "EFI manifest verified: $count files." -ForegroundColor Green
}
function Get-I219VMac {
    $matches = @(Get-NetAdapter -Physical | Where-Object {
        $_.InterfaceDescription -match 'I219-V' -or $_.Name -match 'I219-V'
    })
    if ($matches.Count -ne 1) { throw "Expected exactly one physical Intel I219-V adapter; found $($matches.Count)." }
    $mac = ($matches[0].MacAddress -replace '[^0-9A-Fa-f]','').ToLowerInvariant()
    if ($mac -notmatch '^[0-9a-f]{12}$' -or $mac -eq '000000000000') { throw "I219-V MAC address is invalid." }
    return $mac
}
function Invoke-SmbiosHelper {
    param([string]$Python,[string]$Helper,[string]$Mode,[string]$Config,[string]$Rom)
    & $Python $Helper $Mode $Config $TestSerial $TestMLB $TestUUID $Rom
    if ($LASTEXITCODE -ne 0) { throw "SMBIOS plist $Mode operation failed." }
}
function Assert-StagePath {
    param([string]$Path)
    $rootFull = [IO.Path]::GetFullPath($Root)
    $pathFull = [IO.Path]::GetFullPath($Path)
    if (-not $pathFull.StartsWith($rootFull,[StringComparison]::OrdinalIgnoreCase)) { throw "Stage is outside USB root." }
    if ((Split-Path -Leaf $pathFull) -notmatch '^EFI-BASELINE02-STAGING-[0-9a-f]{32}$') { throw "Unexpected stage directory name." }
    if ((Get-Item -LiteralPath $pathFull -Force).Attributes -band [IO.FileAttributes]::ReparsePoint) { throw "Stage is a reparse point." }
}

Assert-UsbIdentity
Assert-RecoveryReadOnly

if ($Step -eq "Prepare") {
    if (-not (Test-Path -LiteralPath $ActiveEfi -PathType Container)) { throw "Current EFI directory missing." }
    Assert-EfiFolder -Path $ActiveEfi
    $python = Get-PythonCommand
    $rom = Get-I219VMac
    $work = Join-Path $env:TEMP ("B460M-Baseline02-" + [guid]::NewGuid().ToString("N"))
    $extract = Join-Path $work "extract"
    $zip = Join-Path $work "B460M-Baseline-EFI-02.zip"
    $manifest = Join-Path $work "EFI-SHA256SUMS.txt"
    $helper = Join-Path $work "Set-B460M-Smbios.py"
    $stage = Join-Path $Root ("EFI-BASELINE02-STAGING-" + [guid]::NewGuid().ToString("N"))
    New-Item -ItemType Directory -Path $work | Out-Null
    try {
        Invoke-WebRequest -Uri $ZipUrl -OutFile $zip -UseBasicParsing
        $zipHash = (Get-FileHash -LiteralPath $zip -Algorithm SHA256).Hash.ToLowerInvariant()
        if ($zipHash -ne $ExpectedZipSha256) { throw "EFI-02 ZIP SHA256 mismatch: $zipHash" }
        Invoke-WebRequest -Uri $ManifestUrl -OutFile $manifest -UseBasicParsing
        Expand-Archive -LiteralPath $zip -DestinationPath $extract
        $source = Join-Path $extract "EFI"
        if (-not (Test-Path -LiteralPath $source -PathType Container)) { throw "ZIP has no EFI directory at root." }
        Assert-Manifest -ManifestPath $manifest -EfiRoot $source
        Assert-EfiFolder -Path $source -ForCandidate
        Set-Content -LiteralPath $helper -Value $PythonHelper -Encoding UTF8
        $config = Join-Path $source "OC\config.plist"
        Invoke-SmbiosHelper -Python $python -Helper $helper -Mode "inject" -Config $config -Rom $rom
        Invoke-SmbiosHelper -Python $python -Helper $helper -Mode "verify" -Config $config -Rom $rom
        New-Item -ItemType Directory -Path $stage | Out-Null
        Get-ChildItem -LiteralPath $source -Force | Copy-Item -Destination $stage -Recurse
        Assert-Manifest -ManifestPath $manifest -EfiRoot $stage -SkipConfigPlist
        Invoke-SmbiosHelper -Python $python -Helper $helper -Mode "verify" -Config (Join-Path $stage "OC\config.plist") -Rom $rom
        Assert-EfiFolder -Path $stage -ForCandidate
        [ordered]@{
            Version = 3
            DriveLetter = $DriveLetter
            StagePath = $stage
            ZipSha256 = $ExpectedZipSha256
            Rom = $rom
            PreparedAt = (Get-Date).ToString("o")
            WorkPath = $work
            ManifestPath = $manifest
            HelperPath = $helper
            PythonPath = $python
        } | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath $StatePath -Encoding UTF8
        Write-Host "PREPARE_SUCCESS" -ForegroundColor Green
        Write-Host "SMBIOS: iMac20,1 / authorized test Serial+MLB+SmUUID / ROM from physical I219-V MAC."
        Write-Host "Staging path: $stage"
        Write-Host "Active EFI has NOT been changed."
        Write-Host "Recovery and all other disks have NOT been modified."
    }
    catch {
        if (Test-Path -LiteralPath $stage) { Write-Warning "Incomplete staging directory retained for inspection: $stage" }
        throw
    }
}
elseif ($Step -eq "Apply") {
    if (-not (Test-Path -LiteralPath $StatePath -PathType Leaf)) { throw "No prepared state. Run Prepare first." }
    $state = Get-Content -LiteralPath $StatePath -Raw | ConvertFrom-Json
    if ($state.Version -ne 3 -or $state.DriveLetter -ne $DriveLetter -or $state.ZipSha256 -ne $ExpectedZipSha256) { throw "Prepared state/package mismatch. Run Prepare again." }
    $stage = [string]$state.StagePath
    Assert-StagePath -Path $stage
    if (-not (Test-Path -LiteralPath $stage -PathType Container)) { throw "Staging directory missing." }
    $workFull = [IO.Path]::GetFullPath([string]$state.WorkPath)
    $manifest = [IO.Path]::GetFullPath([string]$state.ManifestPath)
    $helper = [IO.Path]::GetFullPath([string]$state.HelperPath)
    if (-not $manifest.StartsWith($workFull,[StringComparison]::OrdinalIgnoreCase) -or -not $helper.StartsWith($workFull,[StringComparison]::OrdinalIgnoreCase)) { throw "Prepared helper/manifest path is outside the work directory." }
    if (-not (Test-Path -LiteralPath $manifest -PathType Leaf) -or -not (Test-Path -LiteralPath $helper -PathType Leaf)) { throw "Prepared verification files are missing. Run Prepare again." }
    if (-not (Test-Path -LiteralPath ([string]$state.PythonPath) -PathType Leaf)) { throw "Previously used Python executable is unavailable." }
    Assert-Manifest -ManifestPath $manifest -EfiRoot $stage -SkipConfigPlist
    Invoke-SmbiosHelper -Python ([string]$state.PythonPath) -Helper $helper -Mode "verify" -Config (Join-Path $stage "OC\config.plist") -Rom ([string]$state.Rom)
    Assert-EfiFolder -Path $stage -ForCandidate
    if (-not (Test-Path -LiteralPath $ActiveEfi -PathType Container)) { throw "Active EFI directory missing." }
    $backup = Join-Path $Root ("EFI-PREVIOUS-BASELINE02-" + [guid]::NewGuid().ToString("N"))
    $failed = Join-Path $Root ("EFI-FAILED-BASELINE02-" + [guid]::NewGuid().ToString("N"))
    Write-Host "Only $ActiveEfi will be replaced. Backup: $backup"
    Write-Host "Recovery, Recovery staging directories, E:, and internal disks are not targets."
    $confirm = Read-Host "Type APPLY-BASELINE-02 to continue"
    if ($confirm -cne "APPLY-BASELINE-02") { throw "Cancelled. No EFI changes made." }
    $oldMoved = $false
    $newMoved = $false
    try {
        Rename-Item -LiteralPath $ActiveEfi -NewName (Split-Path $backup -Leaf)
        $oldMoved = $true
        Rename-Item -LiteralPath $stage -NewName "EFI"
        $newMoved = $true
        Assert-EfiFolder -Path $ActiveEfi -ForCandidate
        Assert-Manifest -ManifestPath $manifest -EfiRoot $ActiveEfi -SkipConfigPlist
        Invoke-SmbiosHelper -Python ([string]$state.PythonPath) -Helper $helper -Mode "verify" -Config (Join-Path $ActiveEfi "OC\config.plist") -Rom ([string]$state.Rom)
        Assert-RecoveryReadOnly
        Write-Host "BASELINE02_DEPLOYMENT_SUCCESS" -ForegroundColor Green
        Write-Host "Previous EFI backup retained: $backup"
        Remove-Item -LiteralPath $StatePath -Force
    }
    catch {
        $failure = $_
        if ($newMoved -and (Test-Path -LiteralPath $ActiveEfi)) {
            Rename-Item -LiteralPath $ActiveEfi -NewName (Split-Path $failed -Leaf)
            Write-Warning "Failed candidate retained: $failed"
        }
        if ($oldMoved -and (Test-Path -LiteralPath $backup)) {
            Rename-Item -LiteralPath $backup -NewName "EFI"
            Write-Warning "Previous EFI restored."
        }
        throw $failure
    }
}

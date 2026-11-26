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
$Root = $DriveLetter + ":\"
$ActiveEfi = Join-Path $Root "EFI"
$Recovery = Join-Path $Root "com.apple.recovery.boot"
$BaseUrl = "https://github.com/hf9syu5v-dev/game-accelerator/releases/download/b460m-hackintosh-baseline-efi02/B460M-Hackintosh-Baseline-EFI-02.zip"
$ExpectedZipSha256 = "952ac170745d671346f396d0eb499b572144a33243f9e1c921e6e2c528e49253"
$ExpectedRecovery = @{
    "BaseSystem.dmg" = "7314eb401f5e84087f621b3599f0ad21ca3cdcc2685ea2da7f76806792328e20"
    "BaseSystem.chunklist" = "dbf262b83a16d55f1b2d8ce8ce95986561f8e889719524ea4b7aa22a2417ca27"
}
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$StatePath = Join-Path $ScriptDir "B460M-Baseline-EFI02-Prepared.json"

function Assert-UsbIdentity {
    if (-not (Test-Path -LiteralPath $Root -PathType Container)) { throw "Drive $($DriveLetter): is not available." }
    $partition = Get-Partition -DriveLetter $DriveLetter
    $disk = Get-Disk -Number $partition.DiskNumber
    $volume = Get-Volume -DriveLetter $DriveLetter

    if ($disk.BusType -ne "USB") { throw "Safety stop: $DriveLetter is not USB (BusType=$($disk.BusType))." }
    if ($disk.Model -notmatch "LITEON I T LCS-128L9S") { throw "Safety stop: unexpected USB model: $($disk.Model)" }
    if ($disk.SerialNumber.Trim() -ne "000000123ADC") { throw "Safety stop: unexpected USB serial: $($disk.SerialNumber)" }
    if ($disk.Size -lt 110000000000 -or $disk.Size -gt 130000000000) { throw "Safety stop: unexpected USB capacity: $($disk.Size) bytes" }
    if ($disk.PartitionStyle -ne "GPT") { throw "Safety stop: USB partition style is not GPT." }
    if ($disk.IsBoot -or $disk.IsSystem) { throw "Safety stop: selected disk is marked Boot/System." }
    if ($partition.GptType -ne "{c12a7328-f81f-11d2-ba4b-00a0c93ec93b}") { throw "Safety stop: selected partition is not an EFI System Partition." }
    if ($volume.FileSystem -ne "FAT32") { throw "Safety stop: EFI volume is not FAT32." }
    Write-Host "USB identity verified: $($disk.Model), Serial=$($disk.SerialNumber), $([math]::Round($disk.Size/1GB,1)) GB, GPT/ESP/FAT32." -ForegroundColor Green
}

function Assert-RecoveryReadOnly {
    if (-not (Test-Path -LiteralPath $Recovery -PathType Container)) { throw "Safety stop: Recovery directory missing: $Recovery" }
    foreach ($name in $ExpectedRecovery.Keys) {
        $path = Join-Path $Recovery $name
        if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { throw "Safety stop: Recovery file missing: $name" }
        $actual = (Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash.ToLowerInvariant()
        if ($actual -ne $ExpectedRecovery[$name]) { throw "Safety stop: Recovery hash mismatch: $name" }
    }
    Write-Host "Recovery payload hashes verified; Recovery will not be modified." -ForegroundColor Green
}

function Assert-EfiFolder {
    param([Parameter(Mandatory=$true)][string]$Path)
    foreach ($relative in @("BOOT\BOOTx64.efi","OC\OpenCore.efi","OC\config.plist","OC\Drivers\OpenRuntime.efi","OC\Drivers\HfsPlus.efi")) {
        $item = Join-Path $Path $relative
        if (-not (Test-Path -LiteralPath $item -PathType Leaf)) { throw "EFI validation failed: missing $relative in $Path" }
    }
    $config = Get-Content -LiteralPath (Join-Path $Path "OC\config.plist") -Raw
    if ($config -match "-radvesa" -or $config -match "-wegnoigpu") { throw "EFI validation failed: graphics isolation arguments remain." }
    if ($config -notmatch "iMac20,1") { throw "EFI validation failed: iMac20,1 SMBIOS marker absent." }
}

function Assert-Manifest {
    param(
        [Parameter(Mandatory=$true)][string]$ManifestPath,
        [Parameter(Mandatory=$true)][string]$EfiRoot
    )
    if (-not (Test-Path -LiteralPath $ManifestPath -PathType Leaf)) { throw "EFI manifest is missing." }
    $count = 0
    foreach ($line in Get-Content -LiteralPath $ManifestPath) {
        if ($line -notmatch '^([0-9a-fA-F]{64})\s+EFI/(.+)$') { throw "Malformed manifest line: $line" }
        $expected = $Matches[1].ToLowerInvariant()
        $relative = $Matches[2].Replace("/", "\")
        $file = Join-Path $EfiRoot $relative
        if (-not (Test-Path -LiteralPath $file -PathType Leaf)) { throw "Manifest file missing: $relative" }
        $actual = (Get-FileHash -LiteralPath $file -Algorithm SHA256).Hash.ToLowerInvariant()
        if ($actual -ne $expected) { throw "Manifest SHA256 mismatch: $relative" }
        $count++
    }
    if ($count -lt 10) { throw "Manifest unexpectedly contains only $count files." }
    Write-Host "EFI manifest verified: $count files." -ForegroundColor Green
}

Assert-UsbIdentity
Assert-RecoveryReadOnly

if ($Step -eq "Prepare") {
    if (-not (Test-Path -LiteralPath $ActiveEfi -PathType Container)) { throw "Current $ActiveEfi directory does not exist." }
    Assert-EfiFolder -Path $ActiveEfi

    $work = Join-Path $env:TEMP ("B460M-Baseline02-" + [guid]::NewGuid().ToString("N"))
    New-Item -ItemType Directory -Path $work | Out-Null
    $zip = Join-Path $work "B460M-Hackintosh-Baseline-EFI-02.zip"
    $extract = Join-Path $work "extract"
    $stage = Join-Path $Root ("EFI-BASELINE02-STAGING-" + [guid]::NewGuid().ToString("N"))

    try {
        Write-Host "Downloading Baseline EFI 02..."
        Invoke-WebRequest -Uri $BaseUrl -OutFile $zip -UseBasicParsing
        $zipHash = (Get-FileHash -LiteralPath $zip -Algorithm SHA256).Hash.ToLowerInvariant()
        if ($zipHash -ne $ExpectedZipSha256) { throw "ZIP SHA256 mismatch. Expected $ExpectedZipSha256; got $zipHash" }
        Expand-Archive -LiteralPath $zip -DestinationPath $extract -Force
        $efiSource = Join-Path $extract "EFI"
        $manifest = Join-Path $extract "EFI-MANIFEST.sha256"
        if (-not (Test-Path -LiteralPath $efiSource -PathType Container)) { throw "ZIP does not contain EFI directory." }
        Assert-Manifest -ManifestPath $manifest -EfiRoot $efiSource
        Assert-EfiFolder -Path $efiSource

        New-Item -ItemType Directory -Path $stage | Out-Null
        Get-ChildItem -LiteralPath $efiSource -Force | Copy-Item -Destination $stage -Recurse -Force
        Assert-Manifest -ManifestPath $manifest -EfiRoot $stage
        Assert-EfiFolder -Path $stage

        $state = [ordered]@{
            DriveLetter = $DriveLetter
            StagePath = $stage
            ZipSha256 = $ExpectedZipSha256
            PreparedAt = (Get-Date).ToString("o")
            WorkPath = $work
        }
        $state | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath $StatePath -Encoding UTF8
        Write-Host ""
        Write-Host "PREPARE_SUCCESS" -ForegroundColor Green
        Write-Host "Staging directory: $stage"
        Write-Host "Active EFI has NOT been changed."
        Write-Host "Next: run this same script with -Step Apply."
    }
    catch {
        if (Test-Path -LiteralPath $stage) { Write-Warning "Staging retained for inspection: $stage" }
        throw
    }
}
elseif ($Step -eq "Apply") {
    if (-not (Test-Path -LiteralPath $StatePath -PathType Leaf)) { throw "No prepared state found. Run -Step Prepare first." }
    $state = Get-Content -LiteralPath $StatePath -Raw | ConvertFrom-Json
    if ($state.DriveLetter -ne $DriveLetter) { throw "Prepared state belongs to another drive." }
    if ($state.ZipSha256 -ne $ExpectedZipSha256) { throw "Prepared package hash does not match this script version." }
    $stage = [string]$state.StagePath
    if (-not $stage.StartsWith($Root, [StringComparison]::OrdinalIgnoreCase)) { throw "Safety stop: staging path is outside the selected USB root." }
    if (-not (Test-Path -LiteralPath $stage -PathType Container)) { throw "Staging directory is missing: $stage" }
    Assert-EfiFolder -Path $stage
    $manifest = Join-Path ([string]$state.WorkPath) "extract\EFI-MANIFEST.sha256"
    Assert-Manifest -ManifestPath $manifest -EfiRoot $stage

    $backup = Join-Path $Root ("EFI-PREVIOUS-BASELINE02-" + [guid]::NewGuid().ToString("N"))
    $failed = Join-Path $Root ("EFI-FAILED-BASELINE02-" + [guid]::NewGuid().ToString("N"))
    if (-not (Test-Path -LiteralPath $ActiveEfi -PathType Container)) { throw "Active EFI directory is missing." }

    Write-Host "Only $ActiveEfi will be replaced."
    Write-Host "Current EFI backup: $backup"
    Write-Host "Recovery files and all other volumes remain untouched."
    $confirm = Read-Host "Type APPLY-BASELINE-02 to continue"
    if ($confirm -cne "APPLY-BASELINE-02") { throw "Cancelled. No EFI changes made." }

    $oldMoved = $false
    $newMoved = $false
    try {
        Rename-Item -LiteralPath $ActiveEfi -NewName (Split-Path $backup -Leaf)
        $oldMoved = $true
        Rename-Item -LiteralPath $stage -NewName "EFI"
        $newMoved = $true
        Assert-EfiFolder -Path $ActiveEfi
        Assert-Manifest -ManifestPath $manifest -EfiRoot $ActiveEfi
        Assert-RecoveryReadOnly
        Remove-Item -LiteralPath $StatePath -Force
        Write-Host ""
        Write-Host "BASELINE02_DEPLOYMENT_SUCCESS" -ForegroundColor Green
        Write-Host "Active EFI: $ActiveEfi"
        Write-Host "Rollback backup retained: $backup"
        Write-Host "No Recovery payload or partition was modified."
    }
    catch {
        Write-Error "Deployment validation failed: $($_.Exception.Message)"
        if ($newMoved -and (Test-Path -LiteralPath $ActiveEfi)) {
            Rename-Item -LiteralPath $ActiveEfi -NewName (Split-Path $failed -Leaf)
            Write-Warning "Failed candidate retained at $failed"
        }
        if ($oldMoved -and (Test-Path -LiteralPath $backup)) {
            Rename-Item -LiteralPath $backup -NewName "EFI"
            Write-Warning "Previous EFI restored."
        }
        throw
    }
}

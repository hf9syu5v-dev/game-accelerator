# Deploy the verified iGPU-isolation diagnostic EFI to the existing USB ESP.
# Windows PowerShell 5.1. Files only: no partition, format, disk initialization, or drive-letter changes.
[CmdletBinding()]
param([ValidatePattern('^[A-Z]$')][string]$DriveLetter = 'F')
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
$Model = 'LITEON I T LCS-128L9S'
$Serial = '000000123ADC'
$DiskBytes = [int64]128035676160
$Label = 'OC-SEQUOIA'
$EspGuid = 'c12a7328-f81f-11d2-ba4b-00a0c93ec93b'
$ZipHash = '27611d55fde098f6ff5ece81b53620e64baca390e70ad1b3022c3b2b643831e0'
$InnerName = 'B460M-iGPU-Isolation-Diagnostic-EFI.zip'
$Backup = 'EFI_PRE_IGPU_ISOLATION_BACKUP'
$Root = $DriveLetter + ':\'
$Work = Join-Path $env:TEMP ('B460M-IGPU-' + [guid]::NewGuid().ToString('N'))
$OldRenamed = $false
$NewCopied = $false
function Stop-Deploy([string]$Message) { throw $Message }
function Hash([string]$Path) { (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant() }

try {
    Write-Host '=== B460M iGPU-isolation EFI deployment ===' -ForegroundColor Cyan
    Write-Host 'FILES ONLY. No partitioning, formatting, cleaning, initialization, or drive-letter changes.'
    if ($PSVersionTable.PSVersion.Major -ne 5 -or $PSVersionTable.PSVersion.Minor -ne 1) { Stop-Deploy 'Use Windows PowerShell 5.1.' }
    $id = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($id)
    if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) { Stop-Deploy 'Run PowerShell as Administrator.' }

    $vol = Get-CimInstance Win32_LogicalDisk -Filter ("DeviceID='" + $DriveLetter + ":'")
    if (-not $vol -or $vol.FileSystem -ne 'FAT32' -or $vol.VolumeName -ne $Label) { Stop-Deploy "SAFETY_STOP: $Root must be FAT32 label $Label." }
    $part = Get-Partition -DriveLetter $DriveLetter -ErrorAction Stop
    if (([string]$part.GptType).Trim('{}').ToLowerInvariant() -ne $EspGuid) { Stop-Deploy 'SAFETY_STOP: volume is not a GPT EFI System Partition.' }
    $disk = Get-Disk -Number $part.DiskNumber -ErrorAction Stop
    $actualSerial = ([string]$disk.SerialNumber).Trim() -replace '\s',''
    if ($disk.BusType -ne 'USB' -or $disk.FriendlyName -ne $Model -or $actualSerial -ne $Serial -or
        [math]::Abs([double]$disk.Size - [double]$DiskBytes) -gt 2000000000 -or
        $disk.IsBoot -or $disk.IsSystem -or $disk.PartitionStyle -ne 'GPT') {
        Stop-Deploy 'SAFETY_STOP: disk identity mismatch. No files changed.'
    }
    Write-Host ("TARGET VERIFIED: Disk {0}; {1}; Serial {2}; {3}: FAT32 ESP" -f $disk.Number,$disk.FriendlyName,$actualSerial,$DriveLetter) -ForegroundColor Green

    $efiTarget = Join-Path $Root 'EFI'
    if (-not (Test-Path -LiteralPath $efiTarget -PathType Container)) { Stop-Deploy 'Existing EFI folder missing; refusing to initialize USB.' }
    if (Test-Path -LiteralPath (Join-Path $Root $Backup)) { Stop-Deploy "Backup $Backup already exists; refusing overwrite." }

    $downloads = Join-Path $env:USERPROFILE 'Downloads'
    $archives = @(Get-ChildItem -LiteralPath $downloads -Filter '*.zip' -File -Recurse -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -match '(?i)NO-IGPU|DIAGNOSTIC|15043941995' } | Sort-Object LastWriteTime -Descending)
    if (-not $archives.Count) { Stop-Deploy "Download the GitHub Artifact into $downloads first." }

    New-Item -ItemType Directory -Path $Work -Force | Out-Null
    $inner = $null
    foreach ($archive in $archives) {
        $dest = Join-Path $Work ([guid]::NewGuid().ToString('N'))
        New-Item -ItemType Directory -Path $dest -Force | Out-Null
        try { Expand-Archive -LiteralPath $archive.FullName -DestinationPath $dest -Force } catch { continue }
        $found = @(Get-ChildItem -LiteralPath $dest -Filter $InnerName -File -Recurse -ErrorAction SilentlyContinue)
        if ($found.Count -eq 1) { $inner = $found[0]; break }
    }
    if (-not $inner) { Stop-Deploy "Could not find $InnerName in downloaded Artifact." }
    if ((Hash $inner.FullName) -ne $ZipHash) { Stop-Deploy 'EFI ZIP SHA256 mismatch.' }
    Write-Host 'ARTIFACT_SHA256=PASS' -ForegroundColor Green

    $payload = Join-Path $Work 'payload'
    New-Item -ItemType Directory -Path $payload -Force | Out-Null
    Expand-Archive -LiteralPath $inner.FullName -DestinationPath $payload -Force
    $source = Join-Path $payload 'EFI'
    $manifest = Join-Path $payload 'BUILD-MANIFEST.md'
    foreach ($rel in @('BOOT\BOOTx64.efi','OC\OpenCore.efi','OC\config.plist','OC\Drivers\OpenRuntime.efi','OC\Drivers\HfsPlus.efi','OC\Kexts\UTBMap.kext\Contents\Info.plist')) {
        if (-not (Test-Path -LiteralPath (Join-Path $source $rel) -PathType Leaf)) { Stop-Deploy "Required EFI file missing: $rel" }
    }
    if (-not (Test-Path -LiteralPath $manifest -PathType Leaf)) { Stop-Deploy 'BUILD-MANIFEST.md missing.' }

    $python = Join-Path $env:ProgramFiles 'PyManager\python.exe'
    if (-not (Test-Path -LiteralPath $python)) { Stop-Deploy 'Previously confirmed Python Install Manager executable not found.' }
    $auditPy = Join-Path $Work 'audit.py'
    $auditCode = @'
import plistlib, sys
with open(sys.argv[1], "rb") as f: c = plistlib.load(f)
g = "7C436110-AB2A-4BBB-A880-FE41995C9F82"
a = c["NVRAM"]["Add"][g]["boot-args"].split()
assert "-wegnoigpu" in a and "-wegnoegpu" not in a
assert c["PlatformInfo"]["Generic"]["SystemProductName"] == "iMac20,1"
assert c["Misc"]["Security"]["ScanPolicy"] == 0x00200703
assert c["Misc"]["Boot"]["Timeout"] == 0
print("CONFIG_AUDIT=PASS")
print("BOOT_ARGS=" + " ".join(a))
'@
    [IO.File]::WriteAllText($auditPy,$auditCode,[Text.Encoding]::ASCII)
    $result = & $python $auditPy (Join-Path $source 'OC\config.plist')
    if ($LASTEXITCODE -ne 0) { Stop-Deploy "Config audit failed: $result" }
    $result | ForEach-Object { Write-Host $_ -ForegroundColor Green }
    $map = Get-Content -LiteralPath (Join-Path $source 'OC\Kexts\UTBMap.kext\Contents\Info.plist') -Raw
    if ($map -match 'HS04|SS04') { Stop-Deploy 'HS04 or SS04 found in UTBMap.' }

    $lines = Get-Content -LiteralPath $manifest
    $count = 0
    foreach ($line in $lines) {
        if ($line -match '^([0-9a-fA-F]{64})\s+build/EFI/(.+)$') {
            $rel = $matches[2].Replace('/','\')
            $file = Join-Path $source $rel
            if (-not (Test-Path -LiteralPath $file -PathType Leaf) -or (Hash $file) -ne $matches[1].ToLowerInvariant()) { Stop-Deploy "Source manifest mismatch: $rel" }
            $count++
        }
    }
    if ($count -lt 20) { Stop-Deploy "Manifest verified only $count files." }
    Write-Host "SOURCE_MANIFEST=PASS ($count files)" -ForegroundColor Green

    $confirm = Read-Host ("Type exactly DEPLOY IGPU DIAGNOSTIC EFI to replace only " + $Root + 'EFI')
    if ($confirm -cne 'DEPLOY IGPU DIAGNOSTIC EFI') { Stop-Deploy 'Cancelled; USB unchanged.' }

    Rename-Item -LiteralPath $efiTarget -NewName $Backup
    $OldRenamed = $true
    try {
        Copy-Item -LiteralPath $source -Destination $Root -Recurse
        $NewCopied = $true
        $check = & $python $auditPy (Join-Path $Root 'EFI\OC\config.plist')
        if ($LASTEXITCODE -ne 0) { throw "Copied config audit failed: $check" }
        foreach ($line in $lines) {
            if ($line -match '^([0-9a-fA-F]{64})\s+build/EFI/(.+)$') {
                $rel = $matches[2].Replace('/','\')
                $file = Join-Path (Join-Path $Root 'EFI') $rel
                if (-not (Test-Path -LiteralPath $file -PathType Leaf) -or (Hash $file) -ne $matches[1].ToLowerInvariant()) { throw "USB copy hash mismatch: $rel" }
            }
        }
        if (-not (Test-Path -LiteralPath (Join-Path $Root 'BaseSystem.dmg')) -or -not (Test-Path -LiteralPath (Join-Path $Root 'BaseSystem.chunklist'))) {
            throw 'Recovery files are missing; refusing to report deployment success.'
        }
        Write-Host 'DEPLOYMENT_SUCCESS=PASS' -ForegroundColor Green
        Write-Host "EFI_BACKUP=$Backup"
        Write-Host "EFI_MANIFEST_HASHES=PASS ($count files)"
        Write-Host 'APPLE_RECOVERY_FILES=PRESERVED'
        Write-Host 'HS04_SS04=ABSENT'
        Write-Host 'INTERNAL_DISKS=NOT_TOUCHED'
        Write-Host 'PARTITION_FORMAT_OPERATIONS=NONE'
    } catch {
        Write-Warning 'Deployment verification failed; restoring previous EFI.'
        if ($NewCopied -and (Test-Path -LiteralPath (Join-Path $Root 'EFI'))) { Remove-Item -LiteralPath (Join-Path $Root 'EFI') -Recurse -Force }
        if ($OldRenamed -and (Test-Path -LiteralPath (Join-Path $Root $Backup))) {
            Rename-Item -LiteralPath (Join-Path $Root $Backup) -NewName 'EFI'
            $OldRenamed = $false
        }
        throw
    }
} catch {
    Write-Host ("ERROR: " + $_.Exception.Message) -ForegroundColor Red
    exit 1
} finally {
    if (Test-Path -LiteralPath $Work) { Remove-Item -LiteralPath $Work -Recurse -Force -ErrorAction SilentlyContinue }
}

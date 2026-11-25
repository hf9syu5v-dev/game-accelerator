# Validated contents-only deployment of the RX 570 VESA diagnostic EFI.
#requires -RunAsAdministrator
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

$TargetDrive = 'F'
$ExpectedModel = 'LITEON I T LCS-128L9S'
$ExpectedSerial = '000000123ADC'
$ExpectedDiskBytes = [int64]128035676160
$EspGuid = 'c12a7328-f81f-11d2-ba4b-00a0c93ec93b'
$ArtifactUrl = 'https://github.com/hf9syu5v-dev/game-accelerator/releases/download/b460m-rx570-vesa-diagnostic/B460M-RX570-VESA-Diagnostic-EFI.zip'
$ArtifactSha256 = 'fda623c96ed4ea8370ad1e985a1a2f5ac7e9a651815c57e959bea0d28a026daf'
$BackupName = 'EFI-PREVIOUS-PORT4-DIAGNOSTIC'
$StageName = 'EFI-RX570-VESA-STAGING'
$Work = Join-Path $env:TEMP ('B460M-RX570-VESA-' + [guid]::NewGuid().ToString('N'))

function Stop-Deploy([string]$Message) { throw $Message }
function Get-Sha256([string]$Path) { (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant() }

try {
    Write-Host '=== B460M RX570 VESA DIAGNOSTIC DEPLOYMENT ===' -ForegroundColor Cyan
    Write-Host 'CONTENTS ONLY: no disk/partition/format/drive-letter operations.'

    $root = $TargetDrive + ':\'
    $logical = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='$($TargetDrive):'"
    if (!$logical -or $logical.FileSystem -ne 'FAT32') { Stop-Deploy 'SAFETY_STOP: F: must be FAT32.' }
    $part = Get-Partition -DriveLetter $TargetDrive -ErrorAction Stop
    if (([string]$part.GptType).Trim('{}').ToLowerInvariant() -ne $EspGuid) { Stop-Deploy 'SAFETY_STOP: F: is not the expected GPT EFI System Partition.' }
    $disk = Get-Disk -Number $part.DiskNumber -ErrorAction Stop
    if ($disk.FriendlyName -ne $ExpectedModel -or $disk.SerialNumber.Trim() -ne $ExpectedSerial -or $disk.BusType -ne 'USB' -or [math]::Abs([double]$disk.Size - [double]$ExpectedDiskBytes) -gt 2MB -or $disk.IsBoot -or $disk.IsSystem -or $disk.PartitionStyle -ne 'GPT') {
        Stop-Deploy 'SAFETY_STOP: F: is not the exact authorized LITEON USB ESP. Nothing changed.'
    }
    Write-Host ("TARGET VERIFIED: Disk {0}; {1}; Serial {2}; F: FAT32 ESP." -f $disk.Number,$disk.FriendlyName,$disk.SerialNumber) -ForegroundColor Green

    $currentEfi = Join-Path $root 'EFI'
    $backupEfi = Join-Path $root $BackupName
    $stageEfi = Join-Path $root $StageName
    if (!(Test-Path -LiteralPath (Join-Path $currentEfi 'BOOT\BOOTx64.efi') -PathType Leaf)) { Stop-Deploy 'SAFETY_STOP: current EFI folder is missing or incomplete.' }
    if (Test-Path -LiteralPath $backupEfi) { Stop-Deploy "SAFETY_STOP: $BackupName already exists; refusing to overwrite any backup." }
    if (Test-Path -LiteralPath $stageEfi) { Stop-Deploy "SAFETY_STOP: $StageName already exists; refusing to overwrite it." }
    if (!(Test-Path -LiteralPath (Join-Path $root 'com.apple.recovery.boot\BaseSystem.dmg') -PathType Leaf)) { Stop-Deploy 'SAFETY_STOP: Recovery folder missing; no changes made.' }

    New-Item -ItemType Directory -Path $Work -Force | Out-Null
    $zip = Join-Path $Work 'B460M-RX570-VESA-Diagnostic-EFI.zip'
    Invoke-WebRequest -Uri $ArtifactUrl -OutFile $zip -UseBasicParsing
    if (!(Test-Path -LiteralPath $zip -PathType Leaf) -or (Get-Item $zip).Length -lt 1MB) { Stop-Deploy 'ARTIFACT_DOWNLOAD_FAILED: package missing or unexpectedly small.' }
    if ((Get-Sha256 $zip) -ne $ArtifactSha256) { Stop-Deploy 'ARTIFACT_SHA256_MISMATCH: refusing deployment.' }
    Write-Host 'ARTIFACT_SHA256=PASS' -ForegroundColor Green

    Expand-Archive -LiteralPath $zip -DestinationPath (Join-Path $Work 'package') -Force
    $sourceEfi = Join-Path (Join-Path $Work 'package') 'EFI'
    foreach ($rel in @('BOOT\BOOTx64.efi','OC\OpenCore.efi','OC\config.plist','OC\Kexts\UTBMap.kext\Contents\Info.plist','OC\Kexts\WhateverGreen.kext\Contents\Info.plist')) {
        if (!(Test-Path -LiteralPath (Join-Path $sourceEfi $rel) -PathType Leaf)) { Stop-Deploy "EFI_REQUIRED_FILE_MISSING: $rel" }
    }
    [xml]$map = Get-Content -LiteralPath (Join-Path $sourceEfi 'OC\Kexts\UTBMap.kext\Contents\Info.plist') -Raw
    $mapText = $map.OuterXml
    if ($mapText -notmatch '<key>HS04</key>' -or $mapText -notmatch '<key>SS04</key>') { Stop-Deploy 'UTBMAP_CHECK_FAILED: HS04/SS04 pair absent.' }
    $configText = Get-Content -LiteralPath (Join-Path $sourceEfi 'OC\config.plist') -Raw
    if ($configText -notmatch '-wegnoigpu' -or $configText -match '-wegnoegpu' -or $configText -notmatch '-radvesa' -or $configText -notmatch 'iMac20,1') { Stop-Deploy 'CONFIG_CHECK_FAILED: expected iMac20,1, -wegnoigpu and -radvesa; RX 570 must remain enabled.' }
    $sourceFiles = @(Get-ChildItem -LiteralPath $sourceEfi -File -Recurse)
    if ($sourceFiles.Count -lt 20) { Stop-Deploy 'EFI_FILE_COUNT_SUSPICIOUS.' }

    New-Item -ItemType Directory -Path $stageEfi | Out-Null
    Get-ChildItem -LiteralPath $sourceEfi -Force | ForEach-Object { Copy-Item -LiteralPath $_.FullName -Destination $stageEfi -Recurse }
    foreach ($f in $sourceFiles) {
        $rel = $f.FullName.Substring($sourceEfi.Length).TrimStart([char]92)
        $dest = Join-Path $stageEfi $rel
        if (!(Test-Path -LiteralPath $dest -PathType Leaf) -or (Get-Sha256 $dest) -ne (Get-Sha256 $f.FullName)) { Stop-Deploy "STAGING_SHA256_MISMATCH: $rel" }
    }
    Write-Host "STAGING_SHA256=PASS; FILES=$($sourceFiles.Count)" -ForegroundColor Green

    Rename-Item -LiteralPath $currentEfi -NewName $BackupName
    try {
        Rename-Item -LiteralPath $stageEfi -NewName 'EFI'
    } catch {
        Rename-Item -LiteralPath $backupEfi -NewName 'EFI'
        throw
    }

    foreach ($f in $sourceFiles) {
        $rel = $f.FullName.Substring($sourceEfi.Length).TrimStart([char]92)
        $dest = Join-Path $currentEfi $rel
        if (!(Test-Path -LiteralPath $dest -PathType Leaf) -or (Get-Sha256 $dest) -ne (Get-Sha256 $f.FullName)) {
            Stop-Deploy "ACTIVE_EFI_SHA256_MISMATCH: $rel. Original EFI remains preserved at $BackupName."
        }
    }

    Write-Host ''
    Write-Host 'RX570_VESA_DIAGNOSTIC_DEPLOYMENT_SUCCESS' -ForegroundColor Green
    Write-Host 'ACTIVE_EFI=F:\EFI (USB port 4 HS04+SS04; AMD acceleration disabled by -radvesa)'
    Write-Host "PREVIOUS_EFI_PRESERVED=F:\$BackupName"
    Write-Host "EFI_FILES_SHA256_VERIFIED=$($sourceFiles.Count)"
    Write-Host 'RECOVERY_AND_ALL_DISK_PARTITIONS=UNCHANGED'
    Write-Host 'INTERNAL_DISKS=NOT_MODIFIED'
}
finally {
    if (Test-Path -LiteralPath $Work) { Remove-Item -LiteralPath $Work -Recurse -Force -ErrorAction SilentlyContinue }
}

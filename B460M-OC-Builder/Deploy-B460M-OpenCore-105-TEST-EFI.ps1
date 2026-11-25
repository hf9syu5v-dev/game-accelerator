#requires -RunAsAdministrator
[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

# Deploy the already-downloaded OpenCore 1.0.5 test EFI ZIP to the verified USB ESP.
$TargetDrive = 'F'
$ExpectedModel = 'LITEON I T LCS-128L9S'
$ExpectedSerial = '000000123ADC'
$ExpectedDiskBytes = [int64]128035676160
$EspGuid = 'c12a7328-f81f-11d2-ba4b-00a0c93ec93b'
$ZipPath = Join-Path $env:USERPROFILE 'Downloads\B460M-PLUS-OpenCore-1.0.5-Sequoia-EFI-iMac20,1-TEST.zip'
$ExpectedZipSha256 = 'f799c3b0be0a619230e1301f657f553e9f5db7edd7bd91ac9a4820c47442c38f'
$Work = Join-Path $env:TEMP ('B460M-OC105-DEPLOY-' + [guid]::NewGuid().ToString('N'))
$StageName = 'EFI-OC105-STAGING'
$OldName = 'EFI-OC105-OLD-TEMP'

function Stop-Deploy([string]$Message) { throw $Message }
function Get-Sha256([string]$Path) { (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant() }

try {
    Write-Host '=== B460M OpenCore 1.0.5 TEST EFI DEPLOYMENT ===' -ForegroundColor Cyan
    Write-Host 'Using the ZIP already in Downloads; no EFI download is performed.'

    if (!(Test-Path -LiteralPath $ZipPath -PathType Leaf)) {
        Stop-Deploy "ZIP_NOT_FOUND: $ZipPath"
    }
    if ((Get-Sha256 $ZipPath) -ne $ExpectedZipSha256) {
        Stop-Deploy 'ZIP_SHA256_MISMATCH: the downloaded EFI is not the verified artifact.'
    }
    Write-Host 'ZIP_SHA256=PASS' -ForegroundColor Green

    $logical = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='$($TargetDrive):'"
    if (!$logical -or $logical.FileSystem -ne 'FAT32') { Stop-Deploy 'SAFETY_STOP: F: must be FAT32.' }

    $part = Get-Partition -DriveLetter $TargetDrive -ErrorAction Stop
    if (([string]$part.GptType).Trim('{}').ToLowerInvariant() -ne $EspGuid) {
        Stop-Deploy 'SAFETY_STOP: F: is not a GPT EFI System Partition.'
    }

    $disk = Get-Disk -Number $part.DiskNumber -ErrorAction Stop
    if ($disk.FriendlyName -ne $ExpectedModel -or
        $disk.SerialNumber.Trim() -ne $ExpectedSerial -or
        $disk.BusType -ne 'USB' -or
        [math]::Abs([double]$disk.Size - [double]$ExpectedDiskBytes) -gt 2MB -or
        $disk.IsBoot -or $disk.IsSystem -or $disk.PartitionStyle -ne 'GPT') {
        Stop-Deploy 'SAFETY_STOP: F: is not the authorized LITEON USB ESP. Nothing was changed.'
    }

    $root = $TargetDrive + ':\'
    if (!(Test-Path -LiteralPath (Join-Path $root 'com.apple.recovery.boot\BaseSystem.dmg') -PathType Leaf)) {
        Stop-Deploy 'SAFETY_STOP: Recovery BaseSystem.dmg not found on F:. Nothing was changed.'
    }

    $activeEfi = Join-Path $root 'EFI'
    $stageEfi = Join-Path $root $StageName
    $oldEfi = Join-Path $root $OldName

    if (!(Test-Path -LiteralPath (Join-Path $activeEfi 'BOOT\BOOTx64.efi') -PathType Leaf)) {
        Stop-Deploy 'SAFETY_STOP: existing F:\EFI is missing or incomplete.'
    }
    if (Test-Path -LiteralPath $stageEfi) { Stop-Deploy "SAFETY_STOP: $StageName already exists." }
    if (Test-Path -LiteralPath $oldEfi) { Stop-Deploy "SAFETY_STOP: $OldName already exists." }

    Write-Host ("TARGET VERIFIED: Disk {0}; {1}; Serial {2}; F: FAT32 ESP." -f $disk.Number,$disk.FriendlyName,$disk.SerialNumber) -ForegroundColor Green

    New-Item -ItemType Directory -Path $Work -Force | Out-Null
    $package = Join-Path $Work 'package'
    Expand-Archive -LiteralPath $ZipPath -DestinationPath $package -Force
    $sourceEfi = Join-Path $package 'EFI'

    $required = @(
        'BOOT\BOOTx64.efi',
        'OC\OpenCore.efi',
        'OC\config.plist',
        'OC\Drivers\OpenRuntime.efi',
        'OC\Drivers\HfsPlus.efi',
        'OC\ACPI\SSDT-AWAC.aml',
        'OC\ACPI\SSDT-EC-USBX-DESKTOP.aml',
        'OC\ACPI\SSDT-PLUG-DRTNIA.aml'
    )
    foreach ($rel in $required) {
        if (!(Test-Path -LiteralPath (Join-Path $sourceEfi $rel) -PathType Leaf)) {
            Stop-Deploy "EFI_REQUIRED_FILE_MISSING: $rel"
        }
    }

    [xml]$plist = Get-Content -LiteralPath (Join-Path $sourceEfi 'OC\config.plist') -Raw
    if (!$plist.plist) { Stop-Deploy 'CONFIG_PLIST_XML_INVALID.' }
    $plistText = $plist.OuterXml
    if ($plistText -notmatch 'iMac20,1' -or
        $plistText -notmatch 'C02J5NYBPN5T' -or
        $plistText -notmatch 'C02231609GUPHC1JC' -or
        $plistText -notmatch '78BDA777-E7DE-493E-BB3C-DE76B4D3AEE6') {
        Stop-Deploy 'CONFIG_SMBIOS_CHECK_FAILED: expected approved iMac20,1 test identity not found.'
    }

    $sourceFiles = @(Get-ChildItem -LiteralPath $sourceEfi -File -Recurse)
    if ($sourceFiles.Count -lt 20) { Stop-Deploy 'EFI_FILE_COUNT_SUSPICIOUS.' }

    New-Item -ItemType Directory -Path $stageEfi | Out-Null
    Get-ChildItem -LiteralPath $sourceEfi -Force | ForEach-Object {
        Copy-Item -LiteralPath $_.FullName -Destination $stageEfi -Recurse
    }

    foreach ($file in $sourceFiles) {
        $rel = $file.FullName.Substring($sourceEfi.Length).TrimStart([char]92)
        $dest = Join-Path $stageEfi $rel
        if (!(Test-Path -LiteralPath $dest -PathType Leaf) -or
            (Get-Sha256 $dest) -ne (Get-Sha256 $file.FullName)) {
            Stop-Deploy "STAGING_SHA256_MISMATCH: $rel"
        }
    }
    Write-Host "STAGING_SHA256=PASS; FILES=$($sourceFiles.Count)" -ForegroundColor Green

    # Swap directories only after the staged EFI has passed file-by-file hash checks.
    Rename-Item -LiteralPath $activeEfi -NewName $OldName
    try {
        Rename-Item -LiteralPath $stageEfi -NewName 'EFI'
    } catch {
        Rename-Item -LiteralPath $oldEfi -NewName 'EFI'
        throw
    }

    foreach ($file in $sourceFiles) {
        $rel = $file.FullName.Substring($sourceEfi.Length).TrimStart([char]92)
        $dest = Join-Path $activeEfi $rel
        if (!(Test-Path -LiteralPath $dest -PathType Leaf) -or
            (Get-Sha256 $dest) -ne (Get-Sha256 $file.FullName)) {
            # Restore the old EFI if post-deployment verification fails.
            Rename-Item -LiteralPath $activeEfi -NewName $StageName
            Rename-Item -LiteralPath $oldEfi -NewName 'EFI'
            Stop-Deploy "ACTIVE_EFI_SHA256_MISMATCH: $rel. Previous EFI restored."
        }
    }

    # New EFI is fully verified. Remove only the old F:\EFI directory.
    Remove-Item -LiteralPath $oldEfi -Recurse -Force

    Write-Host ''
    Write-Host 'OPENCORE_1.0.5_TEST_EFI_DEPLOYMENT_SUCCESS' -ForegroundColor Green
    Write-Host 'ACTIVE_EFI=F:\EFI'
    Write-Host "EFI_FILES_SHA256_VERIFIED=$($sourceFiles.Count)"
    Write-Host 'OLD_F:\EFI=REPLACED'
    Write-Host 'F:\com.apple.recovery.boot=UNCHANGED'
    Write-Host 'E:\SEQUOIA_TEST_PARTITION=UNCHANGED'
    Write-Host 'DISK_PARTITIONS_AND_FORMAT=UNCHANGED'
    Write-Host 'INTERNAL_DISKS=NOT_MODIFIED'
}
finally {
    if (Test-Path -LiteralPath $Work) {
        Remove-Item -LiteralPath $Work -Recurse -Force -ErrorAction SilentlyContinue
    }
}

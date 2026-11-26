# Deploy the same-model keyboard-reference EFI over the restored RX570 VESA baseline.
#requires -RunAsAdministrator
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

$Drive = 'F'
$Model = 'LITEON I T LCS-128L9S'
$Serial = '000000123ADC'
$DiskBytes = [int64]128035676160
$EspGuid = 'c12a7328-f81f-11d2-ba4b-00a0c93ec93b'
$ArtifactUrl = 'https://github.com/hf9syu5v-dev/game-accelerator/releases/download/b460m-same-board-keyboard-reference/B460M-Same-Board-Keyboard-Reference-EFI.zip'
$ArtifactSha256 = '996405a64a7352a868a13208913448c8d10cc16ac556b2a24fec2b58428059f8'
$RunSuffix = [guid]::NewGuid().ToString('N').Substring(0,8)
$BackupName = 'EFI-PREVIOUS-SAME-BOARD-REFERENCE-BASELINE-' + $RunSuffix
$StageName = 'EFI-SAME-BOARD-REFERENCE-STAGING-' + $RunSuffix
$FailedName = 'EFI-SAME-BOARD-REFERENCE-FAILED-' + $RunSuffix
$BaseSystemSha256 = '7314eb401f5e84087f621b3599f0ad21ca3cdcc2685ea2da7f76806792328e20'
$ChunklistSha256 = 'dbf262b83a16d55f1b2d8ce8ce95986561f8e889719524ea4b7aa22a2417ca27'

function Stop-Safe([string]$Message) { throw $Message }
function Get-Sha([string]$Path) { (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant() }

$Root = $Drive + ':\'
$Current = Join-Path $Root 'EFI'
$Backup = Join-Path $Root $BackupName
$Stage = Join-Path $Root $StageName
$Failed = Join-Path $Root $FailedName
$Work = Join-Path $env:TEMP ('B460M-SameBoard-Reference-' + [guid]::NewGuid().ToString('N'))

try {
    Write-Host '=== SAME-BOARD KEYBOARD REFERENCE EFI DEPLOYMENT ===' -ForegroundColor Cyan
    Write-Host 'Only F:\EFI may be replaced. Recovery and all disk partitions remain untouched.'

    $logical = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='$($Drive):'"
    if (!$logical -or $logical.FileSystem -ne 'FAT32') { Stop-Safe 'SAFETY_STOP: F: is not FAT32.' }
    $part = Get-Partition -DriveLetter $Drive -ErrorAction Stop
    if (([string]$part.GptType).Trim('{}').ToLowerInvariant() -ne $EspGuid) { Stop-Safe 'SAFETY_STOP: F: is not the expected EFI System Partition.' }
    $disk = Get-Disk -Number $part.DiskNumber -ErrorAction Stop
    if ($disk.FriendlyName -ne $Model -or $disk.SerialNumber.Trim() -ne $Serial -or $disk.BusType -ne 'USB' -or [math]::Abs([double]$disk.Size - [double]$DiskBytes) -gt 2MB -or $disk.IsBoot -or $disk.IsSystem -or $disk.PartitionStyle -ne 'GPT') {
        Stop-Safe 'SAFETY_STOP: F: is not the exact authorized LITEON USB disk. Nothing changed.'
    }
    Write-Host 'TARGET_USB_IDENTITY=PASS' -ForegroundColor Green

    $Recovery = Join-Path $Root 'com.apple.recovery.boot'
    $dmg = Join-Path $Recovery 'BaseSystem.dmg'
    $chunk = Join-Path $Recovery 'BaseSystem.chunklist'
    if (!(Test-Path -LiteralPath $dmg -PathType Leaf) -or !(Test-Path -LiteralPath $chunk -PathType Leaf)) { Stop-Safe 'SAFETY_STOP: Recovery payload missing.' }
    if ((Get-Sha $dmg) -ne $BaseSystemSha256 -or (Get-Sha $chunk) -ne $ChunklistSha256) { Stop-Safe 'SAFETY_STOP: Recovery payload hash mismatch. No changes made.' }
    Write-Host 'RECOVERY_PAYLOAD_READ_ONLY_HASH_CHECK=PASS' -ForegroundColor Green

    if (!(Test-Path -LiteralPath (Join-Path $Current 'BOOT\BOOTx64.efi') -PathType Leaf)) { Stop-Safe 'SAFETY_STOP: active F:\EFI is missing/incomplete.' }
    if (!(Test-Path -LiteralPath (Join-Path $Baseline 'BOOT\BOOTx64.efi') -PathType Leaf) -or !(Test-Path -LiteralPath (Join-Path $Baseline 'OC\config.plist') -PathType Leaf)) {
        Stop-Safe "SAFETY_STOP: preserved VESA baseline F:\$KnownBaseline missing/incomplete."
    }
    foreach ($p in @($Backup,$Stage,$Failed)) {
        if (Test-Path -LiteralPath $p) { Stop-Safe "SAFETY_STOP: $([IO.Path]::GetFileName($p)) already exists; refusing overwrite." }
    }

    # Confirm the active EFI is the requested VESA baseline before layering the test.
    $currentConfig = Get-Content -LiteralPath (Join-Path $Current 'OC\config.plist') -Raw
    if ($currentConfig -notmatch '-radvesa' -or $currentConfig -notmatch '-wegnoigpu' -or $currentConfig -match '-wegnoegpu' -or $currentConfig -notmatch 'iMac20,1') {
        Stop-Safe 'ACTIVE_EFI_IS_NOT_VESA_BASELINE: restore the saved VESA baseline first.'
    }

    New-Item -ItemType Directory -Path $Work | Out-Null
    $zip = Join-Path $Work 'B460M-Same-Board-Keyboard-Reference-EFI.zip'
    Invoke-WebRequest -Uri $ArtifactUrl -OutFile $zip -UseBasicParsing
    if (!(Test-Path -LiteralPath $zip -PathType Leaf) -or (Get-Sha $zip) -ne $ArtifactSha256) { Stop-Safe 'ARTIFACT_SHA256_MISMATCH: refusing deployment.' }
    Write-Host 'ARTIFACT_SHA256=PASS' -ForegroundColor Green

    $package = Join-Path $Work 'package'
    Expand-Archive -LiteralPath $zip -DestinationPath $package
    $Source = Join-Path $package 'EFI'
    foreach ($rel in @('BOOT\BOOTx64.efi','OC\OpenCore.efi','OC\config.plist','OC\Kexts\UTBMap.kext\Contents\Info.plist')) {
        if (!(Test-Path -LiteralPath (Join-Path $Source $rel) -PathType Leaf)) { Stop-Safe "EFI_REQUIRED_FILE_MISSING: $rel" }
    }
    $cfg = Get-Content -LiteralPath (Join-Path $Source 'OC\config.plist') -Raw
    foreach ($required in @('KeySupport','KeySupportMode','Builtin','GraphicsInputMirroring','PollAppleHotKeys','-radvesa','-wegnoigpu','iMac20,1')) {
        if ($cfg -notmatch [regex]::Escape($required)) { Stop-Safe "REFERENCE_CONFIG_ASSERTION_MISSING: $required" }
    }
    if ($cfg -match 'OpenUsbKbDxe\.efi|Ps2KeyboardDxe\.efi') { Stop-Safe 'Unexpected alternative keyboard driver found in reference profile.' }
    $sourceFiles = @(Get-ChildItem -LiteralPath $Source -File -Recurse)
    if ($sourceFiles.Count -lt 20) { Stop-Safe 'EFI_FILE_COUNT_SUSPICIOUS.' }

    New-Item -ItemType Directory -Path $Stage | Out-Null
    Get-ChildItem -LiteralPath $Source -Force | ForEach-Object { Copy-Item -LiteralPath $_.FullName -Destination $Stage -Recurse }
    $stageFiles = @(Get-ChildItem -LiteralPath $Stage -File -Recurse)
    if ($stageFiles.Count -ne $sourceFiles.Count) { Stop-Safe 'STAGING_FILE_COUNT_MISMATCH.' }
    foreach ($f in $sourceFiles) {
        $rel = $f.FullName.Substring($Source.Length).TrimStart([char]92)
        $dst = Join-Path $Stage $rel
        if (!(Test-Path -LiteralPath $dst -PathType Leaf) -or (Get-Sha $dst) -ne (Get-Sha $f.FullName)) { Stop-Safe "STAGING_SHA256_MISMATCH: $rel" }
    }
    Write-Host "STAGING_SHA256=PASS; FILES=$($sourceFiles.Count)" -ForegroundColor Green

    $CurrentRenamed = $false
    try {
        Rename-Item -LiteralPath $Current -NewName $BackupName
        $CurrentRenamed = $true
        Rename-Item -LiteralPath $Stage -NewName 'EFI'
        foreach ($f in $sourceFiles) {
            $rel = $f.FullName.Substring($Source.Length).TrimStart([char]92)
            $dst = Join-Path $Current $rel
            if (!(Test-Path -LiteralPath $dst -PathType Leaf) -or (Get-Sha $dst) -ne (Get-Sha $f.FullName)) { throw "ACTIVE_EFI_SHA256_MISMATCH: $rel" }
        }
    } catch {
        if (Test-Path -LiteralPath $Current) {
            if (!(Test-Path -LiteralPath $Failed)) { Rename-Item -LiteralPath $Current -NewName $FailedName }
        }
        if ($CurrentRenamed -and (Test-Path -LiteralPath $Backup) -and !(Test-Path -LiteralPath $Current)) {
            Rename-Item -LiteralPath $Backup -NewName 'EFI'
        }
        throw
    }

    Write-Host ''
    Write-Host 'SAME_BOARD_REFERENCE_EFI_DEPLOYMENT_SUCCESS' -ForegroundColor Green
    Write-Host 'ACTIVE=F:\EFI (exact-model B460M-PLUS keyboard input reference transplant)'
    Write-Host "PREVIOUS_ACTIVE_VESA_BASELINE_PRESERVED=F:\$BackupName"
    Write-Host "ORIGINAL_VESA_BASELINE_PRESERVED=F:\$KnownBaseline"
    Write-Host "FILES_SHA256_VERIFIED=$($sourceFiles.Count)"
    Write-Host 'RECOVERY_AND_ALL_PARTITIONS=UNCHANGED'
    Write-Host 'INTERNAL_DISKS=NOT_MODIFIED'
}
finally {
    if (Test-Path -LiteralPath $Work) { Remove-Item -LiteralPath $Work -Recurse -Force -ErrorAction SilentlyContinue }
}

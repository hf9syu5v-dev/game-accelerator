# Restore the previously verified RX570 VESA EFI as the keyboard-test baseline.
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
$BaselineName = 'EFI-PREVIOUS-RX570-VESA-DIAGNOSTIC'
$BaselineUrl = 'https://github.com/hf9syu5v-dev/game-accelerator/releases/download/b460m-rx570-vesa-diagnostic/B460M-RX570-VESA-Diagnostic-EFI.zip'
$BaselineZipSha256 = 'fda623c96ed4ea8370ad1e985a1a2f5ac7e9a651815c57e959bea0d28a026daf'
$Work = Join-Path $env:TEMP ('B460M-VESA-Baseline-' + [guid]::NewGuid().ToString('N'))
$RunSuffix = [guid]::NewGuid().ToString('N').Substring(0,8)
$BackupName = 'EFI-PREVIOUS-BEFORE-SAME-BOARD-REFERENCE-' + $RunSuffix
$StageName = 'EFI-SAME-BOARD-BASELINE-STAGING-' + $RunSuffix
$FailedName = 'EFI-SAME-BOARD-BASELINE-FAILED-' + $RunSuffix
$BaseSystemSha256 = '7314eb401f5e84087f621b3599f0ad21ca3cdcc2685ea2da7f76806792328e20'
$ChunklistSha256 = 'dbf262b83a16d55f1b2d8ce8ce95986561f8e889719524ea4b7aa22a2417ca27'

function Stop-Safe([string]$Message) { throw $Message }
function Get-Sha([string]$Path) { (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant() }

$Root = $Drive + ':\'
$Current = Join-Path $Root 'EFI'
$Baseline = Join-Path $Work 'EFI'
$Backup = Join-Path $Root $BackupName
$Stage = Join-Path $Root $StageName
$Failed = Join-Path $Root $FailedName

Write-Host '=== RESTORE KNOWN-GOOD RX570 VESA BASELINE ===' -ForegroundColor Cyan
Write-Host 'Only F:\EFI may be replaced. Recovery and all partitions remain untouched.'

$logical = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='$($Drive):'"
if (!$logical -or $logical.FileSystem -ne 'FAT32') { Stop-Safe 'SAFETY_STOP: F: is not FAT32.' }
$part = Get-Partition -DriveLetter $Drive -ErrorAction Stop
if (([string]$part.GptType).Trim('{}').ToLowerInvariant() -ne $EspGuid) { Stop-Safe 'SAFETY_STOP: F: is not the expected EFI System Partition.' }
$disk = Get-Disk -Number $part.DiskNumber -ErrorAction Stop
if ($disk.FriendlyName -ne $Model -or $disk.SerialNumber.Trim() -ne $Serial -or $disk.BusType -ne 'USB' -or [math]::Abs([double]$disk.Size - [double]$DiskBytes) -gt 2MB -or $disk.IsBoot -or $disk.IsSystem -or $disk.PartitionStyle -ne 'GPT') {
    Stop-Safe 'SAFETY_STOP: F: is not the exact authorized LITEON USB disk. Nothing changed.'
}
Write-Host 'TARGET_USB_IDENTITY=PASS' -ForegroundColor Green

# Read-only integrity checks for Recovery payload; do not write to this directory.
$Recovery = Join-Path $Root 'com.apple.recovery.boot'
$dmg = Join-Path $Recovery 'BaseSystem.dmg'
$chunk = Join-Path $Recovery 'BaseSystem.chunklist'
if (!(Test-Path -LiteralPath $dmg -PathType Leaf) -or !(Test-Path -LiteralPath $chunk -PathType Leaf)) { Stop-Safe 'SAFETY_STOP: Recovery payload missing.' }
if ((Get-Sha $dmg) -ne $BaseSystemSha256 -or (Get-Sha $chunk) -ne $ChunklistSha256) { Stop-Safe 'SAFETY_STOP: Recovery payload hash mismatch. No changes made.' }
Write-Host 'RECOVERY_PAYLOAD_READ_ONLY_HASH_CHECK=PASS' -ForegroundColor Green

if (!(Test-Path -LiteralPath (Join-Path $Current 'BOOT\BOOTx64.efi') -PathType Leaf)) { Stop-Safe 'SAFETY_STOP: active F:\EFI is missing/incomplete.' }
if (!(Test-Path -LiteralPath (Join-Path $Baseline 'BOOT\BOOTx64.efi') -PathType Leaf) -or !(Test-Path -LiteralPath (Join-Path $Baseline 'OC\config.plist') -PathType Leaf)) {
    Stop-Safe "SAFETY_STOP: saved baseline F:\$BaselineName is missing/incomplete. No changes made."
}
foreach ($p in @($Backup,$Stage,$Failed)) {
    if (Test-Path -LiteralPath $p) { Stop-Safe "SAFETY_STOP: $([IO.Path]::GetFileName($p)) already exists; refusing overwrite." }
}

$config = Get-Content -LiteralPath (Join-Path $Baseline 'OC\config.plist') -Raw
if ($config -notmatch '-radvesa' -or $config -notmatch '-wegnoigpu' -or $config -match '-wegnoegpu' -or $config -notmatch 'iMac20,1') {
    Stop-Safe 'BASELINE_CONFIG_CHECK_FAILED: expected RX570 VESA baseline not found.'
}
$mapPath = Join-Path $Baseline 'OC\Kexts\UTBMap.kext\Contents\Info.plist'
if (!(Test-Path -LiteralPath $mapPath -PathType Leaf)) { Stop-Safe 'BASELINE_UTBMAP_MISSING.' }
$map = Get-Content -LiteralPath $mapPath -Raw
if ($map -notmatch '<key>HS04</key>' -or $map -notmatch '<key>SS04</key>') { Stop-Safe 'BASELINE_USB_PORT4_PAIR_CHECK_FAILED.' }

$sourceFiles = @(Get-ChildItem -LiteralPath $Baseline -File -Recurse)
if ($sourceFiles.Count -lt 20) { Stop-Safe 'BASELINE_FILE_COUNT_SUSPICIOUS.' }

New-Item -ItemType Directory -Path $Stage | Out-Null
Get-ChildItem -LiteralPath $Baseline -Force | ForEach-Object { Copy-Item -LiteralPath $_.FullName -Destination $Stage -Recurse }
$stageFiles = @(Get-ChildItem -LiteralPath $Stage -File -Recurse)
if ($stageFiles.Count -ne $sourceFiles.Count) { Stop-Safe 'STAGING_FILE_COUNT_MISMATCH.' }
foreach ($f in $sourceFiles) {
    $rel = $f.FullName.Substring($Baseline.Length).TrimStart([char]92)
    $dst = Join-Path $Stage $rel
    if (!(Test-Path -LiteralPath $dst -PathType Leaf) -or (Get-Sha $dst) -ne (Get-Sha $f.FullName)) { Stop-Safe "STAGING_SHA256_MISMATCH: $rel" }
}
Write-Host "BASELINE_STAGING_SHA256=PASS; FILES=$($sourceFiles.Count)" -ForegroundColor Green

$CurrentRenamed = $false
try {
    Rename-Item -LiteralPath $Current -NewName $BackupName
    $CurrentRenamed = $true
    Rename-Item -LiteralPath $Stage -NewName 'EFI'
    foreach ($f in $sourceFiles) {
        $rel = $f.FullName.Substring($Baseline.Length).TrimStart([char]92)
        $dst = Join-Path $Current $rel
        if (!(Test-Path -LiteralPath $dst -PathType Leaf) -or (Get-Sha $dst) -ne (Get-Sha $f.FullName)) {
            throw "ACTIVE_EFI_SHA256_MISMATCH: $rel"
        }
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
Write-Host 'BASELINE_RESTORATION_SUCCESS' -ForegroundColor Green
Write-Host 'ACTIVE=F:\EFI (saved RX570 VESA display + mouse baseline; keyboard previously unresponsive)'
Write-Host "CURRENT_EFI_BACKUP=F:\$BackupName"
Write-Host "REFERENCE_BASELINE_PRESERVED=F:\$BaselineName (source unchanged)"
Write-Host "FILES_SHA256_VERIFIED=$($sourceFiles.Count)"
Write-Host 'RECOVERY_AND_ALL_PARTITIONS=UNCHANGED'
Write-Host 'INTERNAL_DISKS=NOT_MODIFIED'
if (Test-Path -LiteralPath $Work) { Remove-Item -LiteralPath $Work -Recurse -Force -ErrorAction SilentlyContinue }

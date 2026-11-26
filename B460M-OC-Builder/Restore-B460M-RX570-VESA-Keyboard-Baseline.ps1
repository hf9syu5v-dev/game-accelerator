#requires -RunAsAdministrator
[CmdletBinding()]
param()
$ErrorActionPreference='Stop'
$ProgressPreference='SilentlyContinue'
$Drive='F'; $Model='LITEON I T LCS-128L9S'; $Serial='000000123ADC'
$DiskBytes=[int64]128035676160
$EspGuid='c12a7328-f81f-11d2-ba4b-00a0c93ec93b'
$Url='https://github.com/hf9syu5v-dev/game-accelerator/releases/download/b460m-rx570-vesa-diagnostic/B460M-RX570-VESA-Diagnostic-EFI.zip'
$ZipSha='fda623c96ed4ea8370ad1e985a1a2f5ac7e9a651815c57e959bea0d28a026daf'
$DmgSha='7314eb401f5e84087f621b3599f0ad21ca3cdcc2685ea2da7f76806792328e20'
$ChunkSha='dbf262b83a16d55f1b2d8ce8ce95986561f8e889719524ea4b7aa22a2417ca27'
$S=[guid]::NewGuid().ToString('N').Substring(0,8)
$BackupName="EFI-BEFORE-VESA-BASELINE-$S"; $StageName="EFI-VESA-STAGING-$S"; $FailedName="EFI-VESA-FAILED-$S"
$Root="$Drive:\"
$Current=Join-Path $Root 'EFI'; $Recovery=Join-Path $Root 'com.apple.recovery.boot'
$Work=Join-Path $env:TEMP "B460M-VESA-$S"
function Sha([string]$p){(Get-FileHash -LiteralPath $p -Algorithm SHA256).Hash.ToLowerInvariant()}
try {
 Write-Host '=== RESTORE PINNED RX570 VESA BASELINE ===' -ForegroundColor Cyan
 $logical=Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='$($Drive):'"
 if(!$logical -or $logical.FileSystem -ne 'FAT32'){throw 'SAFETY_STOP: F: is not FAT32.'}
 $part=Get-Partition -DriveLetter $Drive -ErrorAction Stop
 if(([string]$part.GptType).Trim('{}').ToLowerInvariant() -ne $EspGuid){throw 'SAFETY_STOP: F: is not the EFI System Partition.'}
 $disk=Get-Disk -Number $part.DiskNumber -ErrorAction Stop
 if($disk.FriendlyName -ne $Model -or $disk.SerialNumber.Trim() -ne $Serial -or $disk.BusType -ne 'USB' -or [math]::Abs([double]$disk.Size-[double]$DiskBytes) -gt 2MB -or $disk.IsBoot -or $disk.IsSystem -or $disk.PartitionStyle -ne 'GPT'){throw 'SAFETY_STOP: target USB identity mismatch; nothing changed.'}
 if(!(Test-Path (Join-Path $Recovery 'BaseSystem.dmg')) -or !(Test-Path (Join-Path $Recovery 'BaseSystem.chunklist'))){throw 'SAFETY_STOP: Recovery files missing.'}
 if((Sha (Join-Path $Recovery 'BaseSystem.dmg')) -ne $DmgSha -or (Sha (Join-Path $Recovery 'BaseSystem.chunklist')) -ne $ChunkSha){throw 'SAFETY_STOP: Recovery hash mismatch.'}
 if(!(Test-Path (Join-Path $Current 'BOOT\BOOTx64.efi'))){throw 'SAFETY_STOP: current EFI missing.'}
 Write-Host 'USB_IDENTITY_AND_RECOVERY_READ_ONLY_CHECKS=PASS' -ForegroundColor Green

 New-Item -ItemType Directory -Path $Work | Out-Null
 $zip=Join-Path $Work 'baseline.zip'
 Invoke-WebRequest -Uri $Url -OutFile $zip -UseBasicParsing
 if((Sha $zip) -ne $ZipSha){throw 'BASELINE_ZIP_SHA256_MISMATCH.'}
 $expanded=Join-Path $Work 'expanded'
 Expand-Archive -LiteralPath $zip -DestinationPath $expanded
 $efiCandidates=@(Get-ChildItem -LiteralPath $expanded -Directory -Recurse | Where-Object {(Test-Path (Join-Path $_.FullName 'BOOT\BOOTx64.efi')) -and (Test-Path (Join-Path $_.FullName 'OC\config.plist'))})
 if($efiCandidates.Count -ne 1){throw "BASELINE_ARCHIVE_EFI_ROOT_COUNT_INVALID: $($efiCandidates.Count)"}
 $Source=$efiCandidates[0].FullName
 $cfg=Get-Content (Join-Path $Source 'OC\config.plist') -Raw
 if($cfg -notmatch '-radvesa' -or $cfg -notmatch '-wegnoigpu' -or $cfg -match '-wegnoegpu' -or $cfg -notmatch 'iMac20,1'){throw 'BASELINE_CONFIG_ASSERTION_FAILED.'}
 $map=Join-Path $Source 'OC\Kexts\UTBMap.kext\Contents\Info.plist'
 if(!(Test-Path $map)){throw 'BASELINE_UTBMAP_MISSING.'}
 $sourceFiles=@(Get-ChildItem -LiteralPath $Source -File -Recurse)
 if($sourceFiles.Count -lt 20){throw 'BASELINE_FILE_COUNT_SUSPICIOUS.'}

 $Stage=Join-Path $Root $StageName
 $Backup=Join-Path $Root $BackupName
 $Failed=Join-Path $Root $FailedName
 New-Item -ItemType Directory -Path $Stage | Out-Null
 Get-ChildItem -LiteralPath $Source -Force | ForEach-Object {Copy-Item -LiteralPath $_.FullName -Destination $Stage -Recurse}
 $staged=@(Get-ChildItem -LiteralPath $Stage -File -Recurse)
 if($staged.Count -ne $sourceFiles.Count){throw 'STAGING_FILE_COUNT_MISMATCH.'}
 foreach($file in $sourceFiles){
  $rel=$file.FullName.Substring($Source.Length).TrimStart([char]92); $dst=Join-Path $Stage $rel
  if(!(Test-Path $dst) -or (Sha $dst) -ne (Sha $file.FullName)){throw "STAGING_HASH_MISMATCH: $rel"}
 }
 Write-Host "BASELINE_STAGING_SHA256=PASS; FILES=$($sourceFiles.Count)" -ForegroundColor Green
 Rename-Item -LiteralPath $Current -NewName $BackupName
 try {
  Rename-Item -LiteralPath $Stage -NewName 'EFI'
  foreach($file in $sourceFiles){
   $rel=$file.FullName.Substring($Source.Length).TrimStart([char]92); $dst=Join-Path $Current $rel
   if(!(Test-Path $dst) -or (Sha $dst) -ne (Sha $file.FullName)){throw "ACTIVE_EFI_HASH_MISMATCH: $rel"}
  }
 } catch {
  if(Test-Path $Current){Rename-Item -LiteralPath $Current -NewName $FailedName}
  if((Test-Path $Backup) -and !(Test-Path $Current)){Rename-Item -LiteralPath $Backup -NewName 'EFI'}
  throw
 }
 Write-Host 'BASELINE_RESTORATION_SUCCESS' -ForegroundColor Green
 Write-Host "ACTIVE=F:\EFI; BACKUP=F:\$BackupName; FILES_SHA256_VERIFIED=$($sourceFiles.Count)"
 Write-Host 'RECOVERY_UNCHANGED; OTHER_PARTITIONS_UNCHANGED; INTERNAL_DISKS_UNTOUCHED'
} finally {
 if(Test-Path $Work){Remove-Item -LiteralPath $Work -Recurse -Force -ErrorAction SilentlyContinue}
}

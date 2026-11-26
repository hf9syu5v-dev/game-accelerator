# Deploy B460M keyboard transplant 02 (OpenUsbKbDxe fallback) over the verified VESA baseline.
#requires -RunAsAdministrator
[CmdletBinding()]
param()
$ErrorActionPreference='Stop'; $ProgressPreference='SilentlyContinue'
$Drive='F'; $Model='LITEON I T LCS-128L9S'; $Serial='000000123ADC'
$DiskBytes=[int64]128035676160; $EspGuid='c12a7328-f81f-11d2-ba4b-00a0c93ec93b'
$Url='https://github.com/hf9syu5v-dev/game-accelerator/releases/download/b460m-keyboard-transplant-02/B460M-Keyboard-Transplant-02-OpenUsbKbDxe.zip'
$ZipSha='2a0239f105f1a7914b8e0e6658ae9e8002c0f95bb077420625b87d163fc25679'
$DmgSha='7314eb401f5e84087f621b3599f0ad21ca3cdcc2685ea2da7f76806792328e20'
$ChunkSha='dbf262b83a16d55f1b2d8ce8ce95986561f8e889719524ea4b7aa22a2417ca27'
$S=[guid]::NewGuid().ToString('N').Substring(0,8)
$Root=$Drive+':\'; $Current=Join-Path $Root 'EFI'
$BackupName="EFI-BEFORE-KEYBOARD-02-$S"; $StageName="EFI-KEYBOARD-02-STAGE-$S"; $FailedName="EFI-KEYBOARD-02-FAILED-$S"
$Backup=Join-Path $Root $BackupName; $Stage=Join-Path $Root $StageName; $Failed=Join-Path $Root $FailedName
$Work=Join-Path $env:TEMP "B460M-KBD02-$S"
function Sha([string]$p){(Get-FileHash -LiteralPath $p -Algorithm SHA256).Hash.ToLowerInvariant()}
try {
 Write-Host '=== B460M KEYBOARD TRANSPLANT 02 ===' -ForegroundColor Cyan
 $logical=Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='$($Drive):'"
 if(!$logical -or $logical.FileSystem -ne 'FAT32'){throw 'SAFETY_STOP: F: is not FAT32.'}
 $part=Get-Partition -DriveLetter $Drive -ErrorAction Stop
 if(([string]$part.GptType).Trim('{}').ToLowerInvariant() -ne $EspGuid){throw 'SAFETY_STOP: F: is not EFI System Partition.'}
 $disk=Get-Disk -Number $part.DiskNumber -ErrorAction Stop
 if($disk.FriendlyName -ne $Model -or $disk.SerialNumber.Trim() -ne $Serial -or $disk.BusType -ne 'USB' -or [math]::Abs([double]$disk.Size-[double]$DiskBytes) -gt 2MB -or $disk.IsBoot -or $disk.IsSystem -or $disk.PartitionStyle -ne 'GPT'){throw 'SAFETY_STOP: target USB identity mismatch; no changes made.'}
 $dmg=Join-Path (Join-Path $Root 'com.apple.recovery.boot') 'BaseSystem.dmg'
 $chunk=Join-Path (Join-Path $Root 'com.apple.recovery.boot') 'BaseSystem.chunklist'
 if(!(Test-Path $dmg -PathType Leaf) -or !(Test-Path $chunk -PathType Leaf) -or (Sha $dmg) -ne $DmgSha -or (Sha $chunk) -ne $ChunkSha){throw 'SAFETY_STOP: Recovery payload missing or hash mismatch.'}
 if(!(Test-Path (Join-Path $Current 'BOOT\BOOTx64.efi') -PathType Leaf)){throw 'SAFETY_STOP: active EFI missing.'}
 $baseCfg=Get-Content (Join-Path $Current 'OC\config.plist') -Raw
 if($baseCfg -notmatch '-radvesa' -or $baseCfg -notmatch '-wegnoigpu' -or $baseCfg -match '-wegnoegpu' -or $baseCfg -notmatch 'iMac20,1'){throw 'SAFETY_STOP: active EFI is not the known VESA baseline.'}
 foreach($p in @($Backup,$Stage,$Failed)){if(Test-Path $p){throw "SAFETY_STOP: refusing to overwrite $p"}}
 New-Item -ItemType Directory -Path $Work | Out-Null
 $zip=Join-Path $Work 'candidate02.zip'; Invoke-WebRequest -Uri $Url -OutFile $zip -UseBasicParsing
 if((Sha $zip) -ne $ZipSha){throw 'ARTIFACT_SHA256_MISMATCH; no changes made.'}
 $expanded=Join-Path $Work 'expanded'; Expand-Archive -LiteralPath $zip -DestinationPath $expanded
 $Source=Join-Path $expanded 'EFI'
 foreach($rel in @('BOOT\BOOTx64.efi','OC\OpenCore.efi','OC\config.plist','OC\Drivers\OpenUsbKbDxe.efi','OC\Kexts\UTBMap.kext\Contents\Info.plist')){if(!(Test-Path (Join-Path $Source $rel) -PathType Leaf)){throw "EFI_REQUIRED_FILE_MISSING: $rel"}}
 $cfg=Get-Content (Join-Path $Source 'OC\config.plist') -Raw
 if($cfg -notmatch '(?s)<key>KeySupport</key>\s*<false\s*/>' -or $cfg -notmatch '(?s)<key>PollAppleHotKeys</key>\s*<false\s*/>' -or $cfg -notmatch 'OpenUsbKbDxe\.efi' -or $cfg -notmatch '-radvesa' -or $cfg -notmatch '-wegnoigpu' -or $cfg -notmatch 'iMac20,1'){throw 'CANDIDATE_02_CONFIG_ASSERTION_FAILED.'}
 if($cfg -match 'Ps2KeyboardDxe\.efi'){throw 'Unexpected PS/2 keyboard driver found.'}
 $files=@(Get-ChildItem -LiteralPath $Source -File -Recurse); if($files.Count -lt 20){throw 'EFI_FILE_COUNT_SUSPICIOUS.'}
 New-Item -ItemType Directory -Path $Stage | Out-Null
 Get-ChildItem -LiteralPath $Source -Force | ForEach-Object {Copy-Item -LiteralPath $_.FullName -Destination $Stage -Recurse}
 $staged=@(Get-ChildItem -LiteralPath $Stage -File -Recurse); if($staged.Count -ne $files.Count){throw 'STAGING_FILE_COUNT_MISMATCH.'}
 foreach($f in $files){$rel=$f.FullName.Substring($Source.Length).TrimStart([char]92);$dst=Join-Path $Stage $rel;if(!(Test-Path $dst -PathType Leaf) -or (Sha $dst) -ne (Sha $f.FullName)){throw "STAGING_SHA256_MISMATCH: $rel"}}
 $renamed=$false
 try {
  Rename-Item -LiteralPath $Current -NewName $BackupName; $renamed=$true
  Rename-Item -LiteralPath $Stage -NewName 'EFI'
  foreach($f in $files){$rel=$f.FullName.Substring($Source.Length).TrimStart([char]92);$dst=Join-Path $Current $rel;if(!(Test-Path $dst -PathType Leaf) -or (Sha $dst) -ne (Sha $f.FullName)){throw "ACTIVE_EFI_SHA256_MISMATCH: $rel"}}
 } catch {
  if(Test-Path $Current){if(!(Test-Path $Failed)){Rename-Item -LiteralPath $Current -NewName $FailedName}}
  if($renamed -and (Test-Path $Backup) -and !(Test-Path $Current)){Rename-Item -LiteralPath $Backup -NewName 'EFI'}
  throw
 }
 Write-Host 'KEYBOARD_TRANSPLANT_02_DEPLOYMENT_SUCCESS' -ForegroundColor Green
 Write-Host "PREVIOUS_EFI_BACKUP=F:\$BackupName"
 Write-Host "FILES_SHA256_VERIFIED=$($files.Count)"
 Write-Host 'RECOVERY_AND_OTHER_PARTITIONS=UNCHANGED; INTERNAL_DISKS=NOT_MODIFIED'
} finally {if(Test-Path $Work){Remove-Item -LiteralPath $Work -Recurse -Force -ErrorAction SilentlyContinue}}

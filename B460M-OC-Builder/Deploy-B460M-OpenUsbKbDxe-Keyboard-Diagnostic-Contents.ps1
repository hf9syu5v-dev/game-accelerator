#requires -RunAsAdministrator
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
$TargetDrive='F'
$ExpectedModel='LITEON I T LCS-128L9S'
$ExpectedSerial='000000123ADC'
$ExpectedDiskBytes=[int64]128035676160
$EspGuid='c12a7328-f81f-11d2-ba4b-00a0c93ec93b'
$ArtifactUrl='https://github.com/hf9syu5v-dev/game-accelerator/releases/download/b460m-openusbkbd-keyboard-diagnostic/B460M-OpenUsbKbDxe-Keyboard-Diagnostic-EFI.zip'
$ArtifactSha256='8a9758328f1c032c83963d955b5e05faa734dc41d1e79c06f7267e08de5ec77f'
$BackupName='EFI-PREVIOUS-RX570-VESA-DIAGNOSTIC'
$StageName='EFI-OPENUSBKBD-STAGING'
$Work=Join-Path $env:TEMP ('B460M-OpenUsbKbDxe-'+[guid]::NewGuid().ToString('N'))
function Stop-Deploy([string]$m){throw $m}
function Get-Sha256([string]$p){(Get-FileHash -LiteralPath $p -Algorithm SHA256).Hash.ToLowerInvariant()}
try {
 Write-Host '=== B460M OPENUSBKBD KEYBOARD DIAGNOSTIC DEPLOYMENT ===' -ForegroundColor Cyan
 Write-Host 'CONTENTS ONLY: no disk/partition/format/drive-letter operations.'
 $root='F:\'
 $logical=Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='F:'"
 if(!$logical -or $logical.FileSystem -ne 'FAT32'){Stop-Deploy 'SAFETY_STOP: F: must be FAT32.'}
 $part=Get-Partition -DriveLetter F -ErrorAction Stop
 if(([string]$part.GptType).Trim('{}').ToLowerInvariant() -ne $EspGuid){Stop-Deploy 'SAFETY_STOP: F: is not GPT EFI System Partition.'}
 $disk=Get-Disk -Number $part.DiskNumber -ErrorAction Stop
 if($disk.FriendlyName -ne $ExpectedModel -or $disk.SerialNumber.Trim() -ne $ExpectedSerial -or $disk.BusType -ne 'USB' -or [math]::Abs([double]$disk.Size-[double]$ExpectedDiskBytes) -gt 2MB -or $disk.IsBoot -or $disk.IsSystem -or $disk.PartitionStyle -ne 'GPT'){Stop-Deploy 'SAFETY_STOP: F: is not the exact authorized USB ESP. Nothing changed.'}
 Write-Host "TARGET VERIFIED: Disk $($disk.Number); $($disk.FriendlyName); Serial $($disk.SerialNumber); F: FAT32 ESP." -ForegroundColor Green
 $current=Join-Path $root 'EFI'; $backup=Join-Path $root $BackupName; $stage=Join-Path $root $StageName
 if(!(Test-Path -LiteralPath (Join-Path $current 'BOOT\BOOTx64.efi') -PathType Leaf)){Stop-Deploy 'Current EFI missing/incomplete.'}
 if(Test-Path -LiteralPath $backup){Stop-Deploy "Backup $BackupName already exists; refusing overwrite."}
 if(Test-Path -LiteralPath $stage){Stop-Deploy "Staging $StageName already exists; refusing overwrite."}
 if(!(Test-Path -LiteralPath (Join-Path $root 'com.apple.recovery.boot\BaseSystem.dmg') -PathType Leaf)){Stop-Deploy 'Recovery image missing; no changes.'}
 New-Item -ItemType Directory -Path $Work | Out-Null
 $zip=Join-Path $Work 'diagnostic.zip'
 Invoke-WebRequest -Uri $ArtifactUrl -OutFile $zip -UseBasicParsing
 if((Get-Sha256 $zip) -ne $ArtifactSha256){Stop-Deploy 'ARTIFACT SHA256 mismatch; refusing deployment.'}
 Write-Host 'ARTIFACT_SHA256=PASS' -ForegroundColor Green
 $extract=Join-Path $Work 'package'; Expand-Archive -LiteralPath $zip -DestinationPath $extract
 $src=Join-Path $extract 'EFI'; $cfg=Join-Path $src 'OC\config.plist'
 foreach($rel in @('BOOT\BOOTx64.efi','OC\OpenCore.efi','OC\config.plist','OC\Drivers\OpenUsbKbDxe.efi','OC\Kexts\UTBMap.kext\Contents\Info.plist')){if(!(Test-Path -LiteralPath (Join-Path $src $rel) -PathType Leaf)){Stop-Deploy "Required EFI file missing: $rel"}}
 [xml]$xml=Get-Content -LiteralPath $cfg -Raw
 $x=$xml.OuterXml
 if($x -notmatch '<key>KeySupport</key><false\s*/>' -or $x -notmatch 'OpenUsbKbDxe.efi' -or $x -notmatch '<key>PollAppleHotKeys</key><false\s*/>' -or $x -notmatch '-radvesa' -or $x -notmatch 'iMac20,1'){Stop-Deploy 'Config assertions failed.'}
 $files=@(Get-ChildItem -LiteralPath $src -File -Recurse)
 if($files.Count -lt 20){Stop-Deploy 'EFI file count suspicious.'}
 New-Item -ItemType Directory -Path $stage | Out-Null
 Get-ChildItem -LiteralPath $src -Force | ForEach-Object {Copy-Item -LiteralPath $_.FullName -Destination $stage -Recurse}
 foreach($f in $files){$rel=$f.FullName.Substring($src.Length).TrimStart([char]92);$dst=Join-Path $stage $rel;if(!(Test-Path -LiteralPath $dst -PathType Leaf) -or (Get-Sha256 $dst) -ne (Get-Sha256 $f.FullName)){Stop-Deploy "Staging hash mismatch: $rel"}}
 Write-Host "STAGING_SHA256=PASS; FILES=$($files.Count)" -ForegroundColor Green
 Rename-Item -LiteralPath $current -NewName $BackupName
 try {Rename-Item -LiteralPath $stage -NewName 'EFI'} catch {Rename-Item -LiteralPath $backup -NewName 'EFI';throw}
 foreach($f in $files){$rel=$f.FullName.Substring($src.Length).TrimStart([char]92);$dst=Join-Path $current $rel;if(!(Test-Path -LiteralPath $dst -PathType Leaf) -or (Get-Sha256 $dst) -ne (Get-Sha256 $f.FullName)){Stop-Deploy "Active EFI hash mismatch: $rel; old EFI preserved."}}
 Write-Host ''
 Write-Host 'OPENUSBKBD_DIAGNOSTIC_DEPLOYMENT_SUCCESS' -ForegroundColor Green
 Write-Host 'ACTIVE_EFI=F:\EFI (KeySupport=false; OpenUsbKbDxe enabled)'
 Write-Host "PREVIOUS_EFI_PRESERVED=F:\$BackupName"
 Write-Host "EFI_FILES_SHA256_VERIFIED=$($files.Count)"
 Write-Host 'RECOVERY_AND_ALL_DISK_PARTITIONS=UNCHANGED'
 Write-Host 'INTERNAL_DISKS=NOT_MODIFIED'
} finally {if(Test-Path -LiteralPath $Work){Remove-Item -LiteralPath $Work -Recurse -Force -ErrorAction SilentlyContinue}}

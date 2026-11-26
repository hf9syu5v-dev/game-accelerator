# Deploy B460M keyboard transplant 04 - TianoCore EDK II UsbKbDxe
#requires -RunAsAdministrator
[CmdletBinding()]
param()
$ErrorActionPreference='Stop'; $ProgressPreference='SilentlyContinue'

$Drive='F'
$Model='LITEON I T LCS-128L9S'
$Serial='000000123ADC'
$DiskBytes=[int64]128035676160
$EspGuid='c12a7328-f81f-11d2-ba4b-00a0c93ec93b'

$BaseUrl='https://github.com/hf9syu5v-dev/game-accelerator/releases/download/asus-b460-hackintosh-baseline-efi01/B460M-RX570-VESA-Diagnostic-EFI.zip'
$BaseZipSha='fda623c96ed4ea8370ad1e985a1a2f5ac7e9a651815c57e959bea0d28a026daf'
$Url='https://github.com/hf9syu5v-dev/game-accelerator/releases/download/b460m-keyboard-transplant-04-edk2-usbkbd/B460M-Keyboard-Transplant-04-EDK2-UsbKbDxe.zip'
$ZipSha='e27a2ea40408f084ad01f87464930113fc45fe68352822a15f682a2f9a831299'
$DriverSha='cda631d44699b37143f044a00ad679b8c49ca629d4106256d7ab082bc83c06f0'
$DmgSha='7314eb401f5e84087f621b3599f0ad21ca3cdcc2685ea2da7f76806792328e20'
$ChunkSha='dbf262b83a16d55f1b2d8ce8ce95986561f8e889719524ea4b7aa22a2417ca27'

$S=[guid]::NewGuid().ToString('N').Substring(0,8)
$Root=$Drive+':\'; $Current=Join-Path $Root 'EFI'
$BackupName="EFI-BEFORE-KEYBOARD-04-$S"
$StageName="EFI-KEYBOARD-04-STAGE-$S"
$FailedName="EFI-KEYBOARD-04-FAILED-$S"
$Backup=Join-Path $Root $BackupName
$Stage=Join-Path $Root $StageName
$Failed=Join-Path $Root $FailedName
$Work=Join-Path $env:TEMP "B460M-KBD04-$S"

function Sha([string]$p){(Get-FileHash -LiteralPath $p -Algorithm SHA256).Hash.ToLowerInvariant()}
function Get-Tree([string]$p){
  $files=@(Get-ChildItem -LiteralPath $p -File -Recurse | ForEach-Object {
    [pscustomobject]@{ Rel=$_.FullName.Substring($p.Length).TrimStart([char]92); Hash=(Sha $_.FullName) }
  } | Sort-Object Rel)
  return ,$files
}

try {
 Write-Host '=== B460M KEYBOARD TRANSPLANT 04 / EDK II UsbKbDxe ===' -ForegroundColor Cyan

 # Hardware and partition identity guard: only the known USB EFI partition is eligible.
 $logical=Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='$($Drive):'"
 if(!$logical -or $logical.FileSystem -ne 'FAT32'){throw 'SAFETY_STOP: F: is not FAT32.'}
 $part=Get-Partition -DriveLetter $Drive -ErrorAction Stop
 if(([string]$part.GptType).Trim('{}').ToLowerInvariant() -ne $EspGuid){throw 'SAFETY_STOP: F: is not an EFI System Partition.'}
 $disk=Get-Disk -Number $part.DiskNumber -ErrorAction Stop
 if($disk.FriendlyName -ne $Model -or $disk.SerialNumber.Trim() -ne $Serial -or $disk.BusType -ne 'USB' -or [math]::Abs([double]$disk.Size-[double]$DiskBytes) -gt 2MB -or $disk.IsBoot -or $disk.IsSystem -or $disk.PartitionStyle -ne 'GPT'){
   throw 'SAFETY_STOP: target USB identity mismatch; no changes made.'
 }

 # Recovery must remain intact. This script never writes outside F:\EFI.
 $dmg=Join-Path (Join-Path $Root 'com.apple.recovery.boot') 'BaseSystem.dmg'
 $chunk=Join-Path (Join-Path $Root 'com.apple.recovery.boot') 'BaseSystem.chunklist'
 if(!(Test-Path $dmg -PathType Leaf) -or !(Test-Path $chunk -PathType Leaf) -or (Sha $dmg) -ne $DmgSha -or (Sha $chunk) -ne $ChunkSha){
   throw 'SAFETY_STOP: Recovery payload missing or hash mismatch.'
 }
 if(!(Test-Path (Join-Path $Current 'BOOT\BOOTx64.efi') -PathType Leaf)){throw 'SAFETY_STOP: active EFI missing.'}

 foreach($p in @($Backup,$Stage,$Failed)){if(Test-Path $p){throw "SAFETY_STOP: refusing to overwrite $p"}}
 New-Item -ItemType Directory -Path $Work | Out-Null

 # Require exact, pinned VESA baseline before transplant. This deliberately rejects
 # EFI 01/02/03 or manually modified EFI; restore baseline first if this check fails.
 $baseZip=Join-Path $Work 'baseline.zip'
 Invoke-WebRequest -Uri $BaseUrl -OutFile $baseZip -UseBasicParsing
 if((Sha $baseZip) -ne $BaseZipSha){throw 'BASELINE_ZIP_SHA256_MISMATCH; no changes made.'}
 $baseExpanded=Join-Path $Work 'baseline-expanded'
 Expand-Archive -LiteralPath $baseZip -DestinationPath $baseExpanded
 $baseEFI=Join-Path $baseExpanded 'EFI'
 $activeTree=Get-Tree $Current
 $baselineTree=Get-Tree $baseEFI
 if($activeTree.Count -ne $baselineTree.Count){throw 'SAFETY_STOP: active EFI is not byte-for-byte the pinned baseline. Restore baseline first.'}
 for($i=0;$i -lt $activeTree.Count;$i++){
   if($activeTree[$i].Rel -ne $baselineTree[$i].Rel -or $activeTree[$i].Hash -ne $baselineTree[$i].Hash){
     throw "SAFETY_STOP: active EFI differs from pinned baseline at $($activeTree[$i].Rel). Restore baseline first."
   }
 }

 # Download and authenticate candidate package and the separately built EDK II driver.
 $zip=Join-Path $Work 'candidate04.zip'
 Invoke-WebRequest -Uri $Url -OutFile $zip -UseBasicParsing
 if((Sha $zip) -ne $ZipSha){throw 'CANDIDATE_ZIP_SHA256_MISMATCH; no changes made.'}
 $expanded=Join-Path $Work 'candidate-expanded'
 Expand-Archive -LiteralPath $zip -DestinationPath $expanded
 $Source=Join-Path $expanded 'EFI'
 foreach($rel in @('BOOT\BOOTx64.efi','OC\OpenCore.efi','OC\config.plist','OC\Drivers\UsbKbDxe.efi','OC\Kexts\UTBMap.kext\Contents\Info.plist')){
   if(!(Test-Path (Join-Path $Source $rel) -PathType Leaf)){throw "EFI_REQUIRED_FILE_MISSING: $rel"}
 }
 if((Sha (Join-Path $Source 'OC\Drivers\UsbKbDxe.efi')) -ne $DriverSha){throw 'EDK2_USBKBD_DRIVER_SHA256_MISMATCH.'}
 $cfg=Get-Content (Join-Path $Source 'OC\config.plist') -Raw
 if($cfg -notmatch '(?s)<key>KeySupport</key>\s*<true\s*/>' -or
    $cfg -notmatch '(?s)<key>KeySupportMode</key>\s*<string>V2</string>' -or
    $cfg -notmatch '(?s)<key>ConnectDrivers</key>\s*<true\s*/>' -or
    $cfg -notmatch 'UsbKbDxe\.efi' -or
    $cfg -match 'OpenUsbKbDxe\.efi|Ps2KeyboardDxe\.efi' -or
    $cfg -notmatch '-radvesa' -or $cfg -notmatch '-wegnoigpu' -or
    $cfg -match '-wegnoegpu' -or $cfg -notmatch 'iMac20,1'){
   throw 'CANDIDATE_04_CONFIG_ASSERTION_FAILED.'
 }

 $files=@(Get-ChildItem -LiteralPath $Source -File -Recurse)
 if($files.Count -lt 20){throw 'EFI_FILE_COUNT_SUSPICIOUS.'}
 New-Item -ItemType Directory -Path $Stage | Out-Null
 Get-ChildItem -LiteralPath $Source -Force | ForEach-Object {Copy-Item -LiteralPath $_.FullName -Destination $Stage -Recurse}
 $staged=@(Get-ChildItem -LiteralPath $Stage -File -Recurse)
 if($staged.Count -ne $files.Count){throw 'STAGING_FILE_COUNT_MISMATCH.'}
 foreach($f in $files){
   $rel=$f.FullName.Substring($Source.Length).TrimStart([char]92)
   $dst=Join-Path $Stage $rel
   if(!(Test-Path $dst -PathType Leaf) -or (Sha $dst) -ne (Sha $f.FullName)){throw "STAGING_SHA256_MISMATCH: $rel"}
 }

 # Atomic directory swap with rollback. Only F:\EFI is replaced.
 $renamed=$false
 try {
   Rename-Item -LiteralPath $Current -NewName $BackupName
   $renamed=$true
   Rename-Item -LiteralPath $Stage -NewName 'EFI'
   foreach($f in $files){
     $rel=$f.FullName.Substring($Source.Length).TrimStart([char]92)
     $dst=Join-Path $Current $rel
     if(!(Test-Path $dst -PathType Leaf) -or (Sha $dst) -ne (Sha $f.FullName)){throw "ACTIVE_EFI_SHA256_MISMATCH: $rel"}
   }
 } catch {
   if(Test-Path $Current){if(!(Test-Path $Failed)){Rename-Item -LiteralPath $Current -NewName $FailedName}}
   if($renamed -and (Test-Path $Backup) -and !(Test-Path $Current)){Rename-Item -LiteralPath $Backup -NewName 'EFI'}
   throw
 }

 Write-Host 'KEYBOARD_TRANSPLANT_04_DEPLOYMENT_SUCCESS' -ForegroundColor Green
 Write-Host "PREVIOUS_EFI_BACKUP=F:\$BackupName"
 Write-Host "FILES_SHA256_VERIFIED=$($files.Count)"
 Write-Host 'RECOVERY_AND_OTHER_PARTITIONS=UNCHANGED; INTERNAL_DISKS=NOT_MODIFIED'
} finally {
 if(Test-Path $Work){Remove-Item -LiteralPath $Work -Recurse -Force -ErrorAction SilentlyContinue}
}

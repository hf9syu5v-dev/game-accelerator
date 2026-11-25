# Build the authorized LITEON USB from an already-unallocated disk.
$ErrorActionPreference='Stop';$ProgressPreference='SilentlyContinue'
$Model='LITEON I T LCS-128L9S';$Serial='000000123ADC';$Esp='c12a7328-f81f-11d2-ba4b-00a0c93ec93b'
$Artifact=Join-Path $env:USERPROFILE 'Downloads\B460M-NO-SS04-DIAGNOSTIC-ARTIFACT.zip'
$OCUrl='https://github.com/acidanthera/OpenCorePkg/releases/download/1.0.8/OpenCore-1.0.8-DEBUG.zip'
$OCHash='3F5F42B85703CF2C08E8DCD9245A52FB4326C9F4EF335C75B49F516CBBE131C6'
$Work=Join-Path $env:TEMP ('B460M-Resume-'+[guid]::NewGuid().ToString('N'))
$RecoveryCache=Join-Path $env:LOCALAPPDATA 'B460M-Sequoia-RecoveryCache'
$BasicData='ebd0a0a2-b9e5-4433-87c0-68b6b72699c7'
$espTemporarilyChanged=$false;$chosenLetter=$null;$resumeExisting=$false;$resumePartitionNumber=$null
function Fail([string]$s){throw $s}
function Hash([string]$p){(Get-FileHash -LiteralPath $p -Algorithm SHA256).Hash.ToLowerInvariant()}
try{
 Write-Host '=== BUILD SEQUOIA USB: VERIFIED LITEON ONLY ===' -ForegroundColor Cyan
 if($PSVersionTable.PSVersion.Major -ne 5 -or $PSVersionTable.PSVersion.Minor -ne 1){Fail 'Requires Windows PowerShell 5.1.'}
 $wi=[Security.Principal.WindowsIdentity]::GetCurrent();$wp=New-Object Security.Principal.WindowsPrincipal($wi)
 if(!$wp.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)){Fail 'Run PowerShell as Administrator.'}
 $ds=@(Get-Disk|Where-Object{$_.FriendlyName -eq $Model -and $_.SerialNumber -and (($_.SerialNumber.Trim() -replace '\s','') -eq $Serial) -and $_.BusType -eq 'USB' -and $_.Size -ge 115GB -and $_.Size -le 125GB})
 if($ds.Count -ne 1){Fail "Safety stop: expected one matching USB, found $($ds.Count)."}
 $d=$ds[0];if($d.IsBoot -or $d.IsSystem -or $d.IsReadOnly -or $d.IsOffline){Fail 'Safety stop: target is boot/system/read-only/offline.'}
 $existingParts=@(Get-CimInstance -Namespace 'root/Microsoft/Windows/Storage' -ClassName MSFT_Partition -Filter ("DiskNumber = "+[int]$d.Number) -ErrorAction Stop)
 $part=$null
 if($existingParts.Count -eq 0){
  $resumeExisting=$false
 }else{
  # Resume only the exact intermediate layout from the previous run.
  $pnow=@(Get-Partition -DiskNumber $d.Number -ErrorAction Stop)
  $msr=@($pnow|Where-Object{([string]$_.GptType).Trim('{}').ToLowerInvariant() -eq 'e3c9e316-0b5c-4db8-817d-f92df00215ae' -and $_.Size -ge 15MB -and $_.Size -le 17MB})
  $data=@($pnow|Where-Object{([string]$_.GptType).Trim('{}').ToLowerInvariant() -eq $BasicData -and $_.Size -ge 15GB -and $_.Size -le 17GB -and $_.DriveLetter})
  if($pnow.Count -ne 2 -or $msr.Count -ne 1 -or $data.Count -ne 1){Fail "Safety stop: USB has $($pnow.Count) partitions, not the exact recognized resumable layout. No disk changes made."}
  $resumeLetter=[string]$data[0].DriveLetter
  $vol=Get-CimInstance Win32_LogicalDisk -Filter ("DeviceID='"+$resumeLetter+":'") -ErrorAction Stop
  if(!$vol -or $vol.FileSystem -ne 'FAT32' -or $vol.VolumeName -ne 'OC-SEQUOIA'){Fail ("Safety stop: existing partition "+$resumeLetter+": is not the expected FAT32 volume. No disk changes made.")}
  $resumeExisting=$true;$resumePartitionNumber=[int]$data[0].PartitionNumber
  Write-Host ("RESUME_EXISTING_USB_LAYOUT: MSR+FAT32; DRIVE="+$resumeLetter+":") -ForegroundColor Yellow
 }
 if(!(Test-Path -LiteralPath $Artifact -PathType Leaf)){Fail "Missing diagnostic artifact: $Artifact"}
 New-Item -ItemType Directory $Work -Force|Out-Null
 Add-Type -AssemblyName System.IO.Compression.FileSystem
 Write-Host 'STEP 1: Validate diagnostic EFI...'
 $outer=Join-Path $Work 'outer';[IO.Compression.ZipFile]::ExtractToDirectory($Artifact,$outer)
 $inner=Get-ChildItem $outer -Filter 'B460M-no-SS04-Diagnostic-EFI.zip' -File -Recurse|Select-Object -First 1
 if(!$inner){Fail 'Nested diagnostic EFI ZIP missing.'}
 $idir=Join-Path $Work 'inner';[IO.Compression.ZipFile]::ExtractToDirectory($inner.FullName,$idir)
 $efis=@(Get-ChildItem $idir -Directory -Filter EFI -Recurse);if($efis.Count -ne 1){Fail "EFI directory count=$($efis.Count)"}
 $src=$efis[0].FullName
 foreach($r in @('BOOT\BOOTx64.efi','OC\OpenCore.efi','OC\config.plist','OC\Kexts\UTBMap.kext\Contents\Info.plist')){if(!(Test-Path (Join-Path $src $r) -PathType Leaf)){Fail "Missing EFI file: $r"}}
 $files=@(Get-ChildItem $src -File -Recurse);if($files.Count -lt 20){Fail 'EFI file count suspicious.'}
 $map=Get-Content (Join-Path $src 'OC\Kexts\UTBMap.kext\Contents\Info.plist') -Raw
 if($map -match 'key>\s*HS04\s*<' -or $map -match 'key>\s*SS04\s*<'){Fail 'HS04/SS04 unexpectedly present.'}
 Write-Host "EFI_SOURCE_OK; FILES=$($files.Count); HS04_SS04=ABSENT" -ForegroundColor Green
 Write-Host 'STEP 2: Find Python 3...'
 $pyexe=$null;$pyargs=@();$cmd=Get-Command py.exe -ErrorAction SilentlyContinue
 if($cmd){$pyexe=$cmd.Source;$pyargs=@('-3')}else{$cmd=Get-Command python.exe -ErrorAction SilentlyContinue;if(!$cmd){$cmd=Get-Command python3.exe -ErrorAction SilentlyContinue};if($cmd){$pyexe=$cmd.Source}else{$pr=Join-Path $env:LOCALAPPDATA 'Programs\Python';if(Test-Path $pr){$pf=Get-ChildItem $pr -Filter python.exe -File -Recurse -ErrorAction SilentlyContinue|Sort-Object FullName -Descending|Select-Object -First 1;if($pf){$pyexe=$pf.FullName}}}}
 if(!$pyexe){Fail 'Python 3 not found.'};$pv=& $pyexe @pyargs --version 2>&1;if($LASTEXITCODE -ne 0 -or $pv -notmatch '^Python 3\.'){Fail "Python check failed: $pv"};Write-Host "PYTHON_OK: $pv"
 Write-Host 'STEP 3: Prepare Apple Recovery...'
 $oczip=Join-Path $Work 'OpenCore.zip';Invoke-WebRequest -Uri $OCUrl -OutFile $oczip -UseBasicParsing
 if((Hash $oczip) -ne $OCHash.ToLowerInvariant()){Fail 'OpenCore ZIP SHA256 mismatch.'}
 $ocdir=Join-Path $Work 'oc';Expand-Archive -LiteralPath $oczip -DestinationPath $ocdir -Force
 $mr=@(Get-ChildItem $ocdir -Filter macrecovery.py -File -Recurse);if($mr.Count -ne 1){Fail 'macrecovery.py not uniquely found.'}
 $rec=Join-Path $Work 'com.apple.recovery.boot';New-Item -ItemType Directory $rec -Force|Out-Null
New-Item -ItemType Directory $RecoveryCache -Force|Out-Null
$cacheDmg=Join-Path $RecoveryCache 'BaseSystem.dmg';$cacheChunk=Join-Path $RecoveryCache 'BaseSystem.chunklist'
 $dmg=Join-Path $rec 'BaseSystem.dmg';$chunk=Join-Path $rec 'BaseSystem.chunklist';$pair=$null
 $roots=@((Join-Path $env:USERPROFILE 'Downloads'),(Join-Path $env:USERPROFILE 'Desktop'),(Join-Path $env:USERPROFILE 'Documents'),'C:\temp',$env:TEMP)
 foreach($sr in ($roots|Select-Object -Unique)){if($sr -and (Test-Path $sr)){ $hit=Get-ChildItem -LiteralPath $sr -Filter BaseSystem.dmg -File -Recurse -ErrorAction SilentlyContinue|Where-Object{Test-Path (Join-Path $_.DirectoryName 'BaseSystem.chunklist') -PathType Leaf}|Select-Object -First 1;if($hit){$pair=$hit.DirectoryName;break}}}
 if((Test-Path $cacheDmg -PathType Leaf) -and (Test-Path $cacheChunk -PathType Leaf)){ $pair=$RecoveryCache }
if($pair){Write-Host "LOCAL_RECOVERY_FOUND: $pair";Copy-Item (Join-Path $pair 'BaseSystem.dmg') $dmg;Copy-Item (Join-Path $pair 'BaseSystem.chunklist') $chunk}else{
  Write-Host 'No local Recovery pair found; downloading from Apple (up to 6 attempts)...'
  $ok=$false
  for($i=1;$i -le 6;$i++){Remove-Item $dmg,$chunk -Force -ErrorAction SilentlyContinue;Push-Location $mr[0].DirectoryName;try{& $pyexe @pyargs $mr[0].FullName -b Mac-7BA5B2D9E42DDD94 -m 00000000000000000 -o $rec download;$rc=$LASTEXITCODE}finally{Pop-Location};if($rc -eq 0 -and (Test-Path $dmg) -and (Test-Path $chunk) -and (Get-Item $dmg).Length -ge 100MB){$ok=$true;break};if($i -lt 6){Start-Sleep -Seconds (5*$i)}}
  if(!$ok){Fail 'Apple Recovery download failed; existing USB partition left intact.'}
  Copy-Item $dmg $cacheDmg -Force;Copy-Item $chunk $cacheChunk -Force;Write-Host ('RECOVERY_CACHE_SAVED: '+$RecoveryCache)
 }
 $verify=Join-Path $Work 'verify.py'
 @('import importlib.util, sys','s=sys.argv[1]','spec=importlib.util.spec_from_file_location("macrecovery",s)','m=importlib.util.module_from_spec(spec)','spec.loader.exec_module(m)','m.verify_image(sys.argv[2],sys.argv[3])')|Set-Content $verify -Encoding ASCII
 & $pyexe @pyargs $verify $mr[0].FullName $dmg $chunk;if($LASTEXITCODE -ne 0){Fail 'Apple chunklist verification failed.'}
 Write-Host 'APPLE_RECOVERY_CHUNKLIST_VERIFICATION_OK' -ForegroundColor Green
 Write-Host 'STEP 4: Identify or resume the temporary FAT32 Basic-Data volume...'
 if($resumeExisting){
  $chosenLetter=[string](Get-Partition -DiskNumber $d.Number -PartitionNumber $resumePartitionNumber -ErrorAction Stop).DriveLetter
  $part=Get-Partition -DiskNumber $d.Number -PartitionNumber $resumePartitionNumber -ErrorAction Stop
  Write-Host ("RESUMING_VERIFIED_PARTITION: "+$chosenLetter+": (no clean, no format)") -ForegroundColor Yellow
 }else{
  # Fresh build only when the target disk is completely unallocated.
  $used=@(Get-CimInstance Win32_LogicalDisk -ErrorAction SilentlyContinue|ForEach-Object{([string]$_.DeviceID).TrimEnd(':')})
  foreach($candidate in @('Z','Y','X','W','V','U','T','S','R','Q')){if($used -notcontains $candidate){$chosenLetter=$candidate;break}}
  if([string]::IsNullOrWhiteSpace($chosenLetter)){Fail 'No free drive letter available.'}
  $dp=Join-Path $Work 'create-usb.txt'
  @("select disk $($d.Number)",'clean','convert gpt','create partition primary size=16000','format fs=fat32 quick label=OC-SEQUOIA',"assign letter=$chosenLetter",'exit')|Set-Content -LiteralPath $dp -Encoding ASCII
  $dpout=& diskpart.exe /s $dp 2>&1
  $dpout|ForEach-Object{Write-Host ([string]$_)}
  if($LASTEXITCODE -ne 0){Fail "DiskPart failed with exit code $LASTEXITCODE."}
  if(Get-Command Update-HostStorageCache -ErrorAction SilentlyContinue){Update-HostStorageCache -ErrorAction SilentlyContinue}
  Start-Sleep -Seconds 3
  $newParts=@(Get-Partition -DiskNumber $d.Number -ErrorAction Stop)
  $dataParts=@($newParts|Where-Object{([string]$_.GptType).Trim('{}').ToLowerInvariant() -eq $BasicData -and $_.Size -ge 15GB -and $_.Size -le 17GB -and [string]$_.DriveLetter -eq $chosenLetter})
  if($dataParts.Count -ne 1){Fail "Expected one 16GB Basic-Data partition with drive "+$chosenLetter+"; found "+$dataParts.Count+"."}
  $part=$dataParts[0]
 }
 if($part.Size -lt 15GB -or $part.Size -gt 17GB -or [string]$part.DriveLetter -ne $chosenLetter){Fail "USB partition identity/size/drive-letter verification failed."}
 $espTemporarilyChanged=$true
 $root=$chosenLetter+':\';$logical=$null
 for($i=1;$i -le 15;$i++){
  if(Get-Command Update-HostStorageCache -ErrorAction SilentlyContinue){Update-HostStorageCache -ErrorAction SilentlyContinue}
  Start-Sleep -Seconds 2
  $logical=Get-CimInstance Win32_LogicalDisk -Filter ("DeviceID='"+$chosenLetter+":'") -ErrorAction SilentlyContinue
  if($logical -and $logical.FileSystem -eq 'FAT32' -and $logical.VolumeName -eq 'OC-SEQUOIA' -and (Test-Path $root)){break}
 }
 if(!$logical -or $logical.FileSystem -ne 'FAT32' -or $logical.VolumeName -ne 'OC-SEQUOIA' -or !(Test-Path $root)){Fail "New FAT32 volume not accessible/verified: drive=$chosenLetter; fs=$($logical.FileSystem); label=$($logical.VolumeName)."}
 Write-Host "TEMPORARY_BASIC_DATA_VOLUME_VERIFIED: $root" -ForegroundColor Green
 Write-Host 'STEP 5: Copy EFI and Recovery files...'
 $efiroot=Join-Path $root 'EFI';if(Test-Path $efiroot){Remove-Item $efiroot -Recurse -Force};New-Item -ItemType Directory $efiroot -Force|Out-Null
 Get-ChildItem $src -Force|ForEach-Object{Copy-Item $_.FullName -Destination $efiroot -Recurse -Force}
 $recDest=Join-Path $root 'com.apple.recovery.boot';if(Test-Path $recDest){Remove-Item $recDest -Recurse -Force};Copy-Item $rec $root -Recurse -Force
 foreach($f in $files){$rel=$f.FullName.Substring($src.Length).TrimStart([char]92);$dest=Join-Path $efiroot $rel;if(!(Test-Path $dest -PathType Leaf) -or (Hash $dest) -ne (Hash $f.FullName)){Fail "EFI SHA256 mismatch: $rel"}}
 foreach($n in @('BaseSystem.dmg','BaseSystem.chunklist')){$a=Join-Path $rec $n;$b=Join-Path $recDest $n;if(!(Test-Path $b -PathType Leaf) -or (Hash $a) -ne (Hash $b)){Fail "Recovery SHA256 mismatch: $n"}}
 @('B460M Sequoia NO-SS04 USB build',("DISK="+$d.Number),("SERIAL="+$Serial),'GPT=YES','FAT32=YES','ESP_TYPE=APPLIED_AFTER_COPY_VERIFICATION',("EFI_FILES="+$files.Count),'HS04_SS04=ABSENT','APPLE_RECOVERY_CHUNKLIST=VERIFIED','SHA256_COPY=PASS')|Set-Content (Join-Path $root 'USB-BUILD-REPORT.txt') -Encoding ASCII
 # Remove the temporary drive letter and restore the required ESP type before boot.
 Remove-PartitionAccessPath -DiskNumber $d.Number -PartitionNumber $part.PartitionNumber -AccessPath $root -ErrorAction Stop
 Set-Partition -DiskNumber $d.Number -PartitionNumber $part.PartitionNumber -GptType $Esp -ErrorAction Stop
 $espTemporarilyChanged=$false
 $finalPart=Get-Partition -DiskNumber $d.Number -PartitionNumber $part.PartitionNumber -ErrorAction Stop
 if(([string]$finalPart.GptType).Trim('{}').ToLowerInvariant() -ne $Esp -or $finalPart.DriveLetter){Fail 'Final ESP restoration check failed.'}
 Write-Host 'FINAL_PARTITION_TYPE=EFI_SYSTEM_PARTITION; DRIVE_LETTER=REMOVED' -ForegroundColor Green
 Write-Host 'USB_BUILD_SUCCESS' -ForegroundColor Green;Write-Host "USB_ROOT=$root";Write-Host "EFI_FILES_VERIFIED=$($files.Count)";Write-Host 'APPLE_RECOVERY=VERIFIED';Write-Host 'COPY_SHA256=PASS';Write-Host 'DISK_REBUILT_FROM_UNALLOCATED_STATE=YES'
}catch{Write-Host ("ERROR: "+$_.Exception.Message) -ForegroundColor Red;exit 1}
finally{
 if($espTemporarilyChanged){
  try{
   if($chosenLetter){Remove-PartitionAccessPath -DiskNumber $d.Number -PartitionNumber $part.PartitionNumber -AccessPath ($chosenLetter+':\') -ErrorAction SilentlyContinue}
   Set-Partition -DiskNumber $d.Number -PartitionNumber $part.PartitionNumber -GptType $Esp -ErrorAction Stop
   Write-Host 'SAFETY_RESTORE: ESP type restored after interrupted copy.' -ForegroundColor Yellow
  }catch{Write-Host ("CRITICAL: Could not restore ESP type automatically: "+$_.Exception.Message) -ForegroundColor Red}
 }
 if(Test-Path $Work){Remove-Item $Work -Recurse -Force -ErrorAction SilentlyContinue}
}

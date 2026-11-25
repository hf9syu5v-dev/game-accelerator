# Clean rebuild of the authorized LITEON Sequoia USB. Windows PowerShell 5.1, Administrator.
$ErrorActionPreference='Stop'; $ProgressPreference='SilentlyContinue'
$Model='LITEON I T LCS-128L9S'; $Serial='000000123ADC'; $Esp='c12a7328-f81f-11d2-ba4b-00a0c93ec93b'
$Artifact=Join-Path $env:USERPROFILE 'Downloads\B460M-NO-SS04-DIAGNOSTIC-ARTIFACT.zip'
$OCUrl='https://github.com/acidanthera/OpenCorePkg/releases/download/1.0.8/OpenCore-1.0.8-DEBUG.zip'
$OCHash='3F5F42B85703CF2C08E8DCD9245A52FB4326C9F4EF335C75B49F516CBBE131C6'
$Work=Join-Path $env:TEMP ('B460M-Rebuild-'+[guid]::NewGuid().ToString('N')); $Letter=$null
function Fail([string]$s){throw $s}
function Hash([string]$p){(Get-FileHash -LiteralPath $p -Algorithm SHA256).Hash.ToLowerInvariant()}
try {
 Write-Host '=== CLEAN REBUILD: B460M Sequoia NO-SS04 USB ===' -ForegroundColor Cyan
 if($PSVersionTable.PSVersion.Major -ne 5 -or $PSVersionTable.PSVersion.Minor -ne 1){Fail 'Requires Windows PowerShell 5.1.'}
 $wi=[Security.Principal.WindowsIdentity]::GetCurrent();$wp=New-Object Security.Principal.WindowsPrincipal($wi)
 if(!$wp.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)){Fail 'Run PowerShell as Administrator.'}
 $ds=@(Get-Disk|Where-Object{$_.FriendlyName -eq $Model -and $_.SerialNumber -and (($_.SerialNumber.Trim() -replace '\s','') -eq $Serial) -and $_.BusType -eq 'USB' -and $_.Size -ge 115GB -and $_.Size -le 125GB})
 if($ds.Count -ne 1){Fail "Safety stop: expected one matching USB, found $($ds.Count)."}
 $d=$ds[0];if($d.IsBoot -or $d.IsSystem -or $d.IsReadOnly -or $d.IsOffline){Fail 'Safety stop: target is boot/system/read-only/offline.'}
 $d|Format-List Number,FriendlyName,SerialNumber,BusType,Size,PartitionStyle,IsBoot,IsSystem
 if(!(Test-Path -LiteralPath $Artifact -PathType Leaf)){Fail "Missing diagnostic artifact ZIP: $Artifact"}
 New-Item -ItemType Directory -Path $Work -Force|Out-Null
 Write-Host 'STEP 1/5: Extract and validate diagnostic EFI...'
 Add-Type -AssemblyName System.IO.Compression.FileSystem
 $outer=Join-Path $Work 'outer';[IO.Compression.ZipFile]::ExtractToDirectory($Artifact,$outer)
 $inner=Get-ChildItem $outer -Filter 'B460M-no-SS04-Diagnostic-EFI.zip' -File -Recurse|Select-Object -First 1
 if(!$inner){Fail 'Nested B460M-no-SS04-Diagnostic-EFI.zip missing.'}
 $idir=Join-Path $Work 'inner';[IO.Compression.ZipFile]::ExtractToDirectory($inner.FullName,$idir)
 $efis=@(Get-ChildItem $idir -Directory -Filter EFI -Recurse);if($efis.Count -ne 1){Fail "EFI directory count=$($efis.Count)"}
 $src=$efis[0].FullName
 $required=@('BOOT\BOOTx64.efi','OC\OpenCore.efi','OC\config.plist','OC\Kexts\UTBMap.kext\Contents\Info.plist')
 foreach($r in $required){if(!(Test-Path (Join-Path $src $r) -PathType Leaf)){Fail "Missing EFI file: $r"}}
 $files=@(Get-ChildItem $src -File -Recurse);if($files.Count -lt 20){Fail 'EFI file count suspicious.'}
 $map=Get-Content (Join-Path $src 'OC\Kexts\UTBMap.kext\Contents\Info.plist') -Raw
 if($map -match 'key>\s*HS04\s*<' -or $map -match 'key>\s*SS04\s*<'){Fail 'HS04/SS04 unexpectedly present in diagnostic EFI.'}
 Write-Host "EFI_SOURCE_OK; FILES=$($files.Count); HS04_SS04=ABSENT" -ForegroundColor Green

 Write-Host 'STEP 2/5: Locate Python 3...'
 $pyexe=$null;$pyargs=@();$cmd=Get-Command py.exe -ErrorAction SilentlyContinue
 if($cmd){$pyexe=$cmd.Source;$pyargs=@('-3')}else{
  $cmd=Get-Command python.exe -ErrorAction SilentlyContinue;if(!$cmd){$cmd=Get-Command python3.exe -ErrorAction SilentlyContinue}
  if($cmd){$pyexe=$cmd.Source}else{
   $root=Join-Path $env:LOCALAPPDATA 'Programs\Python'
   if(Test-Path $root){$f=Get-ChildItem $root -Filter python.exe -File -Recurse -ErrorAction SilentlyContinue|Sort-Object FullName -Descending|Select-Object -First 1;if($f){$pyexe=$f.FullName}}
  }
 }
 if(!$pyexe){Fail 'Python 3 not found. USB unchanged.'}
 $pv=& $pyexe @pyargs --version 2>&1;if($LASTEXITCODE -ne 0 -or $pv -notmatch '^Python 3\.'){Fail "Python check failed: $pv"}
 Write-Host "PYTHON_OK: $pv" -ForegroundColor Green

 Write-Host 'STEP 3/5: Download and verify OpenCore 1.0.8 tools...'
 $ocz=Join-Path $Work 'OpenCore.zip';Invoke-WebRequest -Uri $OCUrl -OutFile $ocz -UseBasicParsing
 if((Hash $ocz) -ne $OCHash.ToLowerInvariant()){Fail 'OpenCore ZIP SHA256 mismatch.'}
 $ocdir=Join-Path $Work 'oc';Expand-Archive -LiteralPath $ocz -DestinationPath $ocdir -Force
 $mr=@(Get-ChildItem $ocdir -Filter macrecovery.py -File -Recurse);if($mr.Count -ne 1){Fail 'macrecovery.py not uniquely found.'}
 Write-Host 'STEP 4/5: Reuse local Sequoia Recovery when available; otherwise download and verify...'
 $rec=Join-Path $Work 'com.apple.recovery.boot';New-Item -ItemType Directory $rec -Force|Out-Null
 $dmg=Join-Path $rec 'BaseSystem.dmg';$chunk=Join-Path $rec 'BaseSystem.chunklist'
 $localPair=$null
 # First inspect the authorized USB itself; its previous successful build may already contain Recovery.
 $targetParts=@(Get-Partition -DiskNumber $d.Number -ErrorAction SilentlyContinue)
 foreach($tp in $targetParts){$tv=$tp | Get-Volume -ErrorAction SilentlyContinue;if($tv -and $tv.DriveLetter){$candidate=Join-Path ($tv.DriveLetter+':\') 'com.apple.recovery.boot';if((Test-Path (Join-Path $candidate 'BaseSystem.dmg') -PathType Leaf) -and (Test-Path (Join-Path $candidate 'BaseSystem.chunklist') -PathType Leaf)){$localPair=$candidate;break}}}
 $searchRoots=@((Join-Path $env:USERPROFILE 'Downloads'),(Join-Path $env:USERPROFILE 'Desktop'),(Join-Path $env:USERPROFILE 'Documents'))
 if(!$localPair){foreach($sr in $searchRoots){if(Test-Path $sr){$hit=Get-ChildItem -LiteralPath $sr -Filter 'BaseSystem.dmg' -File -Recurse -ErrorAction SilentlyContinue | Where-Object{Test-Path (Join-Path $_.DirectoryName 'BaseSystem.chunklist') -PathType Leaf} | Select-Object -First 1;if($hit){$localPair=$hit.DirectoryName;break}}}}
 if($localPair){
  Write-Host "LOCAL_RECOVERY_FOUND: $localPair" -ForegroundColor Green
  Copy-Item -LiteralPath (Join-Path $localPair 'BaseSystem.dmg') -Destination $dmg
  Copy-Item -LiteralPath (Join-Path $localPair 'BaseSystem.chunklist') -Destination $chunk
 }else{
  Write-Host 'No local Recovery pair found; downloading from Apple with up to 6 retries.'
  $downloadOK=$false
  for($attempt=1;$attempt -le 6;$attempt++){
   Write-Host "Apple Recovery download attempt $attempt/6..."
   Remove-Item -LiteralPath $dmg,$chunk -Force -ErrorAction SilentlyContinue
   Push-Location $mr[0].DirectoryName
   try{& $pyexe @pyargs $mr[0].FullName -b Mac-7BA5B2D9E42DDD94 -m 00000000000000000 -o $rec download;$rc=$LASTEXITCODE}finally{Pop-Location}
   if($rc -eq 0 -and (Test-Path $dmg -PathType Leaf) -and (Test-Path $chunk -PathType Leaf) -and (Get-Item $dmg).Length -ge 100MB -and (Get-Item $chunk).Length -ge 1KB){$downloadOK=$true;break}
   Write-Warning "Apple download attempt $attempt failed (exit=$rc). Partial files will be discarded."
   if($attempt -lt 6){Start-Sleep -Seconds ([math]::Min(30,5*$attempt))}
  }
  if(!$downloadOK){Fail 'Apple Recovery download failed after 6 attempts. USB unchanged.'}
 }
 if((Get-Item $dmg).Length -lt 100MB -or (Get-Item $chunk).Length -lt 1KB){Fail 'Apple Recovery size check failed.'}
 $verifyPy=Join-Path $Work 'verify_recovery.py'
 @('import importlib.util, sys','p = sys.argv[1]','spec = importlib.util.spec_from_file_location("macrecovery", p)','m = importlib.util.module_from_spec(spec)','spec.loader.exec_module(m)','m.verify_image(sys.argv[2], sys.argv[3])') | Set-Content -LiteralPath $verifyPy -Encoding ASCII
 & $pyexe @pyargs $verifyPy $mr[0].FullName $dmg $chunk
 if($LASTEXITCODE -ne 0){Fail 'Apple chunklist verification failed. USB unchanged.'}
 Write-Host "APPLE_RECOVERY_CHUNKLIST_VERIFICATION_OK; DMG_BYTES=$((Get-Item $dmg).Length)" -ForegroundColor Green

 Write-Host 'STEP 5/5: Recheck disk identity, clean, format GPT/FAT32 ESP, copy and verify...'
 $now=Get-Disk -Number $d.Number
 if($now.FriendlyName -ne $Model -or (($now.SerialNumber.Trim() -replace '\s','') -ne $Serial) -or $now.BusType -ne 'USB' -or $now.IsBoot -or $now.IsSystem){Fail 'USB identity changed before formatting.'}
 $used=@(Get-Volume|Where-Object DriveLetter|ForEach-Object{[string]$_.DriveLetter})
 foreach($x in @('E','Z','Y','X','W','V','U','T','S','R')){if($used -notcontains $x){$Letter=$x;break}}
 if(!$Letter){Fail 'No free drive letter; USB unchanged.'}
 Write-Host "DESTRUCTIVE TARGET: Disk $($d.Number), $Model, serial $Serial, $([math]::Round($d.Size/1GB,2)) GB" -ForegroundColor Yellow
 Write-Host 'ALL PARTITIONS AND FILES ON THIS USB WILL BE ERASED.' -ForegroundColor Red
 Write-Host ('New GPT, 16GB FAT32 EFI System Partition, drive '+$Letter+':')
 Write-Host 'Internal disks WD SN720 and HP EX900 Plus are not targets.'
 Write-Host 'Confirmation code: 43024' -ForegroundColor Yellow
 $answer=Read-Host 'Enter 43024 to erase and rebuild this USB'
 if($answer.Trim() -cne '43024'){Fail 'Cancelled; USB unchanged.'}
 $dp=Join-Path $Work 'diskpart.txt'
 @("select disk $($d.Number)",'clean','convert gpt','create partition efi size=16000','format fs=fat32 quick label=OC-SEQUOIA',"assign letter=$Letter",'exit')|Set-Content $dp -Encoding ASCII
 $out=& diskpart.exe /s $dp 2>&1;$out|ForEach-Object{Write-Host $_};if($LASTEXITCODE -ne 0){Fail "DiskPart exit=$LASTEXITCODE"}
 # Refresh the Windows storage cache; Get-Volume -DriveLetter can miss a freshly assigned DiskPart volume.
 if(Get-Command Update-HostStorageCache -ErrorAction SilentlyContinue){Update-HostStorageCache -ErrorAction SilentlyContinue}
 $root=$Letter+':\';$part=$null;$logical=$null
 for($verifyTry=1;$verifyTry -le 10;$verifyTry++){
  Start-Sleep -Seconds 2
  $part=@(Get-Partition -DiskNumber $d.Number -ErrorAction SilentlyContinue | Where-Object{$_.DriveLetter -eq $Letter -and ([string]$_.GptType).Trim('{}').ToLowerInvariant() -eq $Esp -and $_.Size -ge 15GB -and $_.Size -le 17GB}) | Select-Object -First 1
  $logical=Get-CimInstance Win32_LogicalDisk -Filter ("DeviceID='"+$Letter+":'") -ErrorAction SilentlyContinue
  if($part -and $logical -and $logical.FileSystem -eq 'FAT32' -and $logical.VolumeName -eq 'OC-SEQUOIA' -and (Test-Path $root)){break}
 }
 if(!$part -or $part.DiskNumber -ne $d.Number -or !$logical -or $logical.FileSystem -ne 'FAT32' -or $logical.VolumeName -ne 'OC-SEQUOIA' -or !(Test-Path $root)){Fail "Format verification failed after retry: partition_found=$([bool]$part), logical_disk_found=$([bool]$logical), fs=$($logical.FileSystem), label=$($logical.VolumeName), root_accessible=$(Test-Path $root). DiskPart reported format/assign success; USB was not cleaned again."}
 New-Item -ItemType Directory (Join-Path $root 'EFI') -Force|Out-Null
 Get-ChildItem $src -Force|ForEach-Object{Copy-Item $_.FullName -Destination (Join-Path $root 'EFI') -Recurse -Force}
 Copy-Item -LiteralPath $rec -Destination $root -Recurse -Force
 foreach($f in $files){$rel=$f.FullName.Substring($src.Length).TrimStart([char]92);$dest=Join-Path (Join-Path $root 'EFI') $rel;if(!(Test-Path $dest -PathType Leaf) -or (Hash $dest) -ne (Hash $f.FullName)){Fail "EFI SHA256 mismatch: $rel"}}
 foreach($n in @('BaseSystem.dmg','BaseSystem.chunklist')){$a=Join-Path $rec $n;$b=Join-Path (Join-Path $root 'com.apple.recovery.boot') $n;if(!(Test-Path $b -PathType Leaf) -or (Hash $a) -ne (Hash $b)){Fail "Recovery SHA256 mismatch: $n"}}
 @('B460M Sequoia NO-SS04 clean rebuild',"DISK=$($d.Number)","SERIAL=$Serial",'GPT=YES','ESP=YES','FAT32=YES',"EFI_FILES=$($files.Count)",'HS04_SS04=ABSENT','APPLE_RECOVERY_CHUNKLIST=VERIFIED','SHA256_COPY=PASS','INTERNAL_DISKS=NOT_TOUCHED')|Set-Content (Join-Path $root 'USB-BUILD-REPORT.txt') -Encoding ASCII
 Write-Host 'CLEAN_REBUILD_SUCCESS' -ForegroundColor Green
 Write-Host "USB_ROOT=$root";Write-Host "EFI_FILES_VERIFIED=$($files.Count)";Write-Host 'HS04_SS04=ABSENT';Write-Host 'APPLE_RECOVERY=VERIFIED';Write-Host 'COPY_SHA256=PASS';Write-Host 'INTERNAL_DISKS=NOT_TOUCHED'
} catch {Write-Host ("ERROR: "+$_.Exception.Message) -ForegroundColor Red;exit 1}
finally {if(Test-Path $Work){Remove-Item $Work -Recurse -Force -ErrorAction SilentlyContinue}}

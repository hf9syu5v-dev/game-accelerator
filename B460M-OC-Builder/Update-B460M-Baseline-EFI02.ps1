#requires -Version 5.1
[CmdletBinding()]
param([Parameter(Mandatory=$true)][ValidateSet("Prepare","Apply")][string]$Step,[string]$DriveLetter="F")
$ErrorActionPreference="Stop"
Set-StrictMode -Version Latest
$DriveLetter=$DriveLetter.TrimEnd(":").ToUpperInvariant()
if($DriveLetter -notmatch '^[A-Z]$'){throw "DriveLetter must be one letter."}
$Root=$DriveLetter+":\"
$ActiveEfi=Join-Path $Root "EFI"
$Recovery=Join-Path $Root "com.apple.recovery.boot"
$BaseUrl="https://github.com/hf9syu5v-dev/game-accelerator/releases/download/b460m-baseline-efi02-sequoia-oc108/B460M-Baseline-EFI-02.zip"
$ExpectedZipSha256="c639d82cf099da15afe6fce1b15b47e833c62a9bb77d628a1ccaff4953c1086c"
$ExpectedRecovery=@{
 "BaseSystem.dmg"="7314eb401f5e84087f621b3599f0ad21ca3cdcc2685ea2da7f76806792328e20"
 "BaseSystem.chunklist"="dbf262b83a16d55f1b2d8ce8ce95986561f8e889719524ea4b7aa22a2417ca27"
}
$ScriptDir=Split-Path -Parent $MyInvocation.MyCommand.Path
$StatePath=Join-Path $ScriptDir "B460M-Baseline-EFI02-Prepared.json"

function Assert-UsbIdentity {
 if(-not(Test-Path -LiteralPath $Root -PathType Container)){throw "Drive $($DriveLetter): is not available."}
 $parts=@(Get-Partition -DriveLetter $DriveLetter)
 if($parts.Count -ne 1){throw "Safety stop: expected exactly one mounted partition."}
 $partition=$parts[0]; $disk=Get-Disk -Number $partition.DiskNumber; $volume=Get-Volume -DriveLetter $DriveLetter
 if($disk.BusType -ne "USB"){throw "Safety stop: selected drive is not USB."}
 if($disk.Model -notmatch "LITEON I T LCS-128L9S"){throw "Safety stop: unexpected USB model: $($disk.Model)"}
 if(($disk.SerialNumber -replace '\s','') -ne "000000123ADC"){throw "Safety stop: unexpected USB serial: $($disk.SerialNumber)"}
 if($disk.Size -lt 110000000000 -or $disk.Size -gt 130000000000){throw "Safety stop: unexpected USB capacity."}
 if($disk.PartitionStyle -ne "GPT" -or $disk.IsBoot -or $disk.IsSystem){throw "Safety stop: unsafe partition style or Boot/System disk."}
 if($partition.GptType -ne "{c12a7328-f81f-11d2-ba4b-00a0c93ec93b}"){throw "Safety stop: partition is not EFI System Partition."}
 if($volume.FileSystem -ne "FAT32"){throw "Safety stop: EFI volume is not FAT32."}
 Write-Host "USB identity verified." -ForegroundColor Green
}
function Assert-RecoveryReadOnly {
 if(-not(Test-Path -LiteralPath $Recovery -PathType Container)){throw "Recovery directory missing."}
 foreach($name in $ExpectedRecovery.Keys){
  $p=Join-Path $Recovery $name
  if(-not(Test-Path -LiteralPath $p -PathType Leaf)){throw "Recovery file missing: $name"}
  if((Get-FileHash -LiteralPath $p -Algorithm SHA256).Hash.ToLowerInvariant() -ne $ExpectedRecovery[$name]){throw "Recovery hash mismatch: $name"}
 }
 Write-Host "Recovery payload hashes verified; Recovery is not modified." -ForegroundColor Green
}
function Assert-EfiFolder {
 param([string]$Path,[switch]$ForCandidate)
 foreach($r in @("BOOT\BOOTx64.efi","OC\OpenCore.efi","OC\config.plist","OC\Drivers\OpenRuntime.efi","OC\Drivers\HfsPlus.efi")){
  if(-not(Test-Path -LiteralPath (Join-Path $Path $r) -PathType Leaf)){throw "EFI missing required file: $r"}
 }
 if($ForCandidate){
  $cfg=Get-Content -LiteralPath (Join-Path $Path "OC\config.plist") -Raw
  if($cfg -match "-radvesa" -or $cfg -match "-wegnoigpu"){throw "EFI has obsolete graphics-isolation boot arguments."}
  if($cfg -notmatch "iMac20,1"){throw "EFI iMac20,1 marker missing."}
 }
}
function Assert-Manifest {
 param([string]$ManifestPath,[string]$EfiRoot)
 if(-not(Test-Path -LiteralPath $ManifestPath -PathType Leaf)){throw "EFI-SHA256SUMS.txt missing."}
 $n=0
 foreach($line in Get-Content -LiteralPath $ManifestPath){
  if([string]::IsNullOrWhiteSpace($line)){continue}
  if($line -notmatch '^([0-9a-fA-F]{64})\s+\*?(.+)){throw "Malformed manifest line: $line"}
  $expected=$Matches[1].ToLowerInvariant(); $relative=$Matches[2].Replace("/","\")
  if($relative -match '(^|\\)\.\.(\\|$)' -or [IO.Path]::IsPathRooted($relative)){throw "Unsafe manifest path."}
  $file=Join-Path $EfiRoot $relative
  if(-not(Test-Path -LiteralPath $file -PathType Leaf)){throw "Manifest file missing: $relative"}
  if((Get-FileHash -LiteralPath $file -Algorithm SHA256).Hash.ToLowerInvariant() -ne $expected){throw "Manifest SHA256 mismatch: $relative"}
  $n++
 }
 if($n -lt 10){throw "Manifest contains too few files: $n"}
 Write-Host "EFI manifest verified: $n files." -ForegroundColor Green
}
function Assert-StagePath {
 param([string]$Path)
 $rootFull=[IO.Path]::GetFullPath($Root); $pathFull=[IO.Path]::GetFullPath($Path)
 if(-not $pathFull.StartsWith($rootFull,[StringComparison]::OrdinalIgnoreCase)){throw "Stage is outside USB root."}
 if((Split-Path -Leaf $pathFull) -notmatch '^EFI-BASELINE02-STAGING-[0-9a-f]{32}$'){throw "Unexpected stage directory name."}
 if((Get-Item -LiteralPath $pathFull -Force).Attributes -band [IO.FileAttributes]::ReparsePoint){throw "Stage is a reparse point."}
}
Assert-UsbIdentity
Assert-RecoveryReadOnly

if($Step -eq "Prepare"){
 if(-not(Test-Path -LiteralPath $ActiveEfi -PathType Container)){throw "Current EFI directory missing."}
 Assert-EfiFolder -Path $ActiveEfi
 $work=Join-Path $env:TEMP ("B460M-Baseline02-"+[guid]::NewGuid().ToString("N"))
 $extract=Join-Path $work "extract"; $zip=Join-Path $work "B460M-Baseline-EFI-02.zip"
 $stage=Join-Path $Root ("EFI-BASELINE02-STAGING-"+[guid]::NewGuid().ToString("N"))
 New-Item -ItemType Directory -Path $work | Out-Null
 try{
  Invoke-WebRequest -Uri $BaseUrl -OutFile $zip -UseBasicParsing
  $hash=(Get-FileHash -LiteralPath $zip -Algorithm SHA256).Hash.ToLowerInvariant()
  if($hash -ne $ExpectedZipSha256){throw "EFI-02 ZIP SHA256 mismatch: $hash"}
  Expand-Archive -LiteralPath $zip -DestinationPath $extract
  $source=Join-Path $extract "EFI"; $manifest=Join-Path $work "EFI-SHA256SUMS.txt"
  Invoke-WebRequest -Uri "https://github.com/hf9syu5v-dev/game-accelerator/releases/download/b460m-baseline-efi02-sequoia-oc108/EFI-SHA256SUMS.txt" -OutFile $manifest -UseBasicParsing
  if(-not(Test-Path -LiteralPath $source -PathType Container)){throw "ZIP has no EFI directory at root."}
  Assert-Manifest -ManifestPath $manifest -EfiRoot $source
  Assert-EfiFolder -Path $source -ForCandidate
  New-Item -ItemType Directory -Path $stage | Out-Null
  Get-ChildItem -LiteralPath $source -Force | Copy-Item -Destination $stage -Recurse
  Assert-Manifest -ManifestPath $manifest -EfiRoot $stage
  Assert-EfiFolder -Path $stage -ForCandidate
  [ordered]@{Version=2;DriveLetter=$DriveLetter;StagePath=$stage;ZipSha256=$ExpectedZipSha256;PreparedAt=(Get-Date).ToString("o");WorkPath=$work;ManifestPath=$manifest} | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath $StatePath -Encoding UTF8
  Write-Host "PREPARE_SUCCESS" -ForegroundColor Green
  Write-Host "Staging path: $stage"
  Write-Host "Active EFI has NOT been changed."
  Write-Host "After checking this result, run the same script with -Step Apply."
 }catch{if(Test-Path -LiteralPath $stage){Write-Warning "Incomplete stage retained: $stage"};throw}
}
elseif($Step -eq "Apply"){
 if(-not(Test-Path -LiteralPath $StatePath -PathType Leaf)){throw "No prepared state. Run Prepare first."}
 $state=Get-Content -LiteralPath $StatePath -Raw | ConvertFrom-Json
 if($state.Version -ne 2 -or $state.DriveLetter -ne $DriveLetter -or $state.ZipSha256 -ne $ExpectedZipSha256){throw "Prepared state/package mismatch. Run Prepare again."}
 $stage=[string]$state.StagePath; Assert-StagePath -Path $stage
 if(-not(Test-Path -LiteralPath $stage -PathType Container)){throw "Staging directory missing."}
 $manifest=[string]$state.ManifestPath
 if(-not $manifest.StartsWith([string]$state.WorkPath,[StringComparison]::OrdinalIgnoreCase)){throw "Manifest path is outside prepared work directory."}
 Assert-Manifest -ManifestPath $manifest -EfiRoot $stage
 Assert-EfiFolder -Path $stage -ForCandidate
 if(-not(Test-Path -LiteralPath $ActiveEfi -PathType Container)){throw "Active EFI directory missing."}
 $backup=Join-Path $Root ("EFI-PREVIOUS-BASELINE02-"+[guid]::NewGuid().ToString("N"))
 $failed=Join-Path $Root ("EFI-FAILED-BASELINE02-"+[guid]::NewGuid().ToString("N"))
 Write-Host "Only $ActiveEfi will be replaced. Backup: $backup"
 Write-Host "Recovery and Recovery staging directories, E:, and internal disks are not targets."
 $confirm=Read-Host "Type APPLY-BASELINE-02 to continue"
 if($confirm -cne "APPLY-BASELINE-02"){throw "Cancelled. No EFI changes made."}
 $oldMoved=$false; $newMoved=$false
 try{
  Rename-Item -LiteralPath $ActiveEfi -NewName (Split-Path $backup -Leaf); $oldMoved=$true
  Rename-Item -LiteralPath $stage -NewName "EFI"; $newMoved=$true
  Assert-EfiFolder -Path $ActiveEfi -ForCandidate
  Assert-Manifest -ManifestPath $manifest -EfiRoot $ActiveEfi
  Assert-RecoveryReadOnly
  Write-Host "BASELINE02_DEPLOYMENT_SUCCESS" -ForegroundColor Green
  Write-Host "Previous EFI backup retained: $backup"
  Remove-Item -LiteralPath $StatePath -Force
 }catch{
  $failure=$_
  if($newMoved -and (Test-Path -LiteralPath $ActiveEfi)){Rename-Item -LiteralPath $ActiveEfi -NewName (Split-Path $failed -Leaf);Write-Warning "Failed candidate retained: $failed"}
  if($oldMoved -and (Test-Path -LiteralPath $backup)){Rename-Item -LiteralPath $backup -NewName "EFI";Write-Warning "Previous EFI restored."}
  throw $failure
 }
}
){throw "Malformed manifest line: $line"}
  $expected=$Matches[1].ToLowerInvariant(); $relative=$Matches[2].Replace("/","\")
  if($relative -match '(^|\\)\.\.(\\|$)' -or [IO.Path]::IsPathRooted($relative)){throw "Unsafe manifest path."}
  $file=Join-Path $EfiRoot $relative
  if(-not(Test-Path -LiteralPath $file -PathType Leaf)){throw "Manifest file missing: $relative"}
  if((Get-FileHash -LiteralPath $file -Algorithm SHA256).Hash.ToLowerInvariant() -ne $expected){throw "Manifest SHA256 mismatch: $relative"}
  $n++
 }
 if($n -lt 10){throw "Manifest contains too few files: $n"}
 Write-Host "EFI manifest verified: $n files." -ForegroundColor Green
}
function Assert-StagePath {
 param([string]$Path)
 $rootFull=[IO.Path]::GetFullPath($Root); $pathFull=[IO.Path]::GetFullPath($Path)
 if(-not $pathFull.StartsWith($rootFull,[StringComparison]::OrdinalIgnoreCase)){throw "Stage is outside USB root."}
 if((Split-Path -Leaf $pathFull) -notmatch '^EFI-BASELINE02-STAGING-[0-9a-f]{32}$'){throw "Unexpected stage directory name."}
 if((Get-Item -LiteralPath $pathFull -Force).Attributes -band [IO.FileAttributes]::ReparsePoint){throw "Stage is a reparse point."}
}
Assert-UsbIdentity
Assert-RecoveryReadOnly

if($Step -eq "Prepare"){
 if(-not(Test-Path -LiteralPath $ActiveEfi -PathType Container)){throw "Current EFI directory missing."}
 Assert-EfiFolder -Path $ActiveEfi
 $work=Join-Path $env:TEMP ("B460M-Baseline02-"+[guid]::NewGuid().ToString("N"))
 $extract=Join-Path $work "extract"; $zip=Join-Path $work "B460M-Baseline-EFI-02.zip"
 $stage=Join-Path $Root ("EFI-BASELINE02-STAGING-"+[guid]::NewGuid().ToString("N"))
 New-Item -ItemType Directory -Path $work | Out-Null
 try{
  Invoke-WebRequest -Uri $BaseUrl -OutFile $zip -UseBasicParsing
  $hash=(Get-FileHash -LiteralPath $zip -Algorithm SHA256).Hash.ToLowerInvariant()
  if($hash -ne $ExpectedZipSha256){throw "EFI-02 ZIP SHA256 mismatch: $hash"}
  Expand-Archive -LiteralPath $zip -DestinationPath $extract
  $source=Join-Path $extract "EFI"; $manifest=Join-Path $work "EFI-SHA256SUMS.txt"
  Invoke-WebRequest -Uri "https://github.com/hf9syu5v-dev/game-accelerator/releases/download/b460m-baseline-efi02-sequoia-oc108/EFI-SHA256SUMS.txt" -OutFile $manifest -UseBasicParsing
  if(-not(Test-Path -LiteralPath $source -PathType Container)){throw "ZIP has no EFI directory at root."}
  Assert-Manifest -ManifestPath $manifest -EfiRoot $source
  Assert-EfiFolder -Path $source -ForCandidate
  New-Item -ItemType Directory -Path $stage | Out-Null
  Get-ChildItem -LiteralPath $source -Force | Copy-Item -Destination $stage -Recurse
  Assert-Manifest -ManifestPath $manifest -EfiRoot $stage
  Assert-EfiFolder -Path $stage -ForCandidate
  [ordered]@{Version=2;DriveLetter=$DriveLetter;StagePath=$stage;ZipSha256=$ExpectedZipSha256;PreparedAt=(Get-Date).ToString("o");WorkPath=$work;ManifestPath=$manifest} | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath $StatePath -Encoding UTF8
  Write-Host "PREPARE_SUCCESS" -ForegroundColor Green
  Write-Host "Staging path: $stage"
  Write-Host "Active EFI has NOT been changed."
  Write-Host "After checking this result, run the same script with -Step Apply."
 }catch{if(Test-Path -LiteralPath $stage){Write-Warning "Incomplete stage retained: $stage"};throw}
}
elseif($Step -eq "Apply"){
 if(-not(Test-Path -LiteralPath $StatePath -PathType Leaf)){throw "No prepared state. Run Prepare first."}
 $state=Get-Content -LiteralPath $StatePath -Raw | ConvertFrom-Json
 if($state.Version -ne 2 -or $state.DriveLetter -ne $DriveLetter -or $state.ZipSha256 -ne $ExpectedZipSha256){throw "Prepared state/package mismatch. Run Prepare again."}
 $stage=[string]$state.StagePath; Assert-StagePath -Path $stage
 if(-not(Test-Path -LiteralPath $stage -PathType Container)){throw "Staging directory missing."}
 $manifest=[string]$state.ManifestPath
 if(-not $manifest.StartsWith([string]$state.WorkPath,[StringComparison]::OrdinalIgnoreCase)){throw "Manifest path is outside prepared work directory."}
 Assert-Manifest -ManifestPath $manifest -EfiRoot $stage
 Assert-EfiFolder -Path $stage -ForCandidate
 if(-not(Test-Path -LiteralPath $ActiveEfi -PathType Container)){throw "Active EFI directory missing."}
 $backup=Join-Path $Root ("EFI-PREVIOUS-BASELINE02-"+[guid]::NewGuid().ToString("N"))
 $failed=Join-Path $Root ("EFI-FAILED-BASELINE02-"+[guid]::NewGuid().ToString("N"))
 Write-Host "Only $ActiveEfi will be replaced. Backup: $backup"
 Write-Host "Recovery and Recovery staging directories, E:, and internal disks are not targets."
 $confirm=Read-Host "Type APPLY-BASELINE-02 to continue"
 if($confirm -cne "APPLY-BASELINE-02"){throw "Cancelled. No EFI changes made."}
 $oldMoved=$false; $newMoved=$false
 try{
  Rename-Item -LiteralPath $ActiveEfi -NewName (Split-Path $backup -Leaf); $oldMoved=$true
  Rename-Item -LiteralPath $stage -NewName "EFI"; $newMoved=$true
  Assert-EfiFolder -Path $ActiveEfi -ForCandidate
  Assert-Manifest -ManifestPath $manifest -EfiRoot $ActiveEfi
  Assert-RecoveryReadOnly
  Write-Host "BASELINE02_DEPLOYMENT_SUCCESS" -ForegroundColor Green
  Write-Host "Previous EFI backup retained: $backup"
  Remove-Item -LiteralPath $StatePath -Force
 }catch{
  $failure=$_
  if($newMoved -and (Test-Path -LiteralPath $ActiveEfi)){Rename-Item -LiteralPath $ActiveEfi -NewName (Split-Path $failed -Leaf);Write-Warning "Failed candidate retained: $failed"}
  if($oldMoved -and (Test-Path -LiteralPath $backup)){Rename-Item -LiteralPath $backup -NewName "EFI";Write-Warning "Previous EFI restored."}
  throw $failure
 }
}

#requires -Version 5.1
[CmdletBinding()]
param()
$ErrorActionPreference='Stop'
$serial='000000123ADC'; $model='Samsung SSD 860 EVO'
$min=[int64](225GB); $max=[int64](240GB)
$confirm='ERASE SAMSUNG USB 000000123ADC AND CREATE EMPTY GPT'
function Stop-Safely([string]$m){throw "SAFETY_STOP: $m"}
try {
 Write-Host 'B460M USB RESET - EMPTY GPT ONLY' -ForegroundColor Cyan
 Write-Host 'ALL partitions/data on the matched Samsung USB will be destroyed.' -ForegroundColor Yellow
 if($MyInvocation.MyCommand.Path){Write-Host "SCRIPT_SHA256=$((Get-FileHash $MyInvocation.MyCommand.Path -Algorithm SHA256).Hash)"}
 $d=@(Get-Disk -ErrorAction Stop|Where-Object{$_.BusType -eq 'USB' -and $_.FriendlyName -like "$model*" -and ([string]$_.SerialNumber).Trim() -eq $serial -and [int64]$_.Size -ge $min -and [int64]$_.Size -le $max})
 if($d.Count -ne 1){Stop-Safely "Expected one matching USB; found $($d.Count). No changes made."}
 $t=$d[0]; $n=[int]$t.Number
 if($t.IsBoot -or $t.IsSystem -or $t.IsOffline -or $t.IsReadOnly){Stop-Safely 'Disk is boot/system, offline or read-only. No changes made.'}
 $c=@(Get-CimInstance Win32_DiskDrive -ErrorAction Stop|Where-Object{([string]$_.Model).Trim() -like "$model*" -and ([string]$_.SerialNumber).Trim() -eq $serial -and [int64]$_.Size -eq [int64]$t.Size})
 if($c.Count -ne 1){Stop-Safely 'Win32_DiskDrive cross-check failed. No changes made.'}
 $p=@(Get-CimInstance -Namespace 'root/Microsoft/Windows/Storage' -ClassName MSFT_Partition -ErrorAction Stop|Where-Object{[int]$_.DiskNumber -eq $n})
 $f=@(Get-Partition -DriveLetter F -ErrorAction SilentlyContinue|Where-Object{[int]$_.DiskNumber -eq $n})
 if($f.Count){Stop-Safely 'F: belongs to target; protected. No changes made.'}
 $otherE=@(Get-Partition -DriveLetter E -ErrorAction SilentlyContinue|Where-Object{[int]$_.DiskNumber -ne $n})
 if($otherE.Count){Write-Warning 'E: on other disks will not be modified.'}
 Write-Host "`nTARGET DEVICE:" -ForegroundColor Green
 [pscustomobject]@{DiskNumber=$n;Model=$t.FriendlyName;Serial=$serial;BusType=$t.BusType;Bytes=$t.Size;GiB=[math]::Round($t.Size/1GB,2);PartitionStyle=$t.PartitionStyle;PartitionCount=$p.Count;IsBoot=$t.IsBoot;IsSystem=$t.IsSystem}|Format-List|Out-Host
 Write-Host 'Protected: all other disks, Windows boot/system disk and F:.' -ForegroundColor Yellow
 Write-Host 'Erased: every partition and all data on this exact USB, including E: if present.' -ForegroundColor Yellow
 if((Read-Host "Type exactly: $confirm") -cne $confirm){Stop-Safely 'Confirmation mismatch. No changes made.'}
 $again=@(Get-Disk -ErrorAction Stop|Where-Object{$_.Number -eq $n -and $_.BusType -eq 'USB' -and $_.FriendlyName -like "$model*" -and ([string]$_.SerialNumber).Trim() -eq $serial -and [int64]$_.Size -eq [int64]$t.Size -and -not $_.IsBoot -and -not $_.IsSystem})
 $againC=@(Get-CimInstance Win32_DiskDrive -ErrorAction Stop|Where-Object{([string]$_.SerialNumber).Trim() -eq $serial -and ([string]$_.Model).Trim() -like "$model*" -and [int64]$_.Size -eq [int64]$t.Size})
 if($again.Count -ne 1 -or $againC.Count -ne 1){Stop-Safely 'Identity changed before write. No changes made.'}
 $dp=Join-Path $env:TEMP ('B460M-reset-'+[guid]::NewGuid().ToString('N')+'.txt')
 @("select disk $n",'clean','exit')|Set-Content -LiteralPath $dp -Encoding ASCII
 try{$o=& diskpart.exe /s $dp 2>&1;$ec=$LASTEXITCODE;$o|ForEach-Object{Write-Host $_};if($ec -ne 0){Stop-Safely "DiskPart exit $ec. Inspect disk before retry."}}finally{Remove-Item $dp -Force -ErrorAction SilentlyContinue}
 Update-HostStorageCache -ErrorAction SilentlyContinue
 Initialize-Disk -Number $n -PartitionStyle GPT -Confirm:$false -ErrorAction Stop | Out-Null
 Update-HostStorageCache -ErrorAction SilentlyContinue; Start-Sleep 2
 $after=Get-Disk -Number $n -ErrorAction Stop
 $ap=@(Get-CimInstance -Namespace 'root/Microsoft/Windows/Storage' -ClassName MSFT_Partition -ErrorAction Stop|Where-Object{[int]$_.DiskNumber -eq $n})
 if($after.PartitionStyle -ne 'GPT' -or $ap.Count -ne 0){Stop-Safely "Verification failed: $($after.PartitionStyle), partitions=$($ap.Count). Do not run builder."}
 Write-Host 'RESET_VERIFIED=PASS'; Write-Host 'TARGET_STATE=GPT with zero partitions'
} catch {Write-Error $_.Exception.Message;exit 1}

#requires -Version 5.1
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$ExpectedSerial = '000000123ADC'
$ExpectedModel = 'Samsung SSD 860 EVO'
Write-Host '=== B460M USB READ-ONLY LAYOUT DIAGNOSTIC ===' -ForegroundColor Cyan
Write-Host 'READ ONLY: no disk changes will be made.' -ForegroundColor Green
$disks = @(Get-Disk -ErrorAction Stop)
$matches = @($disks | Where-Object { (([string]$_.SerialNumber).Trim() -replace '\s','') -eq $ExpectedSerial -and ([string]$_.FriendlyName).Trim().StartsWith($ExpectedModel,[StringComparison]::OrdinalIgnoreCase) -and $_.BusType -eq 'USB' })
if ($matches.Count -ne 1) { Write-Host ('SAFETY_STOP: expected exactly one matching USB disk; found {0}.' -f $matches.Count) -ForegroundColor Red; $disks | Format-Table Number,FriendlyName,SerialNumber,BusType,Size,PartitionStyle,IsBoot,IsSystem -AutoSize; exit 2 }
$d = $matches[0]
$cim = @(Get-CimInstance Win32_DiskDrive -ErrorAction Stop | Where-Object { [int]$_.Index -eq [int]$d.Number })
Write-Host "`nVERIFIED DISK"
$d | Format-List Number,FriendlyName,SerialNumber,BusType,Size,PartitionStyle,OperationalStatus,HealthStatus,IsBoot,IsSystem,IsReadOnly,IsOffline
Write-Host 'PHYSICAL DEVICE ASSOCIATION'
$cim | Format-List Index,DeviceID,Model,SerialNumber,InterfaceType,Size,PNPDeviceID
Write-Host "`nGET-PARTITION RESULTS"
try { $parts = @(Get-Partition -DiskNumber $d.Number -ErrorAction Stop); Write-Host ('GET_PARTITION_COUNT={0}' -f $parts.Count); $parts | Format-List DiskNumber,PartitionNumber,DriveLetter,Type,GptType,Size,Offset,IsActive,IsBoot,IsSystem,AccessPaths } catch { Write-Host ('GET_PARTITION_ERROR={0}' -f $_.Exception.Message) -ForegroundColor Yellow; $parts = @() }
Write-Host "`nMSFT_PARTITION RESULTS"
try { $msft = @(Get-CimInstance -Namespace 'root/Microsoft/Windows/Storage' -ClassName MSFT_Partition -ErrorAction Stop | Where-Object { $null -ne $_.DiskNumber -and [uint32]$_.DiskNumber -eq [uint32]$d.Number }); Write-Host ('MSFT_PARTITION_COUNT={0}' -f $msft.Count); $msft | Format-List DiskNumber,PartitionNumber,DriveLetter,Type,GptType,Size,Offset,IsActive,IsBoot,IsSystem,AccessPaths } catch { Write-Host ('MSFT_PARTITION_ERROR={0}' -f $_.Exception.Message) -ForegroundColor Yellow }
Write-Host "`nVOLUME RESULTS (Win32_LogicalDisk)"
$letters = @($parts | Where-Object { $_.DriveLetter } | ForEach-Object { ([string]$_.DriveLetter).TrimEnd(':').ToUpperInvariant() })
if ($letters.Count -gt 0) { Get-CimInstance Win32_LogicalDisk -ErrorAction Stop | Where-Object { $letters -contains ([string]$_.DeviceID).TrimEnd(':').ToUpperInvariant() } | Format-List DeviceID,VolumeName,FileSystem,Size,FreeSpace,DriveType } else { Write-Host 'NO_DRIVE_LETTER_REPORTED_BY_GET_PARTITION' }
Write-Host "`nVOLUME RESULTS (Win32_Volume)"
Get-CimInstance Win32_Volume -ErrorAction Stop | Where-Object { $device = ([string]$_.DeviceID); ($letters | Where-Object { $device -like ('*{0}*' -f $_) }).Count -gt 0 } | Format-List DriveLetter,Label,FileSystem,Capacity,FreeSpace,DeviceID
Write-Host "`nDISKPART READ-ONLY DETAIL"
$dp = Join-Path $env:TEMP ('B460M-readonly-detail-' + [guid]::NewGuid().ToString('N') + '.txt')
@("select disk $($d.Number)",'detail disk','list partition','exit') | Set-Content -LiteralPath $dp -Encoding ASCII
& diskpart.exe /s $dp 2>&1 | ForEach-Object { Write-Host ([string]$_) }
Remove-Item -LiteralPath $dp -Force -ErrorAction SilentlyContinue
Write-Host "`nDIAGNOSTIC_COMPLETE=READ_ONLY" -ForegroundColor Green

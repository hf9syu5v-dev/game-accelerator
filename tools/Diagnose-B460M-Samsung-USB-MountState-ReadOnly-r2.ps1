#requires -Version 5.1
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$ExpectedSerial = '000000123ADC'
$ExpectedModel = 'Samsung SSD 860 EVO'
Write-Host '=== B460M USB ESP MOUNT-STATE DIAGNOSTIC r2 ===' -ForegroundColor Cyan
Write-Host 'READ ONLY: no disk, partition, volume, or filesystem changes will be made.' -ForegroundColor Green
$disks = @(Get-Disk -ErrorAction Stop | Where-Object {
    (([string]$_.SerialNumber).Trim() -replace '\s','') -eq $ExpectedSerial -and
    ([string]$_.FriendlyName).Trim().StartsWith($ExpectedModel,[StringComparison]::OrdinalIgnoreCase) -and
    $_.BusType -eq 'USB'
})
if ($disks.Count -ne 1) { throw "SAFETY_STOP: expected exactly one matching Samsung USB; found $($disks.Count)." }
$d = $disks[0]
$cim = @(Get-CimInstance Win32_DiskDrive -ErrorAction Stop | Where-Object { [int]$_.Index -eq [int]$d.Number })
if ($cim.Count -ne 1 -or $cim[0].DeviceID -ne ('\\.\PHYSICALDRIVE' + $d.Number) -or
    ([string]$cim[0].SerialNumber).Trim() -ne $ExpectedSerial -or
    ([string]$cim[0].Model).Trim() -notlike "$ExpectedModel USB Device*" -or
    $cim[0].InterfaceType -ne 'USB') {
    throw 'SAFETY_STOP: physical-device association did not match the expected USB.'
}
Write-Host ([Environment]::NewLine + 'VERIFIED DISK')
$d | Format-List Number,FriendlyName,SerialNumber,BusType,Size,PartitionStyle,IsBoot,IsSystem
$cim | Format-List Index,DeviceID,Model,SerialNumber,InterfaceType,Size,PNPDeviceID
$parts = @(Get-Partition -DiskNumber $d.Number -ErrorAction Stop)
Write-Host ([Environment]::NewLine + 'PARTITION / GPT ATTRIBUTES')
$parts | Format-List DiskNumber,PartitionNumber,DriveLetter,Type,GptType,Size,Offset,AccessPaths,Guid,IsHidden,IsReadOnly,NoDefaultDriveLetter,IsOffline
foreach ($p in $parts) {
    try {
        Write-Host ([Environment]::NewLine + ('GET-VOLUME VIA PARTITION {0}' -f $p.PartitionNumber))
        $p | Get-Volume -ErrorAction Stop | Format-List DriveLetter,FileSystem,FileSystemLabel,Path,UniqueId,Size,SizeRemaining,HealthStatus,OperationalStatus
    } catch { Write-Host ("GET_VOLUME_VIA_PARTITION_ERROR={0}" -f $_.Exception.Message) -ForegroundColor Yellow }
}
Write-Host ([Environment]::NewLine + 'ALL GET-VOLUME RECORDS')
Get-Volume -ErrorAction Stop | Format-List DriveLetter,FileSystem,FileSystemLabel,Path,UniqueId,Size,SizeRemaining,HealthStatus,OperationalStatus
Write-Host ([Environment]::NewLine + 'WIN32 VOLUME MATCHES')
Get-CimInstance Win32_Volume -ErrorAction Stop | Where-Object {
    $_.Capacity -ge 15GB -and $_.Capacity -le 17GB
} | Format-List DriveLetter,Label,FileSystem,Capacity,FreeSpace,DeviceID,Name
Write-Host ([Environment]::NewLine + 'DISKPART DETAIL PARTITION / VOLUME ATTRIBUTES (READ ONLY)')
$dp = Join-Path $env:TEMP ('B460M-esp-mount-readonly-' + [guid]::NewGuid().ToString('N') + '.txt')
@(
    "select disk $($d.Number)",
    'select partition 1',
    'detail partition',
    'attributes partition',
    'list volume',
    'select volume G',
    'detail volume',
    'attributes volume',
    'exit'
) | Set-Content -LiteralPath $dp -Encoding ASCII
try { & diskpart.exe /s $dp 2>&1 | ForEach-Object { Write-Host ([string]$_) } }
finally { Remove-Item -LiteralPath $dp -Force -ErrorAction SilentlyContinue }
Write-Host ([Environment]::NewLine + 'MOUNTVOL G: /L (READ ONLY)')
& mountvol.exe G: /L 2>&1 | ForEach-Object { Write-Host ([string]$_) }
Write-Host ([Environment]::NewLine + 'DIAGNOSTIC_COMPLETE=READ_ONLY') -ForegroundColor Green

#requires -Version 5.1
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$expectedSerial = '000000123ADC'
$expectedModel = 'Samsung SSD 860 EVO'
Write-Host 'B460M USB / Win32_DiskDrive CROSS-CHECK DIAGNOSTIC' -ForegroundColor Cyan
Write-Host 'READ-ONLY: this script does not clean, format, partition, initialize, or write to any disk.' -ForegroundColor Yellow
Write-Host "EXPECTED_MODEL=$expectedModel"
Write-Host "EXPECTED_SERIAL=$expectedSerial"
Write-Host "EXPECTED_SIZE_RANGE_BYTES=$([int64](225GB))..$([int64](240GB))"
Write-Host "`n[1] Get-Disk candidates (USB Samsung or matching serial)" -ForegroundColor Green
$disks = @(Get-Disk -ErrorAction Stop | Where-Object {
    $_.BusType -eq 'USB' -or ([string]$_.SerialNumber).Trim() -eq $expectedSerial -or ([string]$_.FriendlyName).IndexOf('Samsung',[StringComparison]::OrdinalIgnoreCase) -ge 0
})
if ($disks.Count -eq 0) { Write-Host 'NO_GET_DISK_CANDIDATES' }
foreach ($d in $disks) {
    [pscustomobject]@{DiskNumber=$d.Number;FriendlyName=$d.FriendlyName;SerialRaw=[string]$d.SerialNumber;SerialTrimmed=([string]$d.SerialNumber).Trim();SerialLength=([string]$d.SerialNumber).Length;BusType=[string]$d.BusType;SizeBytes=[int64]$d.Size;PartitionStyle=[string]$d.PartitionStyle;IsBoot=[bool]$d.IsBoot;IsSystem=[bool]$d.IsSystem;IsOffline=[bool]$d.IsOffline;IsReadOnly=[bool]$d.IsReadOnly}|Format-List|Out-Host
}
Write-Host "`n[2] Win32_DiskDrive candidates (all USB + Samsung/model/serial matches)" -ForegroundColor Green
$cims = @(Get-CimInstance -ClassName Win32_DiskDrive -ErrorAction Stop | Where-Object {
    ([string]$_.InterfaceType -eq 'USB') -or ([string]$_.Model).IndexOf('Samsung',[StringComparison]::OrdinalIgnoreCase) -ge 0 -or ([string]$_.Model).IndexOf('860 EVO',[StringComparison]::OrdinalIgnoreCase) -ge 0 -or ([string]$_.SerialNumber).IndexOf($expectedSerial,[StringComparison]::OrdinalIgnoreCase) -ge 0
})
if ($cims.Count -eq 0) { Write-Host 'NO_CIM_CANDIDATES' }
foreach ($c in $cims) {
    [pscustomobject]@{ModelRaw=[string]$c.Model;ModelTrimmed=([string]$c.Model).Trim();ModelLength=([string]$c.Model).Length;SerialRaw=[string]$c.SerialNumber;SerialTrimmed=([string]$c.SerialNumber).Trim();SerialLength=([string]$c.SerialNumber).Length;SizeBytes=[int64]$c.Size;InterfaceType=[string]$c.InterfaceType;PNPDeviceID=[string]$c.PNPDeviceID;DeviceID=[string]$c.DeviceID;SCSIPort=$c.SCSIPort;SCSIBus=$c.SCSIBus;SCSITargetId=$c.SCSITargetId;SCSILogicalUnit=$c.SCSILogicalUnit}|Format-List|Out-Host
}
Write-Host "`n[3] Exact predicate evaluation against expected USB" -ForegroundColor Green
foreach ($d in $disks) {
    $isCandidate = $d.BusType -eq 'USB' -and ([string]$d.FriendlyName) -like "$expectedModel*" -and ([string]$d.SerialNumber).Trim() -eq $expectedSerial -and [int64]$d.Size -ge [int64](225GB) -and [int64]$d.Size -le [int64](240GB)
    if (-not $isCandidate) { continue }
    foreach ($c in $cims) {
        $modelOK = ([string]$c.Model).Trim() -like "$expectedModel*"
        $serialOK = ([string]$c.SerialNumber).Trim() -eq $expectedSerial
        $sizeOK = [int64]$c.Size -eq [int64]$d.Size
        [pscustomobject]@{GetDiskNumber=$d.Number;GetDiskFriendlyName=$d.FriendlyName;GetDiskSerial=([string]$d.SerialNumber).Trim();GetDiskSizeBytes=[int64]$d.Size;CimModelMatch=$modelOK;CimSerialMatch=$serialOK;CimSizeMatch=$sizeOK;CimAllMatch=($modelOK -and $serialOK -and $sizeOK);CimModel=[string]$c.Model;CimSerial=[string]$c.SerialNumber;CimSizeBytes=[int64]$c.Size;CimPNPDeviceID=[string]$c.PNPDeviceID}|Format-List|Out-Host
    }
}
Write-Host "`nDIAGNOSTIC_COMPLETE=READ_ONLY" -ForegroundColor Green

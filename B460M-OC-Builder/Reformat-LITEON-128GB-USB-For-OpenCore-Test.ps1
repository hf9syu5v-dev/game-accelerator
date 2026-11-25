#requires -RunAsAdministrator
[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

Write-Host '=== Rebuild 128GB LITEON USB Disk (Destructive) ===' -ForegroundColor Cyan
Write-Host 'This will erase ALL partitions and data on the target USB disk.' -ForegroundColor Yellow
Write-Host 'It will NOT touch internal NVMe disks.' -ForegroundColor Yellow

# Match the previously verified physical USB disk by model, bus and capacity.
$matches = @(Get-Disk | Where-Object {
    ($_.FriendlyName -replace '\\s+', ' ').Trim() -eq 'LITEON I T LCS-128L9S' -and
    $_.BusType -eq 'USB' -and
    $_.Size -ge 115GB -and $_.Size -le 125GB
})

if ($matches.Count -ne 1) {
    throw "Safety stop: expected exactly one USB disk named 'LITEON I T LCS-128L9S' with 115-125 GB capacity; found $($matches.Count). No changes made."
}

$disk = $matches[0]
$disk | Format-List Number,FriendlyName,SerialNumber,BusType,Size,PartitionStyle,IsBoot,IsSystem,OperationalStatus

if ($disk.IsBoot -or $disk.IsSystem) {
    throw 'Safety stop: target is marked as a boot or system disk. No changes made.'
}

$parts = @(Get-Partition -DiskNumber $disk.Number -ErrorAction SilentlyContinue)
if ($parts | Where-Object { $_.IsBoot -or $_.IsSystem }) {
    throw 'Safety stop: target contains a boot or system partition. No changes made.'
}

Write-Host ''
Write-Host ("TARGET: Disk {0} | {1} | USB | {2:N2} GB" -f $disk.Number,$disk.FriendlyName,($disk.Size/1GB)) -ForegroundColor Yellow
Write-Host 'ALL DATA ON THIS USB DISK WILL BE PERMANENTLY ERASED.' -ForegroundColor Red
$answer = Read-Host 'Type exactly: ERASE LITEON 128GB'
if ($answer -cne 'ERASE LITEON 128GB') {
    Write-Host 'Cancelled. No changes made.' -ForegroundColor Yellow
    exit 2
}

Write-Host 'Clearing Ventoy partition layout...'
Clear-Disk -Number $disk.Number -RemoveData -RemoveOEM -Confirm:$false

Write-Host 'Creating a fresh GPT data disk...'
Initialize-Disk -Number $disk.Number -PartitionStyle GPT
$newPartition = New-Partition -DiskNumber $disk.Number -UseMaximumSize -AssignDriveLetter
Format-Volume -Partition $newPartition -FileSystem exFAT -NewFileSystemLabel 'OC-TEST' -Confirm:$false | Out-Null

$verifyDisk = Get-Disk -Number $disk.Number
$verifyPart = Get-Partition -DiskNumber $disk.Number
$verifyVol = $verifyPart | Get-Volume

if ($verifyDisk.PartitionStyle -ne 'GPT' -or $verifyVol.FileSystem -ne 'exFAT' -or $verifyVol.FileSystemLabel -ne 'OC-TEST') {
    throw 'Verification failed after formatting. Stop and report the displayed disk state.'
}

Write-Host ''
Write-Host 'USB_REFORMAT_SUCCESS' -ForegroundColor Green
Write-Host ("DISK_NUMBER={0}" -f $disk.Number)
Write-Host ("DRIVE_LETTER={0}" -f $verifyVol.DriveLetter)
Write-Host ("FILESYSTEM={0}" -f $verifyVol.FileSystem)
Write-Host ("LABEL={0}" -f $verifyVol.FileSystemLabel)
Write-Host 'PARTITION_STYLE=GPT'
Write-Host 'Ventoy partition layout has been removed. Internal disks were not targeted.'

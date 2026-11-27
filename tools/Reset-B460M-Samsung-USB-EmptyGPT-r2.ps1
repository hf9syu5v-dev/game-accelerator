#requires -Version 5.1
[CmdletBinding()]
param([switch]$SelfTest)
$ErrorActionPreference = 'Stop'
$ExpectedSerial = '000000123ADC'
$ExpectedModel = 'Samsung SSD 860 EVO'
$MinSize = [int64](225GB)
$MaxSize = [int64](240GB)
$SizeTolerance = [int64](16MB)
$Confirmation = 'ERASE SAMSUNG USB 000000123ADC AND CREATE EMPTY GPT'

function Test-CimDiskIdentity {
    param([Parameter(Mandatory=$true)]$Disk,[Parameter(Mandatory=$true)]$CimDisk)
    $diskNumber = [int]$Disk.Number
    $cimIndex = -1
    if ($null -ne $CimDisk.Index) { $cimIndex = [int]$CimDisk.Index }
    $cimSize = [int64]$CimDisk.Size
    $diskSize = [int64]$Disk.Size
    $delta = [math]::Abs($cimSize - $diskSize)
    $modelOK = ([string]$CimDisk.Model).Trim() -like "$ExpectedModel*"
    $serialOK = ([string]$CimDisk.SerialNumber).Trim() -eq $ExpectedSerial
    $indexOK = $cimIndex -eq $diskNumber
    $deviceIdOK = ([string]$CimDisk.DeviceID) -eq "\\.\PHYSICALDRIVE$diskNumber"
    $interfaceOK = ([string]$CimDisk.InterfaceType) -eq 'USB'
    $pnpOK = ([string]$CimDisk.PNPDeviceID).StartsWith('USBSTOR\',[StringComparison]::OrdinalIgnoreCase)
    $sizeRangeOK = $cimSize -ge $MinSize -and $cimSize -le $MaxSize
    $sizeDeltaOK = $delta -le $SizeTolerance
    [pscustomobject]@{
        Match = ($modelOK -and $serialOK -and $indexOK -and $deviceIdOK -and $interfaceOK -and $pnpOK -and $sizeRangeOK -and $sizeDeltaOK)
        ModelMatch=$modelOK; SerialMatch=$serialOK; IndexMatch=$indexOK; DeviceIdMatch=$deviceIdOK
        InterfaceMatch=$interfaceOK; PnpUsbStorMatch=$pnpOK
        CimSizeInRange=$sizeRangeOK; SizeDeltaBytes=$delta; SizeDeltaWithin16MiB=$sizeDeltaOK
    }
}
if ($SelfTest) {
    $disk = [pscustomobject]@{ Number=1; Size=[int64]250059350016 }
    $good = [pscustomobject]@{ Index=1; DeviceID='\\.\PHYSICALDRIVE1'; Model='Samsung SSD 860 EVO USB Device'; SerialNumber='000000123ADC'; Size=[int64]250056737280; InterfaceType='USB'; PNPDeviceID='USBSTOR\DISK&VEN_SAMSUNG&PROD_SSD_860_EVO\000000123ADC&0' }
    $r = Test-CimDiskIdentity -Disk $disk -CimDisk $good
    if (-not $r.Match -or -not $r.SizeDeltaWithin16MiB -or -not $r.IndexMatch) { throw 'SELFTEST_VALID_USB_MATCH_FAILED' }
    $badIndex = $good | Select-Object *; $badIndex.Index = 0
    if ((Test-CimDiskIdentity -Disk $disk -CimDisk $badIndex).Match) { throw 'SELFTEST_WRONG_PHYSICALDRIVE_INDEX_ACCEPTED' }
    $badDeviceId = $good | Select-Object *; $badDeviceId.DeviceID = '\\\\.\\PHYSICALDRIVE0'
    if ((Test-CimDiskIdentity -Disk $disk -CimDisk $badDeviceId).Match) { throw 'SELFTEST_WRONG_DEVICE_ID_ACCEPTED' }
    $badSerial = $good | Select-Object *; $badSerial.SerialNumber = 'WRONG'
    if ((Test-CimDiskIdentity -Disk $disk -CimDisk $badSerial).Match) { throw 'SELFTEST_WRONG_SERIAL_ACCEPTED' }
    $badBus = $good | Select-Object *; $badBus.InterfaceType = 'IDE'
    if ((Test-CimDiskIdentity -Disk $disk -CimDisk $badBus).Match) { throw 'SELFTEST_NON_USB_ACCEPTED' }
    $badSize = $good | Select-Object *; $badSize.Size = [int64]($good.Size + 32MB)
    if ((Test-CimDiskIdentity -Disk $disk -CimDisk $badSize).Match) { throw 'SELFTEST_EXCESSIVE_SIZE_DELTA_ACCEPTED' }
    Write-Host 'SELFTEST_VALID_USB_MATCH_WITH_2_5MIB_PROVIDER_DELTA=PASS'
    Write-Host 'SELFTEST_WRONG_DISK_INDEX_REJECTED=PASS'
    Write-Host 'SELFTEST_WRONG_DEVICE_ID_REJECTED=PASS'
    Write-Host 'SELFTEST_WRONG_SERIAL_REJECTED=PASS'
    Write-Host 'SELFTEST_NON_USB_REJECTED=PASS'
    Write-Host 'SELFTEST_EXCESSIVE_SIZE_DELTA_REJECTED=PASS'
    exit 0
}
function Stop-Safely([string]$Message) { throw "SAFETY_STOP: $Message" }
try {
    Write-Host 'B460M SAMSUNG USB RESET - EMPTY GPT (REVISION 2)' -ForegroundColor Cyan
    Write-Host 'Destructive: all partitions and data on the precisely matched USB will be erased.' -ForegroundColor Yellow
    if ($MyInvocation.MyCommand.Path) { Write-Host "SCRIPT_SHA256=$((Get-FileHash -LiteralPath $MyInvocation.MyCommand.Path -Algorithm SHA256).Hash)" }
    $disks = @(Get-Disk -ErrorAction Stop | Where-Object {
        $_.BusType -eq 'USB' -and ([string]$_.FriendlyName).StartsWith($ExpectedModel,[StringComparison]::OrdinalIgnoreCase) -and
        ([string]$_.SerialNumber).Trim() -eq $ExpectedSerial -and [int64]$_.Size -ge $MinSize -and [int64]$_.Size -le $MaxSize
    })
    if ($disks.Count -ne 1) { Stop-Safely "Expected exactly one Samsung USB by model/serial/bus/size; found $($disks.Count)." }
    $target = $disks[0]
    $number = [int]$target.Number
    if ($target.IsBoot -or $target.IsSystem -or $target.IsOffline -or $target.IsReadOnly) { Stop-Safely 'Target is boot/system, offline, or read-only.' }
    $allCim = @(Get-CimInstance -ClassName Win32_DiskDrive -ErrorAction Stop)
    $matchedCim = @($allCim | Where-Object { (Test-CimDiskIdentity -Disk $target -CimDisk $_).Match })
    if ($matchedCim.Count -ne 1) {
        $allCim | ForEach-Object {
            $m = Test-CimDiskIdentity -Disk $target -CimDisk $_
            [pscustomobject]@{Index=$_.Index;DeviceID=$_.DeviceID;Model=$_.Model;SerialNumber=$_.SerialNumber;InterfaceType=$_.InterfaceType;SizeBytes=$_.Size;SizeDeltaBytes=$m.SizeDeltaBytes;IndexMatch=$m.IndexMatch;DeviceIdMatch=$m.DeviceIdMatch;SerialMatch=$m.SerialMatch;SizeDeltaWithin16MiB=$m.SizeDeltaWithin16MiB;PNPDeviceID=$_.PNPDeviceID} | Format-List | Out-Host
        }
        Stop-Safely "Win32_DiskDrive identity must match exactly one PHYSICALDRIVE index with USBSTOR, USB interface, exact serial/model, and <=16MiB size delta; found $($matchedCim.Count)."
    }
    $cim = $matchedCim[0]
    $parts = @(Get-CimInstance -Namespace 'root/Microsoft/Windows/Storage' -ClassName MSFT_Partition -ErrorAction Stop | Where-Object { [int]$_.DiskNumber -eq $number })
    $fParts = @(Get-Partition -DriveLetter F -ErrorAction SilentlyContinue | Where-Object { [int]$_.DiskNumber -eq $number })
    if ($fParts.Count -gt 0) { Stop-Safely 'F: belongs to target; F: is protected.' }
    $eParts = @(Get-Partition -DriveLetter E -ErrorAction SilentlyContinue | Where-Object { [int]$_.DiskNumber -eq $number })
    $otherE = @(Get-Partition -DriveLetter E -ErrorAction SilentlyContinue | Where-Object { [int]$_.DiskNumber -ne $number })
    Write-Host "`nVERIFIED TARGET DEVICE" -ForegroundColor Green
    [pscustomobject]@{
        DiskNumber=$number; PhysicalDriveIndex=$cim.Index; DeviceID=$cim.DeviceID
        FriendlyName=$target.FriendlyName; CimModel=$cim.Model; Serial=$ExpectedSerial
        BusType=$target.BusType; CimInterfaceType=$cim.InterfaceType
        GetDiskSizeBytes=[int64]$target.Size; CimSizeBytes=[int64]$cim.Size
        SizeDeltaBytes=[math]::Abs([int64]$target.Size-[int64]$cim.Size)
        PNPDeviceID=$cim.PNPDeviceID; PartitionStyle=$target.PartitionStyle; PartitionCount=$parts.Count
        IsBoot=$target.IsBoot; IsSystem=$target.IsSystem; EOnTarget=($eParts.Count -eq 1); EOnOtherDisk=($otherE.Count -gt 0)
    } | Format-List | Out-Host
    Write-Host 'Protected: auxiliary Windows system disk, all other disks, and F:.' -ForegroundColor Yellow
    Write-Host 'Erased: every partition and all data on the exact Samsung USB, including E: if E: is on this target.' -ForegroundColor Yellow
    if ((Read-Host "Type exactly: $Confirmation") -cne $Confirmation) { Stop-Safely 'Confirmation text did not match.' }
    $againDisk = @(Get-Disk -ErrorAction Stop | Where-Object {
        $_.Number -eq $number -and $_.BusType -eq 'USB' -and ([string]$_.FriendlyName).StartsWith($ExpectedModel,[StringComparison]::OrdinalIgnoreCase) -and
        ([string]$_.SerialNumber).Trim() -eq $ExpectedSerial -and [int64]$_.Size -ge $MinSize -and [int64]$_.Size -le $MaxSize -and
        -not $_.IsBoot -and -not $_.IsSystem -and -not $_.IsOffline -and -not $_.IsReadOnly
    })
    $againCim = @(Get-CimInstance -ClassName Win32_DiskDrive -ErrorAction Stop | Where-Object { (Test-CimDiskIdentity -Disk $target -CimDisk $_).Match })
    if ($againDisk.Count -ne 1 -or $againCim.Count -ne 1 -or [string]$againCim[0].DeviceID -ne "\\.\PHYSICALDRIVE$number") { Stop-Safely 'Device identity changed before write.' }
    $fRecheck = @(Get-Partition -DriveLetter F -ErrorAction SilentlyContinue | Where-Object { [int]$_.DiskNumber -eq $number })
    if ($fRecheck.Count -gt 0) { Stop-Safely 'F: appeared on target before write.' }
    $diskpartFile = Join-Path $env:TEMP ('B460M-empty-gpt-' + [guid]::NewGuid().ToString('N') + '.txt')
    @("select disk $number",'clean','exit') | Set-Content -LiteralPath $diskpartFile -Encoding ASCII
    try {
        $output = & diskpart.exe /s $diskpartFile 2>&1
        $exitCode = $LASTEXITCODE
        $output | ForEach-Object { Write-Host $_ }
        if ($exitCode -ne 0) { Stop-Safely "DiskPart exited with code $exitCode; inspect the disk before retrying." }
    } finally { Remove-Item -LiteralPath $diskpartFile -Force -ErrorAction SilentlyContinue }
    Update-HostStorageCache -ErrorAction SilentlyContinue
    Initialize-Disk -Number $number -PartitionStyle GPT -Confirm:$false -ErrorAction Stop | Out-Null
    Update-HostStorageCache -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 2
    $afterParts = @(Get-CimInstance -Namespace 'root/Microsoft/Windows/Storage' -ClassName MSFT_Partition -ErrorAction Stop | Where-Object { [int]$_.DiskNumber -eq $number })
    if ($afterParts.Count -ne 1 -or ([string]$afterParts[0].GptType).Trim('{}').ToLowerInvariant() -ne 'e3c9e316-0b5c-4db8-817d-f92df00215ae' -or -not $afterParts[0].IsHidden) {
        Stop-Safely "Expected one Windows-created hidden MSR before removing it; found $($afterParts.Count). Do not run the builder."
    }
    Remove-Partition -InputObject $afterParts[0] -Confirm:$false -ErrorAction Stop
    Update-HostStorageCache -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 2
    $finalDisk = Get-Disk -Number $number -ErrorAction Stop
    $finalParts = @(Get-CimInstance -Namespace 'root/Microsoft/Windows/Storage' -ClassName MSFT_Partition -ErrorAction Stop | Where-Object { [int]$_.DiskNumber -eq $number })
    if ($finalDisk.PartitionStyle -ne 'GPT' -or $finalParts.Count -ne 0) { Stop-Safely "Final verification failed: style=$($finalDisk.PartitionStyle), partitions=$($finalParts.Count). Do not run the builder." }
    Write-Host 'RESET_VERIFIED=PASS' -ForegroundColor Green
    Write-Host 'TARGET_STATE=GPT with zero partitions' -ForegroundColor Green
} catch {
    Write-Error $_.Exception.Message
    exit 1
}

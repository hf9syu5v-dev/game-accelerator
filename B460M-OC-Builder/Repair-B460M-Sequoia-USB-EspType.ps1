#requires -RunAsAdministrator
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
Set-StrictMode -Version 2

$DiskModel = 'LITEON I T LCS-128L9S'
$DiskSerial = '000000123ADC'
$EspGuid = 'c12a7328-f81f-11d2-ba4b-00a0c93ec93b'
$BasicGuid = 'ebd0a0a2-b9e5-4433-87c0-68b6b72699c7'
$MsrGuid = 'e3c9e316-0b5c-4db8-817d-f92df00215ae'
$DriveLetter = 'E'
$Log = Join-Path ([Environment]::GetFolderPath('Desktop')) ('B460M-USB-ESP-Repair-' + (Get-Date -Format 'yyyyMMdd-HHmmss') + '.log')

function Normalize-Guid([object]$Value) {
    return ([string]$Value).Trim().Trim([char[]]@('{','}')).ToLowerInvariant()
}

Start-Transcript -LiteralPath $Log -Force | Out-Null
try {
    Write-Host '=== B460M USB GPT TYPE REPAIR (PARTITION 2) ===' -ForegroundColor Cyan
    Write-Host 'Only GPT type metadata on verified USB partition 2 may be changed.'
    Write-Host 'Partition 1 (16 MB Microsoft Reserved) will NOT be modified.'
    Write-Host 'No formatting, repartitioning, erasing, or file copying/deletion.'
    Write-Host ''

    $disks = @(Get-Disk | Where-Object {
        $_.FriendlyName -eq $DiskModel -and
        ([string]$_.SerialNumber).Trim() -eq $DiskSerial -and
        $_.BusType -eq 'USB' -and
        $_.Size -ge 115GB -and $_.Size -le 125GB
    })
    if ($disks.Count -ne 1) { throw "SAFETY_STOP: expected exactly one matching USB disk; found $($disks.Count)." }
    $disk = $disks[0]
    if ($disk.IsBoot -or $disk.IsSystem -or $disk.IsReadOnly -or $disk.IsOffline) {
        throw 'SAFETY_STOP: target is boot/system, read-only, or offline.'
    }
    if ($disk.PartitionStyle -ne 'GPT') { throw "SAFETY_STOP: expected GPT; found $($disk.PartitionStyle)." }

    $parts = @(Get-Partition -DiskNumber $disk.Number | Sort-Object PartitionNumber)
    if ($parts.Count -ne 2) { throw "SAFETY_STOP: expected exactly two partitions (MSR + data); found $($parts.Count)." }

    $msr = @($parts | Where-Object { $_.PartitionNumber -eq 1 })
    $partMatches = @($parts | Where-Object { $_.PartitionNumber -eq 2 })
    if ($msr.Count -ne 1 -or $partMatches.Count -ne 1) {
        throw 'SAFETY_STOP: expected partition numbers 1 and 2 only.'
    }
    $msr = $msr[0]
    $part = $partMatches[0]

    if ((Normalize-Guid $msr.GptType) -ne $MsrGuid -or $msr.Size -lt 15MB -or $msr.Size -gt 17MB) {
        throw "SAFETY_STOP: partition 1 is not the expected 16 MB Microsoft Reserved partition."
    }
    if ($part.Size -lt 15GB -or $part.Size -gt 17GB) {
        throw "SAFETY_STOP: partition 2 size is unexpected: $($part.Size) bytes."
    }
    if ($part.DriveLetter -ne $DriveLetter) {
        throw "SAFETY_STOP: expected partition 2 drive letter E; actual '$($part.DriveLetter)'."
    }

    $vol = Get-Volume -DriveLetter $DriveLetter -ErrorAction Stop
    if ($vol.FileSystem -ne 'FAT32' -or $vol.FileSystemLabel -ne 'OC-SEQUOIA') {
        throw "SAFETY_STOP: expected E: FAT32 label OC-SEQUOIA; found $($vol.FileSystem) / $($vol.FileSystemLabel)."
    }

    $root = $DriveLetter + ':\'
    $required = @(
        'EFI\BOOT\BOOTx64.efi',
        'EFI\OC\OpenCore.efi',
        'EFI\OC\config.plist',
        'com.apple.recovery.boot\BaseSystem.dmg',
        'com.apple.recovery.boot\BaseSystem.chunklist'
    )
    foreach ($rel in $required) {
        if (-not (Test-Path -LiteralPath (Join-Path $root $rel) -PathType Leaf)) {
            throw "SAFETY_STOP: required USB file missing: $rel"
        }
    }

    $oldType = Normalize-Guid $part.GptType
    Write-Host ("Disk: {0}; model: {1}; serial: {2}" -f $disk.Number,$disk.FriendlyName,$disk.SerialNumber)
    Write-Host ("Partition 1: MSR; {0:N2} MB; {1}" -f ($msr.Size/1MB),$msr.GptType)
    Write-Host ("Partition 2: {0}; {1:N2} GB; {2}" -f $DriveLetter,($part.Size/1GB),$part.GptType)
    Write-Host ("Volume: {0}:; {1}; label {2}" -f $DriveLetter,$vol.FileSystem,$vol.FileSystemLabel)

    if ($oldType -eq $EspGuid) {
        Write-Host 'GPT_TYPE_ALREADY_ESP; no partition metadata change is needed.' -ForegroundColor Green
    } elseif ($oldType -eq $BasicGuid) {
        Write-Host ''
        Write-Host 'ROOT CAUSE CONFIRMED: partition 2 is GPT Basic Data, not an EFI System Partition.'
        Write-Host 'The repair changes only partition 2 GPT type to the standard ESP GUID.'
        $confirm = Read-Host 'Type exactly: CONVERT LITEON USB PARTITION TO ESP'
        if ($confirm -cne 'CONVERT LITEON USB PARTITION TO ESP') {
            Write-Host 'CANCELLED; no changes made.' -ForegroundColor Yellow
            exit 2
        }

        Set-Partition -DiskNumber $disk.Number -PartitionNumber 2 -GptType ('{' + $EspGuid + '}') -Confirm:$false
        Start-Sleep -Seconds 2
        $part = Get-Partition -DiskNumber $disk.Number -PartitionNumber 2
        if ((Normalize-Guid $part.GptType) -ne $EspGuid) {
            throw "GPT_TYPE_UPDATE_FAILED: partition 2 actual type is $($part.GptType)."
        }

        $matchingVolumes = @(Get-Volume | Where-Object {
            $_.FileSystem -eq 'FAT32' -and $_.FileSystemLabel -eq 'OC-SEQUOIA'
        })
        if ($matchingVolumes.Count -ne 1) {
            throw "POSTCHECK_FAILED: expected one OC-SEQUOIA FAT32 volume after GPT update; found $($matchingVolumes.Count)."
        }
        $vol = $matchingVolumes[0]
        if ($vol.DriveLetter) {
            foreach ($rel in $required) {
                if (-not (Test-Path -LiteralPath (Join-Path ($vol.DriveLetter + ':\') $rel) -PathType Leaf)) {
                    throw "POSTCHECK_FAILED: file not accessible after GPT type update: $rel"
                }
            }
        } else {
            Write-Host 'Windows has hidden the ESP drive letter; this is normal for EFI System Partitions.'
            Write-Host 'The USB files were checked before conversion and were not modified.'
        }
        Write-Host 'GPT_PARTITION_TYPE_REPAIRED=PASS' -ForegroundColor Green
    } else {
        throw "SAFETY_STOP: unexpected partition 2 GPT type '$($part.GptType)'; no change made."
    }

    $msrFinal = Get-Partition -DiskNumber $disk.Number -PartitionNumber 1
    $partFinal = Get-Partition -DiskNumber $disk.Number -PartitionNumber 2
    if ((Normalize-Guid $msrFinal.GptType) -ne $MsrGuid) {
        throw 'POSTCHECK_FAILED: MSR partition 1 type unexpectedly changed.'
    }
    if ((Normalize-Guid $partFinal.GptType) -ne $EspGuid) {
        throw "POSTCHECK_FAILED: partition 2 is not ESP: $($partFinal.GptType)"
    }
    Write-Host ("FINAL_PARTITION_1_TYPE=" + $msrFinal.GptType)
    Write-Host ("FINAL_PARTITION_2_TYPE=" + $partFinal.GptType)
    Write-Host 'EXPECTED_ESP_GUID={C12A7328-F81F-11D2-BA4B-00A0C93EC93B}'
    Write-Host 'PARTITION_1=UNCHANGED_MSR'
    Write-Host 'FILESYSTEM=FAT32; LABEL=OC-SEQUOIA'
    Write-Host 'USB_FILES=UNCHANGED'
    Write-Host 'INTERNAL_DISKS=NOT_MODIFIED'
    Write-Host ("LOG=" + $Log)
} finally {
    Stop-Transcript | Out-Null
}

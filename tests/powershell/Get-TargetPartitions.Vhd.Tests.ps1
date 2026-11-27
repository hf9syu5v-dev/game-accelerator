$ErrorActionPreference = 'Stop'
Set-StrictMode -Version 2

function Get-TargetPartitions {
    [CmdletBinding()]
    param([Parameter(Mandatory=$true)][uint32]$DiskNumber)
    try {
        # Same implementation used by the local USB builder.
        $allPartitions = @(Get-CimInstance -Namespace 'root/Microsoft/Windows/Storage' -ClassName 'MSFT_Partition' -ErrorAction Stop)
        $found = @($allPartitions | Where-Object {
            $null -ne $_.DiskNumber -and [uint32]$_.DiskNumber -eq $DiskNumber
        })
        return $found
    }
    catch {
        throw ('PARTITION_QUERY_FAILED for disk {0}: {1}' -f $DiskNumber, $_.Exception.Message)
    }
}

$vhdPath = Join-Path $env:RUNNER_TEMP 'partition-query-validation.vhdx'
$createPath = Join-Path $env:RUNNER_TEMP 'partition-query-create.txt'
$layoutPath = Join-Path $env:RUNNER_TEMP 'partition-query-layout.txt'
$detachPath = Join-Path $env:RUNNER_TEMP 'partition-query-detach.txt'
$letter = @('Z','Y','X','W','V','U','T','S','R','Q','P','O','N','M','L','K','J','I','H','G') |
    Where-Object { -not (Test-Path ($_.ToString() + ':')) } | Select-Object -First 1
if (-not $letter) { throw 'NO_FREE_TEST_DRIVE_LETTER' }

$beforeNumbers = @((Get-Disk | Select-Object -ExpandProperty Number))
try {
    @(
        ('create vdisk file="' + $vhdPath + '" maximum=256 type=expandable'),
        ('select vdisk file="' + $vhdPath + '"'),
        'attach vdisk',
        'exit'
    ) | Set-Content -LiteralPath $createPath -Encoding ASCII
    & diskpart.exe /s $createPath
    if ($LASTEXITCODE -ne 0) { throw 'VHD_CREATE_ATTACH_FAILED' }

    $newDisks = @(Get-Disk | Where-Object { $beforeNumbers -notcontains [int]$_.Number -and [int64]$_.Size -ge 200MB -and [int64]$_.Size -le 300MB })
    if ($newDisks.Count -ne 1) { throw ('EXPECTED_ONE_NEW_TEST_VHD=' + $newDisks.Count) }
    $diskNumber = [uint32]$newDisks[0].Number

    @(
        ('select disk ' + $diskNumber),
        'clean',
        'convert gpt',
        'create partition efi size=128',
        'format fs=fat32 quick label=OC-SEQUOIA',
        ('assign letter=' + $letter),
        'exit'
    ) | Set-Content -LiteralPath $layoutPath -Encoding ASCII
    & diskpart.exe /s $layoutPath
    if ($LASTEXITCODE -ne 0) { throw 'VHD_DISKPART_LAYOUT_FAILED' }

    $parts = @(Get-TargetPartitions -DiskNumber $diskNumber)
    $espGuid = 'c12a7328-f81f-11d2-ba4b-00a0c93ec93b'
    $msrGuid = 'e3c9e316-0b5c-4db8-817d-f92df00215ae'
    $esp = @($parts | Where-Object { ([string]$_.GptType).Trim('{}').ToLowerInvariant() -eq $espGuid })
    $msr = @($parts | Where-Object { ([string]$_.GptType).Trim('{}').ToLowerInvariant() -eq $msrGuid })
    $volume = Get-CimInstance Win32_LogicalDisk -Filter ("DeviceID='{0}:'" -f $letter) -ErrorAction Stop
    if ($parts.Count -ne 2 -or $esp.Count -ne 1 -or $msr.Count -ne 1 -or
        $volume.FileSystem -ne 'FAT32' -or $volume.VolumeName -ne 'OC-SEQUOIA') {
        $parts | Format-List * | Out-String | Write-Host
        $volume | Format-List * | Out-String | Write-Host
        throw 'VHD_PARTITION_QUERY_ASSERTION_FAILED'
    }
    Write-Host 'VHD_CIM_ENUMERATION_RETURNS_ESP_AND_MSR=PASS'
    Write-Host ('VHD_PARTITION_COUNT={0}; DISK={1}; LETTER={2}' -f $parts.Count,$diskNumber,$letter)
}
finally {
    if (Test-Path -LiteralPath $vhdPath) {
        @(
            ('select vdisk file="' + $vhdPath + '"'),
            'detach vdisk',
            'exit'
        ) | Set-Content -LiteralPath $detachPath -Encoding ASCII
        & diskpart.exe /s $detachPath 2>&1 | Out-Null
        Remove-Item -LiteralPath $vhdPath -Force -ErrorAction SilentlyContinue
    }
    foreach ($pathToRemove in @($createPath,$layoutPath,$detachPath)) {
        Remove-Item -LiteralPath $pathToRemove -Force -ErrorAction SilentlyContinue
    }
}

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version 2

# Isolated Windows PowerShell 5.1 regression test for the empty-disk partition query.
# Match the builder implementation: enumerate MSFT_Partition without a WQL filter,
# then filter by DiskNumber in PowerShell. This avoids provider-side object-not-found
# errors observed for empty disks on some Windows Storage provider versions.
function Get-TargetPartitions([uint32]$DiskNumber) {
    try {
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

# Mock the CIM provider so no physical disk is queried or modified.
function Get-CimInstance {
    param(
        [string]$Namespace,
        [string]$ClassName,
        [string]$Filter,
        [string]$ErrorAction
    )
    if ($script:MockCimFailure) { throw 'MOCK_CIM_PROVIDER_FAILURE' }
    if ($Namespace -ne 'root/Microsoft/Windows/Storage' -or $ClassName -ne 'MSFT_Partition' -or -not [string]::IsNullOrEmpty($Filter)) {
        throw ('MOCK_QUERY_ARGUMENTS_MISMATCH: Namespace=[{0}] ClassName=[{1}] Filter=[{2}]' -f $Namespace,$ClassName,$Filter)
    }
    return $script:MockPartitions
}

$script:MockCimFailure = $false
$script:MockPartitions = @()
$empty = @(Get-TargetPartitions -DiskNumber 7)
if ($empty.Count -ne 0) { throw "EMPTY_DISK_TEST_FAILED: expected 0, got $($empty.Count)" }
Write-Host 'EMPTY_DISK_RETURNS_ZERO_PARTITIONS=PASS'

$script:MockPartitions = @(
    [pscustomobject]@{ DiskNumber = 7; PartitionNumber = 1 },
    [pscustomobject]@{ DiskNumber = 8; PartitionNumber = 1 },
    [pscustomobject]@{ DiskNumber = 7; PartitionNumber = 2 }
)
$nonempty = @(Get-TargetPartitions -DiskNumber 7)
if ($nonempty.Count -ne 2 -or @($nonempty | Where-Object { $_.DiskNumber -ne 7 }).Count -ne 0) {
    throw "NONEMPTY_DISK_TEST_FAILED: expected only two partitions for disk 7, got $($nonempty.Count)"
}
Write-Host 'NONEMPTY_DISK_RETURNS_ONLY_MATCHING_PARTITIONS=PASS'

$script:MockCimFailure = $true
$providerErrorPropagated = $false
try {
    $null = @(Get-TargetPartitions -DiskNumber 7)
} catch {
    $providerErrorPropagated = $_.Exception.Message -like 'PARTITION_QUERY_FAILED*'
}
if (-not $providerErrorPropagated) { throw 'CIM_PROVIDER_ERROR_DID_NOT_PROPAGATE' }
Write-Host 'CIM_PROVIDER_FAILURE_STOPS_BUILD=PASS'
Write-Host 'GET_TARGET_PARTITIONS_REGRESSION_TEST=PASS'

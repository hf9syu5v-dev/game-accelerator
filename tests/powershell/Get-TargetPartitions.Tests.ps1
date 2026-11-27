$ErrorActionPreference = 'Stop'
Set-StrictMode -Version 2

# Isolated Windows PowerShell 5.1 regression test for the empty-disk partition query.
function Get-TargetPartitions([int]$DiskNumber) {
    $partitions = @(
        Get-CimInstance -Namespace 'root/Microsoft/Windows/Storage' `
            -ClassName 'MSFT_Partition' `
            -Filter ("DiskNumber = {0}" -f $DiskNumber) `
            -ErrorAction Stop
    )
    return $partitions
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
    if ($Namespace -ne 'root/Microsoft/Windows/Storage' -or
        $ClassName -ne 'MSFT_Partition' -or
        $Filter -ne 'DiskNumber = 7' -or
        $ErrorAction -ne 'Stop') {
        throw 'MOCK_QUERY_ARGUMENTS_MISMATCH'
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
    [pscustomobject]@{ DiskNumber = 7; PartitionNumber = 2 }
)
$nonempty = @(Get-TargetPartitions -DiskNumber 7)
if ($nonempty.Count -ne 2) { throw "NONEMPTY_DISK_TEST_FAILED: expected 2, got $($nonempty.Count)" }
Write-Host 'NONEMPTY_DISK_RETURNS_ALL_PARTITIONS=PASS'

$script:MockCimFailure = $true
$providerErrorPropagated = $false
try {
    $null = @(Get-TargetPartitions -DiskNumber 7)
} catch {
    $providerErrorPropagated = $_.Exception.Message -eq 'MOCK_CIM_PROVIDER_FAILURE'
}
if (-not $providerErrorPropagated) { throw 'CIM_PROVIDER_ERROR_DID_NOT_PROPAGATE' }
Write-Host 'CIM_PROVIDER_FAILURE_STOPS_BUILD=PASS'
Write-Host 'GET_TARGET_PARTITIONS_REGRESSION_TEST=PASS'

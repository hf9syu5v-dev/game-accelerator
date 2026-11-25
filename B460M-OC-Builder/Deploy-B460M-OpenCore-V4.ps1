$ErrorActionPreference = "Stop"

# B460M OpenCore EFI deployment to the existing Ventoy data volume.
# This script only creates a new folder on D:. It does not format disks,
# change partitions, or write to the Ventoy EFI partition (E:).

$Zip = "C:\temp\B460M-OpenCore-1.0.8-DEBUG-USB-BOOT-TEST-CANDIDATE.zip"
$DestinationRoot = "D:\OpenCore-B460M-PLUS-TEST"
$ExpectedZipSha256 = "b726bf990b08bc1955ff99c54afbfb0b979305d7c8da39247db9819d34a440d9"
$ExpectedDiskNumber = 1
$ExpectedDiskModel = "LITEON I T LCS-128L9S"
$WorkRoot = Join-Path $env:TEMP ("B460M-OpenCore-Deploy-" + [guid]::NewGuid().ToString("N"))

function Stop-Deploy([string]$Code) {
    throw $Code
}

try {
    Write-Host "STEP 1: Validate ZIP"
    if (!(Test-Path -LiteralPath $Zip -PathType Leaf)) {
        Stop-Deploy "ZIP_NOT_FOUND"
    }
    $ActualZipSha256 = (Get-FileHash -LiteralPath $Zip -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($ActualZipSha256 -ne $ExpectedZipSha256) {
        Stop-Deploy ("ZIP_SHA256_MISMATCH: " + $ActualZipSha256)
    }
    Write-Host "ZIP_SHA256_OK"

    Write-Host "STEP 2: Validate the target USB disk and D volume"
    $Disk = Get-Disk -Number $ExpectedDiskNumber
    if ($Disk.FriendlyName -ne $ExpectedDiskModel) {
        Stop-Deploy ("DISK_MODEL_MISMATCH: " + $Disk.FriendlyName)
    }
    if ($Disk.BusType.ToString() -ne "USB") {
        Stop-Deploy "DISK_IS_NOT_USB"
    }
    if ($Disk.IsReadOnly -or $Disk.IsOffline) {
        Stop-Deploy "DISK_IS_READONLY_OR_OFFLINE"
    }
    $Partition = Get-Partition -DriveLetter D
    if ($Partition.DiskNumber -ne $ExpectedDiskNumber) {
        Stop-Deploy "D_VOLUME_IS_NOT_ON_DISK_1"
    }
    $Volume = Get-Volume -DriveLetter D
    if ($Volume.FileSystemLabel -ne "Ventoy" -or $Volume.FileSystem -ne "exFAT") {
        Stop-Deploy "D_VOLUME_IS_NOT_THE_EXPECTED_VENTOY_EXFAT_VOLUME"
    }
    if (Test-Path -LiteralPath $DestinationRoot) {
        Stop-Deploy "DESTINATION_ALREADY_EXISTS; NOTHING_WAS_OVERWRITTEN"
    }
    Write-Host "TARGET_DISK_OK"

    Write-Host "STEP 3: Extract the archive to a temporary folder"
    New-Item -ItemType Directory -Path $WorkRoot | Out-Null
    $ExtractRoot = Join-Path $WorkRoot "Extracted"
    New-Item -ItemType Directory -Path $ExtractRoot | Out-Null
    Expand-Archive -LiteralPath $Zip -DestinationPath $ExtractRoot

    Write-Host "STEP 4: Locate and validate the EFI folder"
    $BootFiles = @(Get-ChildItem -LiteralPath $ExtractRoot -Filter "BOOTx64.efi" -File -Recurse |
        Where-Object { $_.Directory.Name -eq "BOOT" })
    if ($BootFiles.Count -ne 1) {
        Stop-Deploy ("BOOTX64_EFI_MATCH_COUNT: " + $BootFiles.Count)
    }
    $SourceEfi = $BootFiles[0].Directory.Parent.FullName

    $RequiredFiles = @(
        "BOOT\BOOTx64.efi",
        "OC\OpenCore.efi",
        "OC\config.plist",
        "OC\Drivers\OpenRuntime.efi",
        "OC\Drivers\HfsPlus.efi"
    )
    foreach ($RelativePath in $RequiredFiles) {
        if (!(Test-Path -LiteralPath (Join-Path $SourceEfi $RelativePath) -PathType Leaf)) {
            Stop-Deploy ("REQUIRED_EFI_FILE_MISSING: " + $RelativePath)
        }
    }
    Write-Host "EFI_LAYOUT_OK"

    Write-Host "STEP 5: Copy EFI into a new folder on D:"
    New-Item -ItemType Directory -Path $DestinationRoot | Out-Null
    $DestinationEfi = Join-Path $DestinationRoot "EFI"
    New-Item -ItemType Directory -Path $DestinationEfi | Out-Null

    Get-ChildItem -LiteralPath $SourceEfi -Force | ForEach-Object {
        Copy-Item -LiteralPath $_.FullName -Destination $DestinationEfi -Recurse -Force
    }

    Write-Host "STEP 6: Compare SHA256 for every copied file"
    $SourceFiles = @(Get-ChildItem -LiteralPath $SourceEfi -File -Recurse)
    foreach ($SourceFile in $SourceFiles) {
        $RelativePath = $SourceFile.FullName.Substring($SourceEfi.Length).TrimStart([char]92)
        $DestinationFile = Join-Path $DestinationEfi $RelativePath
        if (!(Test-Path -LiteralPath $DestinationFile -PathType Leaf)) {
            Stop-Deploy ("COPIED_FILE_MISSING: " + $RelativePath)
        }
        $SourceHash = (Get-FileHash -LiteralPath $SourceFile.FullName -Algorithm SHA256).Hash
        $DestinationHash = (Get-FileHash -LiteralPath $DestinationFile -Algorithm SHA256).Hash
        if ($SourceHash -ne $DestinationHash) {
            Stop-Deploy ("FILE_SHA256_MISMATCH: " + $RelativePath)
        }
    }

    $ReportPath = Join-Path $DestinationRoot "DEPLOY-REPORT.txt"
    @(
        "B460M OpenCore EFI Deployment"
        ("ZIP_SHA256=" + $ActualZipSha256)
        ("TARGET=" + $DestinationEfi)
        ("DISK=" + $ExpectedDiskNumber + " " + $ExpectedDiskModel)
        ("FILE_COUNT=" + $SourceFiles.Count)
        "FILE_SHA256_CHECK=PASS"
        "VENTOY_E_PARTITION=NOT_MODIFIED"
        "INTERNAL_DISKS=NOT_MODIFIED"
        "NO_FORMAT_OR_PARTITION_CHANGES=TRUE"
    ) | Set-Content -LiteralPath $ReportPath -Encoding ASCII

    Remove-Item -LiteralPath $WorkRoot -Recurse -Force

    Write-Host ""
    Write-Host "DEPLOYMENT_SUCCESS" -ForegroundColor Green
    Write-Host ("EFI_PATH=" + $DestinationEfi)
    Write-Host ("VERIFIED_FILES=" + $SourceFiles.Count)
    Write-Host ("REPORT=" + $ReportPath)
    Write-Host "Do not reboot yet. Wait for the next boot-method check."
}
catch {
    Write-Host ""
    Write-Host ("DEPLOYMENT_STOPPED: " + $_.Exception.Message) -ForegroundColor Red
    Write-Host "No disk formatting or partition changes were performed."
    Write-Host "If copying had started, inspect D:\OpenCore-B460M-PLUS-TEST before retrying."
}

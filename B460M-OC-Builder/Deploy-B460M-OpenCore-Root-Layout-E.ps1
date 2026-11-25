$ErrorActionPreference = "Stop"

Write-Host "=== B460M OpenCore Root EFI Deployment (E: Ventoy) ===" -ForegroundColor Cyan
Write-Host "This script only copies EFI files to E:\EFI."
Write-Host "It does not modify Ventoy's hidden EFI partition or any internal disk."
Write-Host ""

$driveLetter = "E"
$source = "E:\OpenCore-B460M-PLUS-TEST\EFI"
$target = "E:\EFI"

try {
    $volume = Get-Volume -DriveLetter $driveLetter
    $partition = Get-Partition -DriveLetter $driveLetter
    $disk = Get-Disk -Number $partition.DiskNumber

    if ($volume.FileSystem -ne "exFAT") {
        throw "Safety check failed: E: is not exFAT. Detected: $($volume.FileSystem)"
    }
    if ($volume.FileSystemLabel -ne "Ventoy") {
        throw "Safety check failed: E: volume label is not Ventoy. Detected: $($volume.FileSystemLabel)"
    }
    if ($disk.BusType -ne "USB") {
        throw "Safety check failed: E: is not on a USB disk. Detected bus: $($disk.BusType)"
    }
    if ($disk.IsBoot -or $disk.IsSystem) {
        throw "Safety check failed: E: belongs to a boot/system disk. Refusing to continue."
    }

    Write-Host "TARGET_DISK_OK"
    Write-Host "Disk Number : $($disk.Number)"
    Write-Host "Disk Model  : $($disk.FriendlyName)"
    Write-Host "Volume      : E: [$($volume.FileSystemLabel)] $($volume.FileSystem)"
    Write-Host ""

    if (-not (Test-Path -LiteralPath $source -PathType Container)) {
        throw "Source EFI folder not found: $source"
    }

    $bootSource = Join-Path $source "BOOT\BOOTx64.efi"
    $ocSource = Join-Path $source "OC\OpenCore.efi"
    $configSource = Join-Path $source "OC\config.plist"

    foreach ($required in @($bootSource, $ocSource, $configSource)) {
        if (-not (Test-Path -LiteralPath $required -PathType Leaf)) {
            throw "Required source file missing: $required"
        }
    }

    if (Test-Path -LiteralPath $target) {
        throw "Target already exists: $target. Nothing was overwritten or deleted."
    }

    Write-Host "SOURCE_EFI_LAYOUT_OK"
    Write-Host "Creating E:\EFI and copying files..."
    New-Item -ItemType Directory -Path $target | Out-Null
    Get-ChildItem -LiteralPath $source | Copy-Item -Destination $target -Recurse -Force

    $sourceFiles = @(Get-ChildItem -LiteralPath $source -File -Recurse)
    $verified = 0

    foreach ($file in $sourceFiles) {
        $relative = $file.FullName.Substring($source.Length).TrimStart('\')
        $destFile = Join-Path $target $relative

        if (-not (Test-Path -LiteralPath $destFile -PathType Leaf)) {
            throw "Copied file missing: $relative"
        }

        $srcHash = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash
        $dstHash = (Get-FileHash -LiteralPath $destFile -Algorithm SHA256).Hash

        if ($srcHash -ne $dstHash) {
            throw "SHA256 mismatch: $relative"
        }
        $verified++
    }

    foreach ($requiredRelative in @("BOOT\BOOTx64.efi", "OC\OpenCore.efi", "OC\config.plist")) {
        if (-not (Test-Path -LiteralPath (Join-Path $target $requiredRelative) -PathType Leaf)) {
            throw "Final layout check failed: $requiredRelative"
        }
    }

    $report = @(
        "B460M OpenCore Root EFI Deployment"
        "Date: $(Get-Date -Format s)"
        "Source: $source"
        "Target: $target"
        "Disk: $($disk.FriendlyName)"
        "DiskNumber: $($disk.Number)"
        "Volume: E: $($volume.FileSystemLabel) $($volume.FileSystem)"
        "VerifiedFiles: $verified"
        "Result: SUCCESS"
    )
    $report | Set-Content -LiteralPath (Join-Path $target "ROOT-EFI-DEPLOY-REPORT.txt") -Encoding ASCII

    Write-Host ""
    Write-Host "ROOT_EFI_DEPLOYMENT_SUCCESS" -ForegroundColor Green
    Write-Host "EFI_PATH=$target"
    Write-Host "VERIFIED_FILES=$verified"
    Write-Host "NEXT_VENTOY_F2_PATH=EFI\BOOT\BOOTx64.efi"
    Write-Host "Original source preserved: $source"
    Write-Host "Do not reboot until the result has been reviewed."
}
catch {
    Write-Host ""
    Write-Host "DEPLOYMENT_STOPPED" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    exit 1
}

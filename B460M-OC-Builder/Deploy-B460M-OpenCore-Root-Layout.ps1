# B460M OpenCore root-layout deployment
# Windows PowerShell 5.1 compatible. Copies files only; never partitions or formats disks.
$ErrorActionPreference = "Stop"

$drive = Get-Volume -DriveLetter D
$partition = Get-Partition -DriveLetter D
$disk = Get-Disk -Number $partition.DiskNumber

Write-Host "=== B460M OpenCore Root Layout Deployment ==="
Write-Host ("D: disk = {0}; bus = {1}; filesystem = {2}" -f $disk.FriendlyName, $disk.BusType, $drive.FileSystem)

if ($disk.BusType -ne "USB" -or $disk.FriendlyName -ne "LITEON I T LCS-128L9S") {
    throw "Safety check failed: D: is not the expected LITEON USB disk."
}
if ($drive.FileSystem -ne "exFAT") {
    throw "Safety check failed: D: is not exFAT."
}

$source = "D:\OpenCore-B460M-PLUS-TEST\EFI"
$destination = "D:\EFI"

if (-not (Test-Path -LiteralPath "$source\BOOT\BOOTx64.efi")) {
    throw "Source EFI/BOOT/BOOTx64.efi is missing."
}
if (-not (Test-Path -LiteralPath "$source\OC\OpenCore.efi")) {
    throw "Source EFI/OC/OpenCore.efi is missing."
}
if (Test-Path -LiteralPath $destination) {
    throw "Destination D:\EFI already exists. Nothing was changed; inspect it before proceeding."
}

Write-Host "Source layout validated."
Write-Host "Copying EFI tree to D:\EFI ..."
New-Item -ItemType Directory -Path $destination | Out-Null
Copy-Item -LiteralPath "$source\*" -Destination $destination -Recurse -Force

$sourceFiles = Get-ChildItem -LiteralPath $source -File -Recurse
$checked = 0
foreach ($file in $sourceFiles) {
    $relative = $file.FullName.Substring($source.Length).TrimStart('\')
    $target = Join-Path $destination $relative
    if (-not (Test-Path -LiteralPath $target -PathType Leaf)) {
        throw "Verification failed: missing $relative"
    }
    $a = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash
    $b = (Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash
    if ($a -ne $b) {
        throw "Verification failed: SHA256 mismatch for $relative"
    }
    $checked++
}

if (-not (Test-Path -LiteralPath "D:\EFI\BOOT\BOOTx64.efi")) { throw "Final BOOTX64.efi check failed." }
if (-not (Test-Path -LiteralPath "D:\EFI\OC\OpenCore.efi")) { throw "Final OpenCore.efi check failed." }
if (-not (Test-Path -LiteralPath "D:\EFI\OC\config.plist")) { throw "Final config.plist check failed." }

Write-Host ""
Write-Host "ROOT_EFI_DEPLOYMENT_SUCCESS"
Write-Host "EFI_PATH=D:\EFI"
Write-Host "VERIFIED_FILES=$checked"
Write-Host "Next Ventoy F2 target: EFI\BOOT\BOOTx64.efi"
Write-Host "No files were deleted. No partitions were changed. E: and internal disks were not touched."

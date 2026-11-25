#requires -RunAsAdministrator
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

$DiskModel = 'LITEON I T LCS-128L9S'
$DiskSerial = '000000123ADC'
$DiskSizeMin = 115GB
$DiskSizeMax = 125GB
$TargetLetter = 'E'
$Fat32SizeMB = 16000
$EfiZip = 'C:\temp\B460M-OpenCore-1.0.8-DEBUG-USB-BOOT-TEST-CANDIDATE.zip'
$EfiZipSha256 = 'b726bf990b08bc1955ff99c54afbfb0b979305d7c8da39247db9819d34a440d9'
$OpenCoreUrl = 'https://github.com/acidanthera/OpenCorePkg/releases/download/1.0.8/OpenCore-1.0.8-DEBUG.zip'
$OpenCoreSha256 = '3F5F42B85703CF2C08E8DCD9245A52FB4326C9F4EF335C75B49F516CBBE131C6'
$SequoiaBoardId = 'Mac-7BA5B2D9E42DDD94'
$Work = Join-Path $env:TEMP ('B460M-Sequoia-USB-' + [guid]::NewGuid().ToString('N'))

function Stop-Setup([string]$Message) { throw $Message }
function Get-Sha256([string]$Path) { (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant() }

Write-Host '=== Native OpenCore + macOS Sequoia Recovery USB Builder ===' -ForegroundColor Cyan
Write-Host 'Ventoy is NOT used. Target is a plain GPT/FAT32 USB disk.'
Write-Host 'No internal disk will be formatted or modified.'

$disks = @(Get-Disk | Where-Object {
    $_.FriendlyName -eq $DiskModel -and
    $_.SerialNumber.Trim() -eq $DiskSerial -and
    $_.BusType -eq 'USB' -and
    $_.Size -ge $DiskSizeMin -and $_.Size -le $DiskSizeMax
})
if ($disks.Count -ne 1) { Stop-Setup "SAFETY_STOP: expected exactly one matching LITEON USB disk; found $($disks.Count)." }
$disk = $disks[0]
if ($disk.IsBoot -or $disk.IsSystem -or $disk.IsReadOnly -or $disk.IsOffline) { Stop-Setup 'SAFETY_STOP: disk is boot/system, read-only or offline.' }
$disk | Format-List Number,FriendlyName,SerialNumber,BusType,Size,PartitionStyle,IsBoot,IsSystem,OperationalStatus

if (!(Test-Path -LiteralPath $EfiZip -PathType Leaf)) { Stop-Setup "EFI_ZIP_NOT_FOUND: $EfiZip" }
$efiHash = Get-Sha256 $EfiZip
if ($efiHash -ne $EfiZipSha256) { Stop-Setup "EFI_ZIP_SHA256_MISMATCH: $efiHash" }
$py = Get-Command py.exe -ErrorAction SilentlyContinue
$pythonArgs = @()
if ($py) {
    $pythonExe = $py.Source
    $pythonArgs = @('-3')
} else {
    $python = Get-Command python.exe -ErrorAction SilentlyContinue
    if (!$python) { $python = Get-Command python3.exe -ErrorAction SilentlyContinue }
    if (!$python) { Stop-Setup 'PYTHON3_NOT_FOUND: install Python 3, or add python.exe to PATH. USB was not changed.' }
    $pythonExe = $python.Source
}
$pythonVersion = & $pythonExe @pythonArgs --version 2>&1
if ($LASTEXITCODE -ne 0 -or ($pythonVersion -notmatch '^Python 3\.[0-9]+')) {
    Stop-Setup ("PYTHON3_CHECK_FAILED: " + ($pythonVersion -join ' ') + ". Install Python 3 and ensure it is on PATH. USB was not changed.")
}
Write-Host ("PYTHON_OK: " + ($pythonVersion -join ' ')) -ForegroundColor Green

New-Item -ItemType Directory -Path $Work -Force | Out-Null
try {
    Write-Host 'STEP 1/5: Extract and validate reviewed EFI package...'
    $extractEfi = Join-Path $Work 'EFI-Package'
    Expand-Archive -LiteralPath $EfiZip -DestinationPath $extractEfi -Force
    $bootMatches = @(Get-ChildItem -LiteralPath $extractEfi -Filter 'BOOTx64.efi' -File -Recurse | Where-Object { $_.Directory.Name -eq 'BOOT' })
    if ($bootMatches.Count -ne 1) { Stop-Setup "EFI_BOOT_FILE_MATCH_COUNT=$($bootMatches.Count)" }
    $sourceEfi = $bootMatches[0].Directory.Parent.FullName
    $required = @('BOOT\BOOTx64.efi','OC\OpenCore.efi','OC\config.plist','OC\Drivers\OpenRuntime.efi','OC\Drivers\HfsPlus.efi')
    foreach ($rel in $required) { if (!(Test-Path -LiteralPath (Join-Path $sourceEfi $rel) -PathType Leaf)) { Stop-Setup "EFI_REQUIRED_FILE_MISSING=$rel" } }
    $efiFiles = @(Get-ChildItem -LiteralPath $sourceEfi -File -Recurse)
    if ($efiFiles.Count -lt 20) { Stop-Setup "EFI_FILE_COUNT_SUSPICIOUS=$($efiFiles.Count)" }
    Write-Host ("EFI_SOURCE_OK; FILES=" + $efiFiles.Count) -ForegroundColor Green

    Write-Host 'STEP 2/5: Download official OpenCore utility package...'
    $ocZip = Join-Path $Work 'OpenCore-1.0.8-DEBUG.zip'
    Invoke-WebRequest -Uri $OpenCoreUrl -OutFile $ocZip -UseBasicParsing
    $ocHash = Get-Sha256 $ocZip
    if ($ocHash -ne $OpenCoreSha256.ToLowerInvariant()) { Stop-Setup "OPENCORE_ZIP_SHA256_MISMATCH=$ocHash" }
    $ocExtract = Join-Path $Work 'OpenCore-Tools'
    Expand-Archive -LiteralPath $ocZip -DestinationPath $ocExtract -Force
    $macrecMatches = @(Get-ChildItem -LiteralPath $ocExtract -Filter 'macrecovery.py' -File -Recurse)
    if ($macrecMatches.Count -ne 1) { Stop-Setup "MACRECOVERY_SCRIPT_MATCH_COUNT=$($macrecMatches.Count)" }
    $macrec = $macrecMatches[0].FullName

    Write-Host 'STEP 3/5: Download Sequoia Recovery from Apple and verify chunklist...'
    $recoveryDir = Join-Path $Work 'com.apple.recovery.boot'
    New-Item -ItemType Directory -Path $recoveryDir -Force | Out-Null
    Push-Location (Split-Path $macrec -Parent)
    try {
        & $pythonExe @pythonArgs $macrec -b $SequoiaBoardId -m 00000000000000000 -o $recoveryDir download
        if ($LASTEXITCODE -ne 0) { Stop-Setup "MACRECOVERY_FAILED_EXIT=$LASTEXITCODE" }
    } finally { Pop-Location }
    $dmg = Join-Path $recoveryDir 'BaseSystem.dmg'
    $chunk = Join-Path $recoveryDir 'BaseSystem.chunklist'
    if (!(Test-Path -LiteralPath $dmg -PathType Leaf) -or !(Test-Path -LiteralPath $chunk -PathType Leaf)) { Stop-Setup 'RECOVERY_FILES_MISSING' }
    if ((Get-Item $dmg).Length -lt 100MB -or (Get-Item $chunk).Length -lt 1KB) { Stop-Setup 'RECOVERY_FILE_SIZE_INVALID' }
    Write-Host ("APPLE_RECOVERY_DOWNLOAD_AND_CHUNKLIST_VERIFICATION_OK; DMG_BYTES=" + (Get-Item $dmg).Length) -ForegroundColor Green

    $diskNow = Get-Disk -Number $disk.Number
    if ($diskNow.FriendlyName -ne $DiskModel -or $diskNow.SerialNumber.Trim() -ne $DiskSerial -or $diskNow.BusType -ne 'USB' -or $diskNow.IsBoot -or $diskNow.IsSystem) { Stop-Setup 'SAFETY_STOP: USB identity changed before formatting.' }
    $letterPartition = Get-Partition -DriveLetter $TargetLetter -ErrorAction SilentlyContinue
    if ($letterPartition -and $letterPartition.DiskNumber -ne $disk.Number) {
        Stop-Setup ('SAFETY_STOP: drive letter ' + $TargetLetter + ' belongs to another disk. No disk changes made.')
    }

    Write-Host ''
    Write-Host ("TARGET DISK: Disk {0} | {1} | Serial {2} | {3:N2} GB" -f $disk.Number,$DiskModel,$DiskSerial,($disk.Size/1GB)) -ForegroundColor Yellow
    Write-Host 'DESTRUCTIVE STEP: all existing partitions and files on this USB disk will be erased.' -ForegroundColor Red
    Write-Host ("Will create a {0} MB GPT/FAT32 partition (letter {1}:) and leave remaining space unallocated." -f $Fat32SizeMB,$TargetLetter)
    $confirm = Read-Host 'Type exactly: BUILD SEQUOIA USB'
    if ($confirm -cne 'BUILD SEQUOIA USB') { Write-Host 'Cancelled. USB unchanged.' -ForegroundColor Yellow; exit 2 }

    Write-Host 'STEP 4/5: Rebuild USB as GPT + FAT32...'
    $dp = Join-Path $Work 'diskpart.txt'
    @("select disk $($disk.Number)",'clean','convert gpt',"create partition efi size=$Fat32SizeMB",'format fs=fat32 quick label=OC-SEQUOIA',"assign letter=$TargetLetter",'exit') | Set-Content -LiteralPath $dp -Encoding ASCII
    $dpOutput = & diskpart.exe /s $dp 2>&1
    $dpOutput | ForEach-Object { Write-Host $_ }
    if ($LASTEXITCODE -ne 0) { Stop-Setup "DISKPART_FAILED_EXIT=$LASTEXITCODE" }

    $vol = Get-Volume -DriveLetter $TargetLetter -ErrorAction Stop
    $part = Get-Partition -DriveLetter $TargetLetter -ErrorAction Stop
    if ($part.DiskNumber -ne $disk.Number -or $part.GptType -ne '{C12A7328-F81F-11D2-BA4B-00A0C93EC93B}' -or $vol.FileSystem -ne 'FAT32' -or $vol.FileSystemLabel -ne 'OC-SEQUOIA') { Stop-Setup ('FORMATTED_USB_VERIFICATION_FAILED; GPT_TYPE=' + $part.GptType) }

    Write-Host 'STEP 5/5: Copy EFI and Sequoia Recovery...'
    $usbRoot = $TargetLetter + ':\'
    New-Item -ItemType Directory -Path (Join-Path $usbRoot 'EFI') -Force | Out-Null
    Get-ChildItem -LiteralPath $sourceEfi -Force | ForEach-Object { Copy-Item -LiteralPath $_.FullName -Destination (Join-Path $usbRoot 'EFI') -Recurse -Force }
    Copy-Item -LiteralPath $recoveryDir -Destination $usbRoot -Recurse -Force

    foreach ($f in $efiFiles) {
        $rel = $f.FullName.Substring($sourceEfi.Length).TrimStart([char]92)
        $dest = Join-Path (Join-Path $usbRoot 'EFI') $rel
        if (!(Test-Path -LiteralPath $dest -PathType Leaf) -or (Get-Sha256 $dest) -ne (Get-Sha256 $f.FullName)) { Stop-Setup "EFI_COPY_HASH_MISMATCH=$rel" }
    }
    foreach ($name in @('BaseSystem.dmg','BaseSystem.chunklist')) {
        $src = Join-Path $recoveryDir $name
        $dst = Join-Path (Join-Path $usbRoot 'com.apple.recovery.boot') $name
        if (!(Test-Path -LiteralPath $dst -PathType Leaf) -or (Get-Sha256 $src) -ne (Get-Sha256 $dst)) { Stop-Setup "RECOVERY_COPY_HASH_MISMATCH=$name" }
    }

    @('B460M TUF GAMING B460M-PLUS Sequoia Recovery USB',"DISK_NUMBER=$($disk.Number)","DISK_MODEL=$DiskModel","DISK_SERIAL=$DiskSerial",'PARTITION_STYLE=GPT','FILESYSTEM=FAT32','VOLUME_LABEL=OC-SEQUOIA',"EFI_FILES_VERIFIED=$($efiFiles.Count)",'RECOVERY=Sequoia BaseSystem.dmg + BaseSystem.chunklist','APPLE_CHUNKLIST_VERIFICATION=PASS','COPY_SHA256_VERIFICATION=PASS','VENTOY=NOT_USED','INTERNAL_DISKS=NOT_MODIFIED') | Set-Content -LiteralPath (Join-Path $usbRoot 'USB-BUILD-REPORT.txt') -Encoding ASCII

    Write-Host ''
    Write-Host 'SEQUOIA_USB_BUILD_SUCCESS' -ForegroundColor Green
    Write-Host ('USB_ROOT=' + $usbRoot)
    Write-Host "EFI_FILES_VERIFIED=$($efiFiles.Count)"
    Write-Host 'RECOVERY=BaseSystem.dmg + BaseSystem.chunklist'
    Write-Host 'APPLE_CHUNKLIST_VERIFICATION=PASS'
    Write-Host 'COPY_SHA256_VERIFICATION=PASS'
    Write-Host 'VENTOY=NOT_USED'
    Write-Host 'Do not install macOS yet. First perform OpenCore picker boot test.'
}
finally {
    if (Test-Path -LiteralPath $Work) { Remove-Item -LiteralPath $Work -Recurse -Force -ErrorAction SilentlyContinue }
}

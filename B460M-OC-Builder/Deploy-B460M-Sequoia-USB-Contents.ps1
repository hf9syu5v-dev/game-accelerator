#requires -RunAsAdministrator
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
$TargetDrive = 'E'
$ExpectedModel = 'LITEON I T LCS-128L9S'
$ExpectedSerial = '000000123ADC'
$ExpectedDiskBytes = [int64]128035676160
$EspGuid = 'c12a7328-f81f-11d2-ba4b-00a0c93ec93b'
$RecoveryCache = Join-Path $env:LOCALAPPDATA 'B460M-Sequoia-RecoveryCache'
$OpenCoreUrl = 'https://github.com/acidanthera/OpenCorePkg/releases/download/1.0.8/OpenCore-1.0.8-DEBUG.zip'
$OpenCoreSha256 = '3F5F42B85703CF2C08E8DCD9245A52FB4326C9F4EF335C75B49F516CBBE131C6'
$Work = Join-Path $env:TEMP ('B460M-USB-CONTENTS-' + [guid]::NewGuid().ToString('N'))
$UsbRoot = 'E:\'
function Stop-Deploy([string]$Message) { throw $Message }
function Get-Sha256([string]$Path) { (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant() }

Write-Host '=== B460M SEQUOIA NO-IGPU EFI DEPLOYMENT ===' -ForegroundColor Cyan
Write-Host 'CONTENTS ONLY: no disk, partition, format, or drive-letter operations.'

$logical = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='E:'"
if (!$logical -or $logical.FileSystem -ne 'FAT32') { Stop-Deploy 'SAFETY_STOP: E: must be FAT32.' }
$part = Get-Partition -DriveLetter E -ErrorAction Stop
if (([string]$part.GptType).Trim('{}').ToLowerInvariant() -ne $EspGuid) { Stop-Deploy "SAFETY_STOP: E: is not a GPT EFI System Partition. GPT type=$($part.GptType)" }
$disk = Get-Disk -Number $part.DiskNumber -ErrorAction Stop
if ($disk.FriendlyName -ne $ExpectedModel -or $disk.SerialNumber.Trim() -ne $ExpectedSerial -or $disk.BusType -ne 'USB' -or [math]::Abs([double]$disk.Size - [double]$ExpectedDiskBytes) -gt 2MB -or $disk.IsBoot -or $disk.IsSystem -or $disk.PartitionStyle -ne 'GPT') {
    Stop-Deploy 'SAFETY_STOP: E: is not the expected LITEON USB disk. No files copied.'
}
Write-Host ("TARGET VERIFIED: Disk {0}; {1}; Serial {2}; E: FAT32 ESP." -f $disk.Number,$disk.FriendlyName,$disk.SerialNumber) -ForegroundColor Green

foreach ($n in @('EFI','com.apple.recovery.boot','USB-BUILD-REPORT.txt')) {
    if (Test-Path -LiteralPath (Join-Path $UsbRoot $n)) { Stop-Deploy "SAFETY_STOP: E:\$n already exists. Nothing overwritten." }
}
$downloads = Join-Path $env:USERPROFILE 'Downloads'
$zipCandidates = @(Get-ChildItem -LiteralPath $downloads -Filter '*.zip' -File -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.Name -match '(?i)NO.?IGPU|15043941995' } | Sort-Object LastWriteTime -Descending)
if (!$zipCandidates.Count) { Stop-Deploy 'ARTIFACT_ZIP_NOT_FOUND: downloaded NO-IGPU diagnostic artifact ZIP must be in Downloads.' }

New-Item -ItemType Directory -Path $Work -Force | Out-Null
try {
    $sourceEfi = $null
    $idx = 0
    foreach ($z in $zipCandidates) {
        $idx++
        $d = Join-Path $Work ('Artifact-' + $idx)
        New-Item -ItemType Directory -Path $d -Force | Out-Null
        try { Expand-Archive -LiteralPath $z.FullName -DestinationPath $d -Force } catch { continue }
        $b = @(Get-ChildItem -LiteralPath $d -Filter 'BOOTx64.efi' -File -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.Directory.Name -eq 'BOOT' })
        if ($b.Count -eq 1) { $sourceEfi = $b[0].Directory.Parent.FullName; break }
        foreach ($inner in @(Get-ChildItem -LiteralPath $d -Filter '*.zip' -File -Recurse -ErrorAction SilentlyContinue)) {
            $id = Join-Path $inner.DirectoryName ([IO.Path]::GetFileNameWithoutExtension($inner.Name) + '-expanded')
            New-Item -ItemType Directory -Path $id -Force | Out-Null
            try { Expand-Archive -LiteralPath $inner.FullName -DestinationPath $id -Force } catch { continue }
            $b = @(Get-ChildItem -LiteralPath $id -Filter 'BOOTx64.efi' -File -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.Directory.Name -eq 'BOOT' })
            if ($b.Count -eq 1) { $sourceEfi = $b[0].Directory.Parent.FullName; break }
        }
        if ($sourceEfi) { break }
    }
    if (!$sourceEfi) { Stop-Deploy 'EFI_SOURCE_NOT_FOUND in downloaded NO-IGPU diagnostic ZIP.' }
    foreach ($rel in @('BOOT\BOOTx64.efi','OC\OpenCore.efi','OC\config.plist','OC\Drivers\OpenRuntime.efi','OC\Drivers\HfsPlus.efi','OC\Kexts\UTBMap.kext\Contents\Info.plist')) {
        if (!(Test-Path -LiteralPath (Join-Path $sourceEfi $rel) -PathType Leaf)) { Stop-Deploy "EFI_REQUIRED_FILE_MISSING: $rel" }
    }
    $utb = Get-Content -LiteralPath (Join-Path $sourceEfi 'OC\Kexts\UTBMap.kext\Contents\Info.plist') -Raw
    if ($utb -match 'HS04|SS04') { Stop-Deploy 'UTBMAP_CHECK_FAILED: HS04 or SS04 found.' }
    $configText = Get-Content -LiteralPath (Join-Path $sourceEfi 'OC\config.plist') -Raw
    if ($configText -notmatch '-wegnoigpu' -or $configText -match '-wegnoegpu') { Stop-Deploy 'BOOT_ARGS_CHECK_FAILED: expected -wegnoigpu and must not contain -wegnoegpu.' }
    if ($configText -notmatch 'iMac20,1') { Stop-Deploy 'SMBIOS_CHECK_FAILED: expected iMac20,1.' }
    $efiFiles = @(Get-ChildItem -LiteralPath $sourceEfi -File -Recurse)
    if ($efiFiles.Count -lt 20) { Stop-Deploy 'EFI_FILE_COUNT_SUSPICIOUS' }
    Write-Host "EFI_SOURCE_OK: $($efiFiles.Count) files; HS04/SS04 absent." -ForegroundColor Green

    $dmg = Join-Path $RecoveryCache 'BaseSystem.dmg'
    $chunk = Join-Path $RecoveryCache 'BaseSystem.chunklist'
    if (!(Test-Path -LiteralPath $dmg -PathType Leaf) -or !(Test-Path -LiteralPath $chunk -PathType Leaf)) { Stop-Deploy "RECOVERY_CACHE_MISSING: $RecoveryCache" }
    if ((Get-Item $dmg).Length -ne 884317790 -or (Get-Item $chunk).Length -lt 1KB) { Stop-Deploy 'RECOVERY_CACHE_SIZE_CHECK_FAILED' }

    $ocZip = Join-Path $Work 'OpenCore-1.0.8-DEBUG.zip'
    Invoke-WebRequest -Uri $OpenCoreUrl -OutFile $ocZip -UseBasicParsing
    if ((Get-Sha256 $ocZip) -ne $OpenCoreSha256.ToLowerInvariant()) { Stop-Deploy 'OPENCORE_UTILITY_SHA256_MISMATCH' }
    $ocDir = Join-Path $Work 'OC-Utilities'
    Expand-Archive -LiteralPath $ocZip -DestinationPath $ocDir -Force
    $mr = @(Get-ChildItem -LiteralPath $ocDir -Filter 'macrecovery.py' -File -Recurse)
    if ($mr.Count -ne 1) { Stop-Deploy 'MACRECOVERY_SCRIPT_COUNT_INVALID' }
    # Locate Python without assuming that the Python Install Manager is on PATH.
    $pyExe = $null
    $pyArgs = @()
    $pythonCandidates = @()
    $pyLauncher = Get-Command py.exe -ErrorAction SilentlyContinue
    if ($pyLauncher) { $pythonCandidates += [pscustomobject]@{ Path=$pyLauncher.Source; Args=@('-3') } }
    $pythonCommand = Get-Command python.exe -ErrorAction SilentlyContinue
    if ($pythonCommand) { $pythonCandidates += [pscustomobject]@{ Path=$pythonCommand.Source; Args=@() } }
    foreach ($candidatePath in @(
        (Join-Path $env:ProgramFiles 'PyManager\python.exe'),
        (Join-Path $env:LOCALAPPDATA 'Programs\Python\Python315\python.exe'),
        (Join-Path $env:LOCALAPPDATA 'Programs\Python\Python314\python.exe'),
        (Join-Path $env:LOCALAPPDATA 'Programs\Python\Python313\python.exe'),
        'C:\Python315\python.exe'
    )) {
        if ($candidatePath -and (Test-Path -LiteralPath $candidatePath -PathType Leaf)) {
            $pythonCandidates += [pscustomobject]@{ Path=$candidatePath; Args=@() }
        }
    }
    foreach ($candidate in $pythonCandidates) {
        try {
            $candidateArgs = @($candidate.Args)
            $versionOutput = (& $candidate.Path @candidateArgs --version 2>&1 | Out-String).Trim()
            if ($LASTEXITCODE -eq 0 -and $versionOutput -match '^Python\s+3\.') {
                $pyExe = $candidate.Path
                $pyArgs = @($candidate.Args)
                Write-Host ("PYTHON_FOUND: {0} ({1})" -f $pyExe,$versionOutput) -ForegroundColor Green
                break
            }
        } catch { }
    }
    if (!$pyExe) { Stop-Deploy 'PYTHON3_NOT_FOUND: checked PATH, Python launcher, and standard Python Install Manager locations.' }
    $verifyScript = Join-Path $Work 'verify_recovery.py'
    $code = @'
import importlib.util, sys
spec = importlib.util.spec_from_file_location("macrecovery", sys.argv[1])
m = importlib.util.module_from_spec(spec)
spec.loader.exec_module(m)
m.verify_image(sys.argv[2], sys.argv[3])
'@
    [IO.File]::WriteAllText($verifyScript,$code,[Text.Encoding]::ASCII)
    & $pyExe @pyArgs $verifyScript $mr[0].FullName $dmg $chunk
    if ($LASTEXITCODE -ne 0) { Stop-Deploy "APPLE_CHUNKLIST_VERIFICATION_FAILED: $LASTEXITCODE" }
    Write-Host 'APPLE_CHUNKLIST_VERIFICATION=PASS' -ForegroundColor Green

    $disk2 = Get-Disk -Number $disk.Number -ErrorAction Stop
    $part2 = Get-Partition -DriveLetter E -ErrorAction Stop
    $vol2 = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='E:'"
    if ($disk2.FriendlyName -ne $ExpectedModel -or $disk2.SerialNumber.Trim() -ne $ExpectedSerial -or $disk2.BusType -ne 'USB' -or $disk2.IsBoot -or $disk2.IsSystem -or $part2.DiskNumber -ne $disk.Number -or ([string]$part2.GptType).Trim('{}').ToLowerInvariant() -ne $EspGuid -or !$vol2 -or $vol2.FileSystem -ne 'FAT32') { Stop-Deploy 'SAFETY_STOP: target identity changed before copy.' }
    foreach ($n in @('EFI','com.apple.recovery.boot','USB-BUILD-REPORT.txt')) { if (Test-Path -LiteralPath (Join-Path $UsbRoot $n)) { Stop-Deploy "SAFETY_STOP: destination appeared: $n" } }

    $destEfi = Join-Path $UsbRoot 'EFI'
    New-Item -ItemType Directory -Path $destEfi | Out-Null
    Get-ChildItem -LiteralPath $sourceEfi -Force | ForEach-Object { Copy-Item -LiteralPath $_.FullName -Destination $destEfi -Recurse }
    $destRecovery = Join-Path $UsbRoot 'com.apple.recovery.boot'
    New-Item -ItemType Directory -Path $destRecovery | Out-Null
    Copy-Item -LiteralPath $dmg -Destination $destRecovery
    Copy-Item -LiteralPath $chunk -Destination $destRecovery

    foreach ($f in $efiFiles) {
        $rel = $f.FullName.Substring($sourceEfi.Length).TrimStart([char]92)
        $dst = Join-Path $destEfi $rel
        if (!(Test-Path -LiteralPath $dst -PathType Leaf) -or (Get-Sha256 $dst) -ne (Get-Sha256 $f.FullName)) { Stop-Deploy "EFI_COPY_SHA256_MISMATCH: $rel" }
    }
    foreach ($n in @('BaseSystem.dmg','BaseSystem.chunklist')) { if ((Get-Sha256 (Join-Path $RecoveryCache $n)) -ne (Get-Sha256 (Join-Path $destRecovery $n))) { Stop-Deploy "RECOVERY_COPY_SHA256_MISMATCH: $n" } }

    @('B460M Sequoia iGPU-isolation USB contents deployment',"TARGET_DRIVE=E:","DISK_MODEL=$($disk.FriendlyName)","DISK_SERIAL=$($disk.SerialNumber)",'PARTITION_STYLE=GPT','PARTITION_TYPE=EFI_SYSTEM_PARTITION','FILESYSTEM=FAT32',"EFI_FILES_SHA256_VERIFIED=$($efiFiles.Count)",'UTBMAP_HS04_SS04=ABSENT','BOOT_ARGS_WEGNOIGPU=PRESENT','BOOT_ARGS_WEGNOEGPU=ABSENT','APPLE_CHUNKLIST_VERIFICATION=PASS','COPY_SHA256_VERIFICATION=PASS','DISK_PARTITION_FORMAT_OPERATIONS=NONE','INTERNAL_DISKS=NOT_MODIFIED') | Set-Content -LiteralPath (Join-Path $UsbRoot 'USB-BUILD-REPORT.txt') -Encoding ASCII
    Write-Host ''
    Write-Host 'SEQUOIA_USB_CONTENTS_DEPLOYMENT_SUCCESS' -ForegroundColor Green
    Write-Host 'USB_ROOT=E:\'
    Write-Host "EFI_FILES_SHA256_VERIFIED=$($efiFiles.Count)"
    Write-Host 'APPLE_CHUNKLIST_VERIFICATION=PASS'
    Write-Host 'COPY_SHA256_VERIFICATION=PASS'
    Write-Host 'DISK_PARTITION_FORMAT_OPERATIONS=NONE'
    Write-Host 'Next: safely eject USB and test OpenCore picker with the RX 570 display output.'
}
finally { if (Test-Path -LiteralPath $Work) { Remove-Item -LiteralPath $Work -Recurse -Force -ErrorAction SilentlyContinue } }

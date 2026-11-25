#requires -RunAsAdministrator
[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

$Drive = 'F'
$ExpectedModel = 'LITEON I T LCS-128L9S'
$ExpectedSerial = '000000123ADC'
$ExpectedDiskBytes = [int64]128035676160
$BoardId = 'Mac-7BA5B2D9E42DDD94' # OpenCorePkg recovery_urls.txt: Sequoia
$Mlb = '00000000000000000'
$RecoveryFolderName = 'com.apple.recovery.boot'
$Work = Join-Path $env:TEMP ('B460M-SEQUOIA-RECOVERY-' + [guid]::NewGuid().ToString('N'))
$MacRecoveryUrl = 'https://raw.githubusercontent.com/acidanthera/OpenCorePkg/master/Utilities/macrecovery/macrecovery.py'

function Stop-Task([string]$Message) { throw $Message }
function Get-Sha256([string]$Path) {
    (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant()
}

try {
    Write-Host '=== DOWNLOAD AND INSTALL APPLE macOS SEQUOIA 15 RECOVERY ===' -ForegroundColor Cyan
    Write-Host 'Method: official OpenCorePkg macrecovery.py -> Apple Recovery server.'
    Write-Host 'The existing EFI and E: partition will not be changed.'

    # Confirm Python 3 exists before touching the USB.
    $Py = Get-Command py.exe -ErrorAction SilentlyContinue
    if (!$Py) { $Py = Get-Command python.exe -ErrorAction SilentlyContinue }
    if (!$Py) {
        Stop-Task 'PYTHON3_NOT_FOUND: Install Python 3 from https://www.python.org/downloads/windows/ and enable the Python Launcher, then run this script again. USB has not been changed.'
    }

    # Verify exact authorized USB device and FAT32 ESP.
    $part = Get-Partition -DriveLetter $Drive -ErrorAction Stop
    $disk = Get-Disk -Number $part.DiskNumber -ErrorAction Stop
    $logical = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='F:'"
    if ($disk.FriendlyName -ne $ExpectedModel -or
        $disk.SerialNumber.Trim() -ne $ExpectedSerial -or
        $disk.BusType -ne 'USB' -or
        [math]::Abs([double]$disk.Size - [double]$ExpectedDiskBytes) -gt 2MB -or
        $disk.IsBoot -or $disk.IsSystem -or $disk.PartitionStyle -ne 'GPT' -or
        $logical.FileSystem -ne 'FAT32') {
        Stop-Task 'SAFETY_STOP: F: is not the authorized LITEON USB FAT32 ESP. No USB changes made.'
    }
    $root = 'F:\'
    $active = Join-Path $root $RecoveryFolderName
    if (!(Test-Path -LiteralPath $active -PathType Container)) {
        Stop-Task 'SAFETY_STOP: Existing F:\com.apple.recovery.boot folder not found.'
    }
    Write-Host ("USB VERIFIED: Disk {0}; {1}; Serial {2}" -f $disk.Number,$disk.FriendlyName,$disk.SerialNumber) -ForegroundColor Green

    New-Item -ItemType Directory -Path $Work -Force | Out-Null
    $macRecovery = Join-Path $Work 'macrecovery.py'
    $downloadDir = Join-Path $Work 'downloaded-recovery'
    New-Item -ItemType Directory -Path $downloadDir -Force | Out-Null

    Write-Host 'Downloading official OpenCorePkg macrecovery.py ...'
    Invoke-WebRequest -Uri $MacRecoveryUrl -OutFile $macRecovery
    if (!(Test-Path -LiteralPath $macRecovery -PathType Leaf) -or (Get-Item $macRecovery).Length -lt 10000) {
        Stop-Task 'MACRECOVERY_SCRIPT_DOWNLOAD_FAILED.'
    }

    $env:HTTP_PROXY = 'http://192.168.123.186:1080'
    $env:HTTPS_PROXY = 'http://192.168.123.186:1080'
    $env:http_proxy = $env:HTTP_PROXY
    $env:https_proxy = $env:HTTPS_PROXY
    $env:NO_PROXY = ''; $env:no_proxy = ''
    Write-Host 'APPLE_RECOVERY_PROXY=http://192.168.123.186:1080' -ForegroundColor Green
    # Apply a finite socket timeout to urllib calls made by official macrecovery.py.
    $pythonSite = Join-Path $Work 'python-site'
    New-Item -ItemType Directory -Path $pythonSite -Force | Out-Null
    Set-Content -LiteralPath (Join-Path $pythonSite 'sitecustomize.py') -Value 'import socket; socket.setdefaulttimeout(45)' -Encoding ASCII
    if ($env:PYTHONPATH) { $env:PYTHONPATH = "$pythonSite;$env:PYTHONPATH" } else { $env:PYTHONPATH = $pythonSite }
    Write-Host 'PYTHON_SOCKET_TIMEOUT=45_SECONDS' -ForegroundColor Green
    Write-Host 'Requesting Sequoia Recovery from Apple through the verified proxy. Transient failures retry up to 5 times ...' -ForegroundColor Yellow
    $argsList = @($macRecovery, '-b', $BoardId, '-m', $Mlb, '-o', $downloadDir, 'download')
    $downloadExit = 1
    $retryDelays = @(10, 20, 40, 60)
    for ($attempt = 1; $attempt -le 5; $attempt++) {
        # Remove partial Apple responses before a clean retry; this is only the TEMP download directory.
        Get-ChildItem -LiteralPath $downloadDir -Force -ErrorAction SilentlyContinue |
            Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host ("APPLE_RECOVERY_ATTEMPT={0}/5" -f $attempt) -ForegroundColor Cyan
        if ($Py.Name -eq 'py.exe') {
            & $Py.Source -3 @argsList
        } else {
            & $Py.Source @argsList
        }
        $downloadExit = $LASTEXITCODE
        if ($downloadExit -eq 0) { break }
        if ($attempt -lt 5) {
            $wait = $retryDelays[$attempt - 1]
            Write-Warning ("Apple download failed (exit {0}); retrying in {1} seconds. USB Recovery remains untouched." -f $downloadExit,$wait)
            Start-Sleep -Seconds $wait
        }
    }
    if ($downloadExit -ne 0) {
        Stop-Task "APPLE_RECOVERY_DOWNLOAD_OR_CHUNKLIST_VERIFICATION_FAILED_AFTER_5_ATTEMPTS; EXIT=$downloadExit. Existing USB Recovery untouched."
    }

    $downloaded = @(Get-ChildItem -LiteralPath $downloadDir -File)
    $basePair = ($downloaded.Name -contains 'BaseSystem.dmg') -and ($downloaded.Name -contains 'BaseSystem.chunklist')
    $recoveryPair = ($downloaded.Name -contains 'RecoveryImage.dmg') -and ($downloaded.Name -contains 'RecoveryImage.chunklist')
    if (!$basePair -and !$recoveryPair) {
        Stop-Task 'DOWNLOAD_INCOMPLETE: Apple download did not produce a complete BaseSystem or RecoveryImage pair. Existing USB Recovery untouched.'
    }

    $dmg = $downloaded | Where-Object { $_.Extension -eq '.dmg' } | Select-Object -First 1
    $chunk = $downloaded | Where-Object { $_.Extension -eq '.chunklist' } | Select-Object -First 1
    if (!$dmg -or !$chunk -or $dmg.Length -lt 500MB -or $chunk.Length -lt 1000) {
        Stop-Task 'DOWNLOAD_SIZE_CHECK_FAILED. Existing USB Recovery untouched.'
    }

    Write-Host 'APPLE_RECOVERY_PAIR=PASS' -ForegroundColor Green
    Write-Host ("IMAGE={0}; SIZE={1:N0} bytes; SHA256={2}" -f $dmg.Name,$dmg.Length,(Get-Sha256 $dmg.FullName))
    Write-Host ("CHUNKLIST={0}; SIZE={1:N0} bytes; SHA256={2}" -f $chunk.Name,$chunk.Length,(Get-Sha256 $chunk.FullName))
    Write-Host 'macrecovery.py completed its Apple chunklist signature and per-chunk SHA256 verification.'

    # Stage new Recovery folder on the USB, verify hashes, then atomically swap.
    $stage = Join-Path $root 'com.apple.recovery.boot-SEQUOIA-STAGING'
    $old = Join-Path $root 'com.apple.recovery.boot-PREVIOUS'
    if (Test-Path -LiteralPath $stage) { Stop-Task 'SAFETY_STOP: Recovery staging folder already exists.' }
    if (Test-Path -LiteralPath $old) { Stop-Task 'SAFETY_STOP: Previous Recovery backup folder already exists.' }

    New-Item -ItemType Directory -Path $stage | Out-Null
    foreach ($file in $downloaded) {
        Copy-Item -LiteralPath $file.FullName -Destination $stage
        $copy = Join-Path $stage $file.Name
        if ((Get-Sha256 $file.FullName) -ne (Get-Sha256 $copy)) {
            Stop-Task "USB_STAGING_HASH_MISMATCH: $($file.Name)"
        }
    }
    Write-Host 'USB_STAGING_SHA256=PASS' -ForegroundColor Green

    Rename-Item -LiteralPath $active -NewName 'com.apple.recovery.boot-PREVIOUS'
    try {
        Rename-Item -LiteralPath $stage -NewName $RecoveryFolderName
    } catch {
        Rename-Item -LiteralPath $old -NewName $RecoveryFolderName
        throw
    }

    $newDmg = Join-Path $active $dmg.Name
    $newChunk = Join-Path $active $chunk.Name
    if (!(Test-Path -LiteralPath $newDmg -PathType Leaf) -or
        !(Test-Path -LiteralPath $newChunk -PathType Leaf) -or
        (Get-Sha256 $newDmg) -ne (Get-Sha256 $dmg.FullName) -or
        (Get-Sha256 $newChunk) -ne (Get-Sha256 $chunk.FullName)) {
        Rename-Item -LiteralPath $active -NewName 'com.apple.recovery.boot-FAILED'
        Rename-Item -LiteralPath $old -NewName $RecoveryFolderName
        Stop-Task 'FINAL_RECOVERY_VERIFY_FAILED; previous Recovery folder restored.'
    }

    Remove-Item -LiteralPath $old -Recurse -Force

    Write-Host ''
    Write-Host 'SEQUOIA_15_RECOVERY_DEPLOYMENT_SUCCESS' -ForegroundColor Green
    Write-Host 'F:\EFI=UNCHANGED'
    Write-Host 'F:\com.apple.recovery.boot=REPLACED_WITH_APPLE_VERIFIED_RECOVERY'
    Write-Host 'E:\SEQUOIA_TEST_PARTITION=UNCHANGED'
    Write-Host 'USB_PARTITIONS_AND_FORMAT=UNCHANGED'
    Write-Host 'INTERNAL_DISKS=NOT_MODIFIED'
    Write-Host 'NOTE: Apple chunklist verification confirms download integrity; final exact OS build should still be checked at Recovery boot.'
}
finally {
    if (Test-Path -LiteralPath $Work) {
        Remove-Item -LiteralPath $Work -Recurse -Force -ErrorAction SilentlyContinue
    }
}

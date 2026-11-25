#requires -RunAsAdministrator
[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$TargetDrive = 'F'
$ExpectedModel = 'LITEON I T LCS-128L9S'
$ExpectedSerial = '000000123ADC'
$ExpectedDiskBytes = [int64]128035676160

function Write-Section([string]$Name) {
    Write-Host ''
    Write-Host "===== $Name =====" -ForegroundColor Cyan
}
function Get-Sha256([string]$Path) {
    (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant()
}

Write-Host '=== B460M SEQUOIA USB CONTENT AUDIT (READ ONLY) ===' -ForegroundColor Cyan
Write-Host 'This script does not download, delete, format, or modify anything.'

# Verify the known USB by hardware identity before reading its contents.
$partF = Get-Partition -DriveLetter F -ErrorAction Stop
$disk = Get-Disk -Number $partF.DiskNumber -ErrorAction Stop
if ($disk.FriendlyName -ne $ExpectedModel -or
    $disk.SerialNumber.Trim() -ne $ExpectedSerial -or
    $disk.BusType -ne 'USB' -or
    [math]::Abs([double]$disk.Size - [double]$ExpectedDiskBytes) -gt 2MB -or
    $disk.IsBoot -or $disk.IsSystem) {
    throw 'SAFETY_STOP: F: is not the previously verified LITEON USB. No changes were made.'
}
if ((Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='F:'").FileSystem -ne 'FAT32') {
    throw 'SAFETY_STOP: F: is not FAT32.'
}
Write-Host ("USB VERIFIED: Disk {0}; {1}; Serial {2}" -f $disk.Number,$disk.FriendlyName,$disk.SerialNumber) -ForegroundColor Green

$recovery = 'F:\com.apple.recovery.boot'
if (!(Test-Path -LiteralPath $recovery -PathType Container)) {
    throw 'RECOVERY_FOLDER_MISSING: F:\com.apple.recovery.boot'
}

Write-Section 'RECOVERY FILE INVENTORY'
$recoveryFiles = @(Get-ChildItem -LiteralPath $recovery -File -Recurse | Sort-Object FullName)
if ($recoveryFiles.Count -eq 0) {
    Write-Host 'RECOVERY_FOLDER_EMPTY' -ForegroundColor Red
} else {
    foreach ($file in $recoveryFiles) {
        $relative = $file.FullName.Substring($recovery.Length).TrimStart([char]92)
        '{0,-38} {1,14:N0} bytes' -f $relative,$file.Length
    }
}
$totalBytes = ($recoveryFiles | Measure-Object Length -Sum).Sum
'RECOVERY_FILE_COUNT={0}' -f $recoveryFiles.Count
'RECOVERY_TOTAL_GB={0:N3}' -f ($totalBytes / 1GB)

Write-Section 'REQUIRED APPLE RECOVERY IMAGE CHECK'
$baseSystem = Join-Path $recovery 'BaseSystem.dmg'
$chunklist = Join-Path $recovery 'BaseSystem.chunklist'
foreach ($item in @(
    @{Name='BaseSystem.dmg';Path=$baseSystem},
    @{Name='BaseSystem.chunklist';Path=$chunklist}
)) {
    if (Test-Path -LiteralPath $item.Path -PathType Leaf) {
        $f = Get-Item -LiteralPath $item.Path
        Write-Host ("{0}=PRESENT; SIZE={1:N0} bytes; SHA256={2}" -f $item.Name,$f.Length,(Get-Sha256 $item.Path)) -ForegroundColor Green
    } else {
        Write-Host ("{0}=MISSING" -f $item.Name) -ForegroundColor Red
    }
}

Write-Section 'APPLE VERSION / INSTALL METADATA'
$metadata = @(
    (Join-Path $recovery 'InstallInfo.plist'),
    (Join-Path $recovery 'SystemVersion.plist'),
    (Join-Path $recovery 'com.apple.Boot.plist')
)
$foundMetadata = $false
foreach ($path in $metadata) {
    if (Test-Path -LiteralPath $path -PathType Leaf) {
        $foundMetadata = $true
        Write-Host "FOUND: $path"
        $raw = Get-Content -LiteralPath $path -Raw
        $matches = [regex]::Matches($raw,'(?is)<key>\s*(ProductVersion|ProductBuildVersion|ServerVersion|BuildVersion|ProductName)\s*</key>\s*<(?:string|integer)>\s*([^<]+)')
        foreach ($match in $matches) {
            Write-Host ("  {0}={1}" -f $match.Groups[1].Value,$match.Groups[2].Value.Trim())
        }
    }
}
if (!$foundMetadata) {
    Write-Host 'No standard version plist found in the Recovery folder.'
}

Write-Section 'E DRIVE SEQUOIA TEST PARTITION'
try {
    $partE = Get-Partition -DriveLetter E -ErrorAction Stop
    $diskE = Get-Disk -Number $partE.DiskNumber -ErrorAction Stop
    if ($partE.DiskNumber -ne $disk.Number) {
        Write-Host 'WARNING: E: is not on the verified USB disk; listing is skipped.' -ForegroundColor Yellow
    } else {
        Write-Host ("E: VERIFIED ON USB; PARTITION_SIZE={0:N2} GB" -f ($partE.Size/1GB))
        $rootItems = @(Get-ChildItem -LiteralPath 'E:\' -Force -ErrorAction Stop)
        if ($rootItems.Count -eq 0) {
            Write-Host 'E_ROOT=EMPTY'
        } else {
            foreach ($item in $rootItems) {
                if ($item.PSIsContainer) {
                    '{0,-42} <DIR>' -f $item.Name
                } else {
                    '{0,-42} {1,14:N0} bytes' -f $item.Name,$item.Length
                }
            }
        }
        $installedVersion = 'E:\System\Library\CoreServices\SystemVersion.plist'
        if (Test-Path -LiteralPath $installedVersion -PathType Leaf) {
            Write-Host 'INSTALLED_MACOS_SYSTEMVERSION_PLIST=PRESENT' -ForegroundColor Green
            Select-String -LiteralPath $installedVersion -Pattern 'ProductVersion|ProductBuildVersion' -Context 0,1
        } else {
            Write-Host 'INSTALLED_MACOS_SYSTEMVERSION_PLIST=NOT_FOUND'
        }
    }
} catch {
    Write-Host 'E_DRIVE_NOT_ACCESSIBLE_OR_NOT_MOUNTED' -ForegroundColor Yellow
}

Write-Section 'AUDIT SUMMARY'
$hasBase = Test-Path -LiteralPath $baseSystem -PathType Leaf
$hasChunk = Test-Path -LiteralPath $chunklist -PathType Leaf
if ($hasBase -and $hasChunk) {
    Write-Host 'APPLE_RECOVERY_CORE_FILES=PRESENT' -ForegroundColor Green
    Write-Host 'NOTE: Presence and hashes do not by themselves prove the image is the latest Sequoia release or that Apple restore verification succeeds.'
} else {
    Write-Host 'APPLE_RECOVERY_CORE_FILES=INCOMPLETE' -ForegroundColor Red
}
Write-Host 'AUDIT_COMPLETE; NO_FILES_CHANGED' -ForegroundColor Green

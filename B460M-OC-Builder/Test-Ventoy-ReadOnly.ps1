# Read-only Ventoy diagnostic for the B460M OpenCore USB test.
# Compatible with Windows PowerShell 5.1. This script does not write to any disk.

$ErrorActionPreference = "Stop"

function Write-Result([string]$Name, [string]$Value) {
    Write-Host ("{0,-30} {1}" -f ($Name + ":"), $Value)
}

Write-Host ""
Write-Host "=== B460M Ventoy Read-Only Diagnostic ===" -ForegroundColor Cyan
Write-Host "No files will be created, changed, or deleted."
Write-Host ""

$letters = @("D", "E")
$partitions = @{}
foreach ($letter in $letters) {
    $p = Get-Partition -DriveLetter $letter -ErrorAction SilentlyContinue
    if (-not $p) {
        Write-Result "$letter drive" "NOT FOUND"
        continue
    }
    $disk = Get-Disk -Number $p.DiskNumber
    $vol = Get-Volume -DriveLetter $letter -ErrorAction SilentlyContinue
    $partitions[$letter] = [pscustomobject]@{
        Partition = $p
        Disk = $disk
        Volume = $vol
    }
    Write-Result "$letter drive" ("Disk {0}, {1}, {2}, {3}" -f $p.DiskNumber, $disk.FriendlyName, $vol.FileSystem, $vol.FileSystemLabel)
    Write-Result "$letter partition" ("#{0}, {1}, {2}" -f $p.PartitionNumber, $p.Type, (("{0:N0} MB" -f ($p.Size / 1MB))))
}

if (-not $partitions.ContainsKey("D") -or -not $partitions.ContainsKey("E")) {
    throw "D: and E: must both be mounted before this diagnostic can continue."
}

$dDisk = $partitions["D"].Partition.DiskNumber
$eDisk = $partitions["E"].Partition.DiskNumber
if ($dDisk -ne $eDisk) {
    throw "SAFETY STOP: D: and E: are not on the same physical disk."
}

$diskInfo = $partitions["D"].Disk
Write-Result "Physical disk number" $dDisk
Write-Result "Physical disk model" $diskInfo.FriendlyName
Write-Result "Disk bus / size" ("{0} / {1:N2} GB" -f $diskInfo.BusType, ($diskInfo.Size / 1GB))

if ($diskInfo.FriendlyName -notmatch "LITEON.*LCS-128L9S") {
    Write-Host "WARNING: Disk model differs from the expected LITEON I T LCS-128L9S. No changes will be made." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "--- Ventoy EFI partition inspection ---" -ForegroundColor Cyan
$efiBoot = "E:\EFI\BOOT"
$bootFiles = @("BOOTX64.EFI", "grubx64.efi", "BOOTIA32.EFI")
foreach ($name in $bootFiles) {
    $path = Join-Path $efiBoot $name
    if (Test-Path -LiteralPath $path -PathType Leaf) {
        $f = Get-Item -LiteralPath $path
        Write-Result $name ("PRESENT, {0:N0} bytes" -f $f.Length)
    } else {
        Write-Result $name "NOT FOUND"
    }
}

Write-Host ""
Write-Host "--- Search Ventoy configuration for version string ---" -ForegroundColor Cyan
$searchRoots = @("E:\grub", "E:\ventoy", "D:\ventoy")
$versionHits = @()
foreach ($root in $searchRoots) {
    if (Test-Path -LiteralPath $root -PathType Container) {
        $files = Get-ChildItem -LiteralPath $root -File -Recurse -ErrorAction SilentlyContinue |
            Where-Object { $_.Length -lt 8MB -and $_.Extension -match "^\.(cfg|conf|txt|json)$" }
        foreach ($file in $files) {
            try {
                $matches = Select-String -LiteralPath $file.FullName -Pattern 'VENTOY_VERSION\s*=\s*["'']?([0-9]+\.[0-9]+\.[0-9]+)' -AllMatches -ErrorAction Stop
                foreach ($match in $matches) {
                    foreach ($m in $match.Matches) {
                        $versionHits += [pscustomobject]@{ Version = $m.Groups[1].Value; File = $file.FullName; Line = $match.LineNumber }
                    }
                }
            } catch {}
        }
    }
}

if ($versionHits.Count -gt 0) {
    $versionHits | Sort-Object Version -Unique | ForEach-Object {
        Write-Result "Ventoy version candidate" ("{0} (from {1}, line {2})" -f $_.Version, $_.File, $_.Line)
    }
} else {
    Write-Result "Ventoy version" "NOT IDENTIFIED FROM READABLE CONFIG"
}

Write-Host ""
Write-Host "--- OpenCore EFI deployment check ---" -ForegroundColor Cyan
$ocRoot = "D:\OpenCore-B460M-PLUS-TEST\EFI"
$required = @(
    "BOOT\BOOTx64.efi",
    "OC\OpenCore.efi",
    "OC\config.plist",
    "OC\Drivers\OpenRuntime.efi",
    "OC\Drivers\HfsPlus.efi"
)
$allPresent = $true
foreach ($relative in $required) {
    $path = Join-Path $ocRoot $relative
    $exists = Test-Path -LiteralPath $path -PathType Leaf
    if (-not $exists) { $allPresent = $false }
    Write-Result $relative $(if ($exists) { "PRESENT" } else { "MISSING" })
}

Write-Host ""
if ($allPresent) {
    Write-Host "OPENCORE_EFI_LAYOUT_OK" -ForegroundColor Green
} else {
    Write-Host "OPENCORE_EFI_LAYOUT_INCOMPLETE" -ForegroundColor Red
}

if ($versionHits.Count -gt 0) {
    $v = ($versionHits | Select-Object -First 1).Version
    try {
        $parts = $v.Split('.') | ForEach-Object { [int]$_ }
        $supportsF2 = ($parts[0] -gt 1) -or ($parts[0] -eq 1 -and ($parts[1] -gt 0 -or ($parts[1] -eq 0 -and $parts[2] -ge 67)))
        Write-Result "F2 local-file browser" $(if ($supportsF2) { "VERSION THRESHOLD MET (>= 1.0.67); runtime test still required" } else { "VERSION BELOW 1.0.67; F2 local-file browser not supported by documented threshold" })
    } catch {
        Write-Result "F2 local-file browser" "VERSION PARSE FAILED; NOT DETERMINED"
    }
} else {
    Write-Result "F2 local-file browser" "CANNOT DETERMINE UNTIL VENTOY VERSION IS IDENTIFIED"
}

Write-Host ""
Write-Host "READ_ONLY_DIAGNOSTIC_COMPLETE" -ForegroundColor Cyan
Write-Host "Send the complete output back. Do not reboot yet."

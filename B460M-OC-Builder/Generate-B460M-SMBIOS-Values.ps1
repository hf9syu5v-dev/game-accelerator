# B460M-PLUS SMBIOS Values Helper
# Windows PowerShell 5.1+
# ASCII-only source to avoid legacy PowerShell encoding/parser problems.
# Derives ROM from the target board's Intel I219-V MAC.
# Does not edit EFI, config.plist, BIOS, or any disk.

$ErrorActionPreference = "Stop"

function Read-Value {
    param([string]$Prompt, [string]$Pattern, [string]$ErrorText, [switch]$Upper)
    while ($true) {
        $v = (Read-Host $Prompt).Trim()
        if ($Upper) { $v = $v.ToUpperInvariant() }
        if ($v -match $Pattern) { return $v }
        Write-Host $ErrorText -ForegroundColor Yellow
    }
}

Write-Host "==================================================" -ForegroundColor Cyan
Write-Host " B460M-PLUS SMBIOS Values Helper" -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Use one matching set from GenSMBIOS for SMBIOS iMac20,1."
Write-Host "Enter the Serial, Board Serial (MLB), and SmUUID from that same set."
Write-Host "Do not use the Apple ROM printed by GenSMBIOS; this script derives ROM"
Write-Host "from the built-in Intel I219-V MAC address of the TARGET B460M board."
Write-Host ""

$serial = Read-Value "System Serial Number (12 alphanumeric characters)" '^[A-Z0-9]{12}$' "Invalid serial format." -Upper
$mlb = Read-Value "Board Serial / MLB (17 alphanumeric characters)" '^[A-Z0-9]{17}$' "Invalid MLB format." -Upper
$uuidText = Read-Value "SmUUID (standard UUID format)" '^[0-9A-Fa-f]{8}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{12}$' "Invalid UUID format." -Upper
$guid = [guid]::Empty
if (-not [guid]::TryParse($uuidText, [ref]$guid)) { throw "SmUUID cannot be parsed." }
$uuid = $guid.ToString("D").ToUpperInvariant()

Write-Host ""
Write-Host "Searching for the Intel I219-V adapter..." -ForegroundColor Cyan
$adapters = @()
if (Get-Command Get-NetAdapter -ErrorAction SilentlyContinue) {
    $adapters = @(Get-NetAdapter -Physical -ErrorAction SilentlyContinue | Where-Object {
        ($_.InterfaceDescription -match 'I219[- ]?V' -or $_.Name -match 'I219[- ]?V') -and
        $_.MacAddress -match '^[0-9A-Fa-f]{2}([-:][0-9A-Fa-f]{2}){5}$'
    })
}
$mac = $null
if ($adapters.Count -eq 1) {
    $a = $adapters[0]
    Write-Host ("Detected: {0} / {1} / {2}" -f $a.Name, $a.InterfaceDescription, $a.MacAddress)
    if ((Read-Host "Use this MAC for ROM? Enter Y to confirm") -match '^(?i)y$') { $mac = $a.MacAddress }
} elseif ($adapters.Count -gt 1) {
    for ($i = 0; $i -lt $adapters.Count; $i++) {
        Write-Host ("[{0}] {1} / {2} / {3}" -f ($i+1), $adapters[$i].Name, $adapters[$i].InterfaceDescription, $adapters[$i].MacAddress)
    }
    $choice = Read-Host "Enter adapter number, or press Enter for manual entry"
    $n = 0
    if ([int]::TryParse($choice, [ref]$n) -and $n -ge 1 -and $n -le $adapters.Count) { $mac = $adapters[$n-1].MacAddress }
}
while (-not $mac) {
    $mac = (Read-Host "Enter the TARGET board I219-V physical MAC (example AA-BB-CC-DD-EE-FF)").Trim()
    if ($mac -notmatch '^[0-9A-Fa-f]{2}([-:][0-9A-Fa-f]{2}){5}$') {
        Write-Host "Invalid MAC format." -ForegroundColor Yellow
        $mac = $null
    }
}
$rom = ($mac -replace '[-:]','').ToLowerInvariant()
if ($rom -notmatch '^[0-9a-f]{12}$' -or $rom -eq '000000000000' -or $rom -eq 'ffffffffffff') { throw "Invalid MAC address." }
$first = [Convert]::ToInt32($rom.Substring(0,2),16)
if (($first -band 1) -ne 0) { throw "This is a multicast MAC. Check the target I219-V physical MAC." }

Write-Host ""
Write-Host "Review these values:" -ForegroundColor Cyan
Write-Host "SystemProductName  : iMac20,1"
Write-Host "SystemSerialNumber : $serial"
Write-Host "MLB                : $mlb"
Write-Host "SystemUUID         : $uuid"
Write-Host "I219-V MAC         : $($mac.ToUpperInvariant())"
Write-Host "ROM                : $rom"
Write-Host ""
if ((Read-Host "Save locally to Documents? Enter YES to confirm") -cne "YES") {
    Write-Host "Cancelled. Nothing was saved." -ForegroundColor Yellow
    exit 0
}

$contentLines = @(
    "B460M-PLUS OpenCore PlatformInfo / Generic"
    "Generated locally: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    ""
    "SystemProductName = iMac20,1"
    "SystemSerialNumber = $serial"
    "MLB = $mlb"
    "ROM = $rom"
    "SystemUUID = $uuid"
    "Source NIC = Intel I219-V"
    "NIC MAC = $($mac.ToUpperInvariant())"
    ""
    "Keep private. Do not upload or commit this file to GitHub."
)
$fileText = ($contentLines -join [Environment]::NewLine) + [Environment]::NewLine
$utf8 = New-Object System.Text.UTF8Encoding($true)
$saveCandidates = @()
$myDocs = [Environment]::GetFolderPath("MyDocuments")
if (-not [string]::IsNullOrWhiteSpace($myDocs)) { $saveCandidates += $myDocs }
if (-not [string]::IsNullOrWhiteSpace($env:USERPROFILE)) {
    $saveCandidates += (Join-Path $env:USERPROFILE "Documents")
    $saveCandidates += (Join-Path $env:USERPROFILE "Downloads")
}
if (-not [string]::IsNullOrWhiteSpace($PSScriptRoot)) { $saveCandidates += $PSScriptRoot }

$savedPath = $null
foreach ($folder in ($saveCandidates | Select-Object -Unique)) {
    try {
        if (-not (Test-Path -LiteralPath $folder -PathType Container)) {
            New-Item -ItemType Directory -Path $folder -Force -ErrorAction Stop | Out-Null
        }
        if (-not (Test-Path -LiteralPath $folder -PathType Container)) { continue }
        $candidate = Join-Path $folder "B460M-SMBIOS-Values-LOCAL.txt"
        [System.IO.File]::WriteAllText($candidate, $fileText, $utf8)
        if (Test-Path -LiteralPath $candidate -PathType Leaf) {
            $savedPath = $candidate
            break
        }
    } catch {
        Write-Host ("Could not save to {0}: {1}" -f $folder, $_.Exception.Message) -ForegroundColor Yellow
    }
}
if (-not $savedPath) {
    throw "Could not save the local SMBIOS file. Check folder permissions and available disk space."
}

Write-Host ""
Write-Host "Saved successfully: $savedPath" -ForegroundColor Green
Write-Host "Keep this file private. Do not publish it or commit it to GitHub."
Write-Host "No EFI, config.plist, BIOS, or disk was modified."

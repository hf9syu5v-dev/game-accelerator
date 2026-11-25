# B460M-PLUS OpenCore DEBUG bootstrap
# Revision: 2026-11-25-r1
# Windows PowerShell 5.1; project workspace only; never writes to a physical EFI partition.

$ErrorActionPreference = "Stop"
$Root = Join-Path $env:USERPROFILE "Downloads\B460M-OC-Builder"
$ToolRoot = Join-Path $Root "Tools\OpenCore-1.0.8-DEBUG"
$ExtractRoot = Join-Path $ToolRoot "Extracted"
$EfiRoot = Join-Path $Root "EFI\EFI"
$OcRoot = Join-Path $EfiRoot "OC"
$DriverRoot = Join-Path $OcRoot "Drivers"
$ToolsRoot = Join-Path $OcRoot "Tools"

if (-not (Test-Path -LiteralPath $Root -PathType Container)) {
    throw ("Project directory not found: " + $Root)
}

New-Item -ItemType Directory -Force -Path $ToolRoot, $ExtractRoot, $EfiRoot, $OcRoot, $DriverRoot, $ToolsRoot | Out-Null

$ZipPath = Join-Path $ToolRoot "OpenCore-1.0.8-DEBUG.zip"
$ZipUrl = "https://github.com/acidanthera/OpenCorePkg/releases/download/1.0.8/OpenCore-1.0.8-DEBUG.zip"
$ExpectedZipSha256 = "3F5F42B85703CF2C08E8DCD9245A52FB4326C9F4EF335C75B49F516CBBE131C6"

Write-Host "Downloading official OpenCore 1.0.8 DEBUG package"
Invoke-WebRequest -Uri $ZipUrl -OutFile $ZipPath -UseBasicParsing
$ZipHash = (Get-FileHash -LiteralPath $ZipPath -Algorithm SHA256).Hash
if ($ZipHash -ne $ExpectedZipSha256) {
    throw ("OpenCore archive SHA256 mismatch. Actual: " + $ZipHash)
}

if (Test-Path -LiteralPath $ExtractRoot) {
    Remove-Item -LiteralPath $ExtractRoot -Recurse -Force
}
New-Item -ItemType Directory -Path $ExtractRoot -Force | Out-Null
Expand-Archive -LiteralPath $ZipPath -DestinationPath $ExtractRoot -Force

function Find-OneFile([string]$Base, [string]$Name) {
    $Matches = @(Get-ChildItem -LiteralPath $Base -File -Recurse | Where-Object { $_.Name -eq $Name })
    if ($Matches.Count -ne 1) {
        throw ("Expected exactly one " + $Name + " in OpenCore package; found " + $Matches.Count)
    }
    return $Matches[0].FullName
}

function Copy-CheckedPe([string]$Source, [string]$Destination) {
    if (-not (Test-Path -LiteralPath $Source -PathType Leaf)) {
        throw ("Missing source file: " + $Source)
    }
    $Bytes = [System.IO.File]::ReadAllBytes($Source)
    if ($Bytes.Length -lt 4096 -or $Bytes[0] -ne 0x4D -or $Bytes[1] -ne 0x5A) {
        throw ("File is not a plausible PE/EFI binary: " + $Source)
    }
    Copy-Item -LiteralPath $Source -Destination $Destination -Force
    $Hash = (Get-FileHash -LiteralPath $Destination -Algorithm SHA256).Hash
    Write-Host ("OK: " + (Split-Path $Destination -Leaf) + " SHA256=" + $Hash) -ForegroundColor Green
}

$OpenCoreSource = Find-OneFile $ExtractRoot "OpenCore.efi"
$BootSource = Find-OneFile $ExtractRoot "BOOTx64.efi"
$RuntimeSource = Find-OneFile $ExtractRoot "OpenRuntime.efi"
$ShellSource = Find-OneFile $ExtractRoot "OpenShell.efi"

Copy-CheckedPe $OpenCoreSource (Join-Path $OcRoot "OpenCore.efi")
Copy-CheckedPe $BootSource (Join-Path $EfiRoot "BOOT\BOOTx64.efi")
Copy-CheckedPe $RuntimeSource (Join-Path $DriverRoot "OpenRuntime.efi")
Copy-CheckedPe $ShellSource (Join-Path $ToolsRoot "OpenShell.efi")

$SampleMatches = @(Get-ChildItem -LiteralPath $ExtractRoot -File -Recurse | Where-Object { $_.Name -eq "Sample.plist" })
if ($SampleMatches.Count -ne 1) {
    throw ("Expected exactly one Sample.plist; found " + $SampleMatches.Count)
}
Copy-Item -LiteralPath $SampleMatches[0].FullName -Destination (Join-Path $ToolRoot "Sample.plist") -Force

$HfsUrl = "https://raw.githubusercontent.com/acidanthera/OcBinaryData/640e7e9240938f2529e725351e1e1150dc3569db/Drivers/HfsPlus.efi"
$HfsPath = Join-Path $DriverRoot "HfsPlus.efi"
Write-Host "Downloading HfsPlus.efi from pinned OcBinaryData commit"
Invoke-WebRequest -Uri $HfsUrl -OutFile $HfsPath -UseBasicParsing
$HfsBytes = [System.IO.File]::ReadAllBytes($HfsPath)
if ($HfsBytes.Length -lt 10000 -or $HfsBytes[0] -ne 0x4D -or $HfsBytes[1] -ne 0x5A) {
    throw "HfsPlus.efi failed binary validation."
}
$HfsHash = (Get-FileHash -LiteralPath $HfsPath -Algorithm SHA256).Hash
Write-Host ("OK: HfsPlus.efi SHA256=" + $HfsHash) -ForegroundColor Green

Write-Host ""
Write-Host "OpenCore 1.0.8 DEBUG bootstrap files staged in the project workspace." -ForegroundColor Green
Write-Host ("BOOT: " + (Join-Path $EfiRoot "BOOT\BOOTx64.efi"))
Write-Host ("OpenCore: " + (Join-Path $OcRoot "OpenCore.efi"))
Write-Host ("Drivers: " + $DriverRoot)
Write-Host ("Tools: " + $ToolsRoot)
Write-Host ("Sample config: " + (Join-Path $ToolRoot "Sample.plist"))
Write-Host "No config.plist was created or modified. No physical EFI volume was accessed."

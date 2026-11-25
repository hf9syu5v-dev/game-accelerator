# Apply locally generated SMBIOS values to the OpenCore config.
# This script is intentionally local-only: it reads Documents\B460M-SMBIOS-Values-LOCAL.txt.
# It never writes SMBIOS values to GitHub or to a build artifact.

param(
    [string]$EfiRoot = (Join-Path $PSScriptRoot "EFI"),
    [string]$ValuesFile = (Join-Path ([Environment]::GetFolderPath("MyDocuments")) "B460M-SMBIOS-Values-LOCAL.txt")
)
$ErrorActionPreference = "Stop"
$config = Join-Path $EfiRoot "OC\config.plist"
if (!(Test-Path -LiteralPath $config -PathType Leaf)) { throw "EFI config not found: $config" }
if (!(Test-Path -LiteralPath $ValuesFile -PathType Leaf)) { throw "Local SMBIOS values file not found: $ValuesFile. Run Generate-B460M-SMBIOS-Values.ps1 first." }

$values = @{}
foreach ($line in Get-Content -LiteralPath $ValuesFile) {
    if ($line -match '^\s*(SystemProductName|SystemSerialNumber|MLB|SystemUUID|ROM)\s*=\s*(\S+)\s*$') {
        $values[$Matches[1]] = $Matches[2]
    }
}
foreach ($key in @("SystemSerialNumber","MLB","SystemUUID","ROM")) {
    if (!$values.ContainsKey($key)) { throw "Missing $key in local SMBIOS values file." }
}
if ($values.SystemSerialNumber -notmatch '^[A-Z0-9]{12}$') { throw "Invalid SystemSerialNumber format." }
if ($values.MLB -notmatch '^[A-Z0-9]{17}$') { throw "Invalid MLB format." }
if ($values.SystemUUID -notmatch '^[0-9A-Fa-f]{8}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{12}$') { throw "Invalid SystemUUID format." }
if ($values.ROM -notmatch '^[0-9A-Fa-f]{12}$') { throw "ROM must be exactly 6 bytes in hexadecimal." }

$python = Get-Command py.exe -ErrorAction SilentlyContinue
if ($python) { $pyexe=$python.Source; $pyargs=@("-3") }
else {
    $python = Get-Command python.exe -ErrorAction SilentlyContinue
    if (!$python) { throw "Python 3 is required to patch the plist." }
    $pyexe=$python.Source; $pyargs=@()
}
$patch = @'
import plistlib, sys
from pathlib import Path
p=Path(sys.argv[1])
serial, mlb, uuid, rom = sys.argv[2:6]
with p.open("rb") as f: c=plistlib.load(f)
g=c["PlatformInfo"]["Generic"]
g["SystemProductName"]="iMac20,1"
g["SystemSerialNumber"]=serial
g["MLB"]=mlb
g["SystemUUID"]=uuid.upper()
g["ROM"]=bytes.fromhex(rom)
with p.open("wb") as f: plistlib.dump(c,f,fmt=plistlib.FMT_XML,sort_keys=False)
with p.open("rb") as f: v=plistlib.load(f)["PlatformInfo"]["Generic"]
assert v["SystemSerialNumber"]==serial and v["MLB"]==mlb
assert v["SystemUUID"]==uuid.upper() and v["ROM"]==bytes.fromhex(rom)
print("Local SMBIOS applied and verified. Values were not uploaded.")
'@
$tmp = Join-Path $env:TEMP ("B460M-Apply-SMBIOS-" + [guid]::NewGuid().ToString("N") + ".py")
try {
    [IO.File]::WriteAllText($tmp, $patch, [Text.Encoding]::ASCII)
    & $pyexe @pyargs $tmp $config $values.SystemSerialNumber $values.MLB $values.SystemUUID $values.ROM
    if ($LASTEXITCODE -ne 0) { throw "Local plist patch failed with exit code $LASTEXITCODE." }
} finally {
    Remove-Item -LiteralPath $tmp -Force -ErrorAction SilentlyContinue
}
Write-Host "LOCAL_SMBIOS_CONFIG_READY: $config" -ForegroundColor Green
Write-Host "Only the extracted EFI folder was modified. No physical EFI partition was touched." -ForegroundColor Green

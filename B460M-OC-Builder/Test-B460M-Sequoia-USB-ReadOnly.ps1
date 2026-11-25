# B460M Sequoia USB - Read-only pre-boot validation
# Compatible with Windows PowerShell 5.1. This script does not modify the USB or internal disks.
[CmdletBinding()]
param(
    [string]$DriveLetter = "E",
    [string]$ExpectedUsbSerial = "000000123ADC",
    [string]$ExpectedUsbModel = "LITEON I T LCS-128L9",
    [string]$OpenCoreVersion = "1.0.8"
)
$ErrorActionPreference = "Stop"
Set-StrictMode -Version 2
$script:Failed = $false
function Write-Check([string]$Name, [bool]$Ok, [string]$Detail) {
    if ($Ok) { Write-Host ("[PASS] " + $Name + ": " + $Detail) -ForegroundColor Green }
    else { Write-Host ("[FAIL] " + $Name + ": " + $Detail) -ForegroundColor Red; $script:Failed = $true }
}
function Write-Info([string]$Name, [string]$Detail) {
    Write-Host ("[INFO] " + $Name + ": " + $Detail) -ForegroundColor Cyan
}
function Get-Sha256([string]$Path) {
    return (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant()
}
Write-Host ""
Write-Host "=== B460M Sequoia USB - READ ONLY VALIDATION ===" -ForegroundColor Cyan
Write-Host "No USB files will be changed. No disk will be formatted or partitioned."
Write-Host ""

$root = ($DriveLetter.TrimEnd(':') + ":\")
if (-not (Test-Path -LiteralPath $root)) { throw "Drive $root is not available." }
$volume = Get-Volume -DriveLetter $DriveLetter.TrimEnd(':')
$partition = Get-Partition -DriveLetter $DriveLetter.TrimEnd(':')
$disk = Get-Disk -Number $partition.DiskNumber
$serial = ([string]$disk.SerialNumber).Trim()
$model = ([string]$disk.FriendlyName).Trim()
Write-Info "Target volume" ("{0} Label={1} FileSystem={2} Size={3:N2} GB" -f $root,$volume.FileSystemLabel,$volume.FileSystem,($volume.Size/1GB))
Write-Info "Physical disk" ("Disk {0}; Model={1}; Serial={2}; Bus={3}; PartitionStyle={4}" -f $disk.Number,$model,$serial,$disk.BusType,$disk.PartitionStyle)
$identityOk = ($disk.BusType -eq "USB" -and $serial -eq $ExpectedUsbSerial -and $model -like ($ExpectedUsbModel + "*") -and $disk.IsBoot -eq $false -and $disk.IsSystem -eq $false)
Write-Check "USB identity / internal-disk protection" $identityOk "Expected USB serial $ExpectedUsbSerial and model prefix '$ExpectedUsbModel'; actual serial '$serial', model '$model', bus '$($disk.BusType)'"
if (-not $identityOk) { throw "Target identity did not match. Stopping without further action." }
Write-Check "GPT + FAT32" ($disk.PartitionStyle -eq "GPT" -and $volume.FileSystem -eq "FAT32") ("PartitionStyle={0}; FileSystem={1}" -f $disk.PartitionStyle,$volume.FileSystem)

$efi = Join-Path $root "EFI"
$oc = Join-Path $efi "OC"
$config = Join-Path $oc "config.plist"
$recovery = Join-Path $root "com.apple.recovery.boot"
$requiredPaths = @(
    (Join-Path $efi "BOOT\BOOTx64.efi"),
    (Join-Path $oc "OpenCore.efi"),
    (Join-Path $oc "Drivers\OpenRuntime.efi"),
    (Join-Path $oc "Drivers\HfsPlus.efi"),
    $config
)
$missing = @($requiredPaths | Where-Object { -not (Test-Path -LiteralPath $_ -PathType Leaf) })
Write-Check "EFI directory structure" ($missing.Count -eq 0) $(if ($missing.Count -eq 0) { "BOOTx64.efi, OpenCore.efi, both drivers and config.plist are present" } else { "Missing: " + ($missing -join "; ") })
if (-not (Test-Path -LiteralPath $config -PathType Leaf)) { throw "config.plist is missing; cannot continue." }

# Locate Python without requiring PATH or the py launcher.
$python = $null
$candidates = @(
    "$env:LOCALAPPDATA\Programs\Python\Python315\python.exe",
    "$env:LOCALAPPDATA\Programs\Python\Python314\python.exe",
    "$env:LOCALAPPDATA\Programs\Python\Python313\python.exe",
    "$env:LOCALAPPDATA\Programs\Python\Python312\python.exe",
    "$env:LOCALAPPDATA\Programs\Python\Python311\python.exe"
)
foreach ($candidate in $candidates) { if (Test-Path -LiteralPath $candidate) { $python = $candidate; break } }
if (-not $python) {
    foreach ($name in @("python.exe","python3.exe")) {
        $cmd = Get-Command $name -ErrorAction SilentlyContinue
        if ($cmd) { $python = $cmd.Source; break }
    }
}
if (-not $python) { throw "Python 3 was not found. Install Python 3 or add it to PATH, then rerun." }
Write-Info "Python" (& $python --version 2>&1)

# Parse plist and inspect enabled entries, paths, and load order. This is read-only.
$pyAudit = @'
import plistlib, json, os, sys
p=sys.argv[1]
with open(p,'rb') as f: c=plistlib.load(f)
issues=[]; notes=[]
def need(cond,msg):
    if not cond: issues.append(msg)
need(isinstance(c,dict),"Root plist object is not a dictionary")
for section,key in [('ACPI','Add'),('Kernel','Add'),('UEFI','Drivers')]:
    need(section in c and isinstance(c.get(section),dict),f"Missing or invalid {section} dictionary")
    if section in c and isinstance(c.get(section),dict):
        need(isinstance(c[section].get(key),list),f"{section}.{key} is missing or not an array")
def entries(section,key):
    try: return c[section][key]
    except Exception: return []
acpi=entries('ACPI','Add'); kexts=entries('Kernel','Add'); drivers=entries('UEFI','Drivers')
def enabled_entries(items):
    return [x for x in items if isinstance(x,dict) and x.get('Enabled') is True]
ea=enabled_entries(acpi); ek=enabled_entries(kexts); ed=enabled_entries(drivers)
def check_entries(items,label):
    for i,x in enumerate(items):
        if not isinstance(x,dict):
            issues.append(f"{label}[{i}] is not a dictionary"); continue
        if x.get('Enabled') is True:
            path=x.get('Path')
            if not isinstance(path,str) or not path:
                issues.append(f"{label}[{i}] enabled entry has no Path")
            elif label=='ACPI':
                full=os.path.join(os.path.dirname(p),'ACPI',path)
                if not os.path.isfile(full): issues.append(f"Enabled ACPI file missing: {path}")
            elif label=='Kernel':
                full=os.path.join(os.path.dirname(p),'Kexts',path)
                if not os.path.exists(full): issues.append(f"Enabled kext missing: {path}")
            elif label=='UEFI':
                full=os.path.join(os.path.dirname(p),'Drivers',path)
                if not os.path.isfile(full): issues.append(f"Enabled driver missing: {path}")
check_entries(acpi,'ACPI'); check_entries(kexts,'Kernel'); check_entries(drivers,'UEFI')
expected=['Lilu.kext','VirtualSMC.kext','WhateverGreen.kext','AppleALC.kext','IntelMausi.kext','NVMeFix.kext','USBToolBox.kext','UTBMap.kext']
actual=[x.get('BundlePath') for x in ek]
for name in expected:
    need(name in actual,f"Expected enabled kext not found: {name}")
positions=[actual.index(x) for x in expected if x in actual]
need(positions==sorted(positions),"Enabled kext order differs from the reviewed expected order")
for name in ['SSDT-PLUG-DRTNIA.aml','SSDT-EC-USBX-DESKTOP.aml','SSDT-AWAC.aml']:
    need(any(x.get('Path')==name for x in ea),f"Expected enabled ACPI table not found: {name}")
for name in ['OpenRuntime.efi','HfsPlus.efi']:
    need(any(x.get('Path')==name for x in ed),f"Expected enabled UEFI driver not found: {name}")
need(c.get('Misc',{}).get('Boot',{}).get('Timeout')==0,"Misc.Boot.Timeout is not 0")
need(c.get('Misc',{}).get('Security',{}).get('ScanPolicy')==0x200703,"Misc.Security.ScanPolicy is not 0x200703")
need(c.get('PlatformInfo',{}).get('Generic',{}).get('SystemProductName')=='iMac20,1',"SMBIOS SystemProductName is not iMac20,1")
need(c.get('NVRAM',{}).get('Add',{}).get('7C436110-AB2A-4BBB-A880-FE41995C9F82',{}).get('boot-args','').find('-v')>=0,"Verbose boot argument -v is absent")
print(json.dumps({"ok":len(issues)==0,"issues":issues,"enabled_acpi":[x.get('Path') for x in ea],"enabled_kexts":actual,"enabled_drivers":[x.get('Path') for x in ed]},ensure_ascii=True))
'@
$tmpPy = Join-Path $env:TEMP ("B460M-EFI-Audit-" + [guid]::NewGuid().ToString("N") + ".py")
try {
    [System.IO.File]::WriteAllText($tmpPy, $pyAudit, (New-Object System.Text.UTF8Encoding($false)))
    $auditRaw = & $python $tmpPy $config
    if ($LASTEXITCODE -ne 0) { throw "Python plist audit failed: $auditRaw" }
    $audit = ($auditRaw | Out-String | ConvertFrom-Json)
    Write-Check "config.plist parse + configuration audit" ([bool]$audit.ok) $(if ($audit.ok) { "plist parsed; expected enabled ACPI, kexts, drivers and boot settings verified" } else { $audit.issues -join " | " })
    Write-Info "Enabled ACPI" (@($audit.enabled_acpi) -join ", ")
    Write-Info "Enabled kext order" (@($audit.enabled_kexts) -join " -> ")
    Write-Info "Enabled UEFI drivers" (@($audit.enabled_drivers) -join ", ")
} finally {
    if (Test-Path -LiteralPath $tmpPy) { Remove-Item -LiteralPath $tmpPy -Force }
}

# Download official OpenCore 1.0.8 DEBUG archive to TEMP only; never to the USB.
$ocZip = Join-Path $env:TEMP "OpenCore-$OpenCoreVersion-DEBUG-validation.zip"
$ocUrl = "https://github.com/acidanthera/OpenCorePkg/releases/download/$OpenCoreVersion/OpenCore-$OpenCoreVersion-DEBUG.zip"
try {
    if (-not (Test-Path -LiteralPath $ocZip)) {
        Write-Info "OpenCore validator" "Downloading official OpenCore $OpenCoreVersion DEBUG package to TEMP..."
        Invoke-WebRequest -Uri $ocUrl -OutFile $ocZip -UseBasicParsing
    }
    $zipHash = Get-Sha256 $ocZip
    $expectedZipHash = "3f5f42b85703cf2c08e8dcd9245a52fb4326c9f4ef335c75b49f516cbbe131c6"
    Write-Info "OpenCore archive SHA256" $zipHash
    if ($zipHash -ne $expectedZipHash) { throw "OpenCore archive SHA256 mismatch. Expected $expectedZipHash; got $zipHash. Delete the TEMP archive and rerun." }
    $extract = Join-Path $env:TEMP ("OpenCore-ocvalidate-" + [guid]::NewGuid().ToString("N"))
    New-Item -ItemType Directory -Path $extract | Out-Null
    try {
        Expand-Archive -LiteralPath $ocZip -DestinationPath $extract -Force
        $validator = Get-ChildItem -LiteralPath $extract -Filter "ocvalidate.exe" -Recurse -File | Select-Object -First 1
        if (-not $validator) { throw "ocvalidate.exe not found in official OpenCore archive." }
        $versionOutput = & $validator.FullName 2>&1
        Write-Info "ocvalidate binary" $validator.FullName
        $validateOutput = & $validator.FullName $config 2>&1
        $validateExit = $LASTEXITCODE
        $validateText = ($validateOutput | Out-String).Trim()
        Write-Check "OpenCore $OpenCoreVersion ocvalidate" ($validateExit -eq 0) $(if ($validateExit -eq 0) { if ($validateText) { $validateText } else { "exit code 0" } } else { "exit code $validateExit; $validateText" })
    } finally {
        if (Test-Path -LiteralPath $extract) { Remove-Item -LiteralPath $extract -Recurse -Force }
    }
} catch {
    Write-Check "OpenCore $OpenCoreVersion ocvalidate" $false $_.Exception.Message
}

# Recovery file presence, size, and SHA-256. No files are changed.
$dmg = Join-Path $recovery "BaseSystem.dmg"
$chunk = Join-Path $recovery "BaseSystem.chunklist"
$recoveryOk = (Test-Path -LiteralPath $dmg -PathType Leaf) -and (Test-Path -LiteralPath $chunk -PathType Leaf)
if ($recoveryOk) {
    $dmgItem = Get-Item -LiteralPath $dmg
    $chunkItem = Get-Item -LiteralPath $chunk
    $recoveryOk = ($dmgItem.Length -gt 100MB -and $chunkItem.Length -gt 0)
    Write-Info "BaseSystem.dmg" ("{0:N0} bytes; SHA256={1}" -f $dmgItem.Length,(Get-Sha256 $dmg))
    Write-Info "BaseSystem.chunklist" ("{0:N0} bytes; SHA256={1}" -f $chunkItem.Length,(Get-Sha256 $chunk))
}
Write-Check "Apple Recovery files" $recoveryOk $(if ($recoveryOk) { "BaseSystem.dmg and BaseSystem.chunklist both exist and are non-empty; DMG exceeds 100 MB" } else { "Missing file or implausible file size under $recovery" })

# Summarize directory layout without changing anything.
$efiFiles = @(Get-ChildItem -LiteralPath $efi -Recurse -File -ErrorAction SilentlyContinue)
$kextDirs = @(Get-ChildItem -LiteralPath (Join-Path $oc "Kexts") -Directory -ErrorAction SilentlyContinue)
$acpiFiles = @(Get-ChildItem -LiteralPath (Join-Path $oc "ACPI") -File -ErrorAction SilentlyContinue)
$driverFiles = @(Get-ChildItem -LiteralPath (Join-Path $oc "Drivers") -File -ErrorAction SilentlyContinue)
$layoutOk = ($efiFiles.Count -gt 0 -and $kextDirs.Count -gt 0 -and $acpiFiles.Count -gt 0 -and $driverFiles.Count -gt 0)
Write-Check "EFI payload directory layout" $layoutOk ("EFI files={0}; Kext bundles={1}; ACPI files={2}; Driver files={3}" -f $efiFiles.Count,$kextDirs.Count,$acpiFiles.Count,$driverFiles.Count)
Write-Info "USB root entries" ((Get-ChildItem -LiteralPath $root -Force | Select-Object -ExpandProperty Name) -join ", ")

Write-Host ""
if ($script:Failed) {
    Write-Host "VALIDATION RESULT: FAIL - do not proceed to BIOS boot test until reported issues are reviewed." -ForegroundColor Red
    exit 2
} else {
    Write-Host "VALIDATION RESULT: PASS - ready for manual OpenCore picker boot test." -ForegroundColor Green
    exit 0
}

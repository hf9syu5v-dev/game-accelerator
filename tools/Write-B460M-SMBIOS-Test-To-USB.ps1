#requires -Version 5.1
[CmdletBinding()]
param([switch]$SelfTest)
$ErrorActionPreference = 'Stop'
Set-StrictMode -Version 2
$TestSerial = 'TESTSERIAL12345'
$TestMLB = 'TESTMLB123456789012'
$TestUUID = '11111111-2222-4333-8444-555555555555'
$ExpectedDiskSerial = 'TESTUSB000000'
$ExpectedDiskModel = 'Samsung SSD 860 EVO'
$ExpectedVolumeLabel = 'OC-SEQUOIA'
$ExpectedDriveLetter = 'F'
$MinDiskBytes = [int64](225GB)
$MaxDiskBytes = [int64](240GB)
$EspGuid = 'c12a7328-f81f-11d2-ba4b-00a0c93ec93b'
function Stop-Write([string]$Message) { throw $Message }
function Find-Python {
    $candidates = @()
    $py = Get-Command py.exe -ErrorAction SilentlyContinue
    if ($py) { $candidates += [pscustomobject]@{Path=$py.Source;Args=@('-3')} }
    $p = Get-Command python.exe -ErrorAction SilentlyContinue
    if ($p) { $candidates += [pscustomobject]@{Path=$p.Source;Args=@()} }
    $knownPython = 'C:\Program Files\PyManager\python.exe'
    if (Test-Path -LiteralPath $knownPython -PathType Leaf) { $candidates += [pscustomobject]@{Path=$knownPython;Args=@()} }
    foreach ($c in $candidates) {
        try {
            $a = @($c.Args) + @('--version')
            $v = (& $c.Path @a 2>&1 | Out-String).Trim()
            if ($LASTEXITCODE -eq 0 -and $v -match '^Python 3\.') { return $c }
        } catch {}
    }
    return $null
}
function Get-PythonHelper {
    $code = @'
import copy, os, plistlib, sys, tempfile
SERIAL = "__SERIAL__"
MLB = "__MLB__"
UUID = "__UUID__"
ZERO_UUID = "00000000-0000-0000-0000-000000000000"
def patch(path, map_path):
    with open(map_path, "rb") as f: mapping = plistlib.load(f)
    ports = mapping["IOKitPersonalities"]["XHC"]["IOProviderMergeProperties"]["ports"]
    assert len(ports) == 11, "UTBMAP_PORT_COUNT_NOT_11"
    with open(path, "rb") as f: original_bytes = f.read()
    fmt = plistlib.FMT_BINARY if original_bytes.startswith(b"bplist00") else plistlib.FMT_XML
    cfg = plistlib.loads(original_bytes)
    g = cfg["PlatformInfo"]["Generic"]
    assert g.get("SystemProductName") == "iMac20,1", "SMBIOS_MODEL_MISMATCH"
    assert g.get("SystemSerialNumber") == "REPLACE_LOCALLY", "SERIAL_NOT_PLACEHOLDER_REFUSE_OVERWRITE"
    assert g.get("MLB") == "REPLACE_LOCALLY", "MLB_NOT_PLACEHOLDER_REFUSE_OVERWRITE"
    assert g.get("SystemUUID") == ZERO_UUID, "UUID_NOT_PLACEHOLDER_REFUSE_OVERWRITE"
    before = copy.deepcopy(cfg)
    g["SystemSerialNumber"], g["MLB"], g["SystemUUID"] = SERIAL, MLB, UUID
    expected = copy.deepcopy(before)
    eg = expected["PlatformInfo"]["Generic"]
    eg["SystemSerialNumber"], eg["MLB"], eg["SystemUUID"] = SERIAL, MLB, UUID
    assert cfg == expected, "UNEXPECTED_CONFIG_MUTATION"
    fd, tmp = tempfile.mkstemp(prefix="config.plist.smbios.", suffix=".tmp", dir=os.path.dirname(path))
    try:
        with os.fdopen(fd, "wb") as f: plistlib.dump(cfg, f, fmt=fmt, sort_keys=False)
        with open(tmp, "rb") as f: check = plistlib.load(f)
        cg = check["PlatformInfo"]["Generic"]
        assert cg["SystemProductName"] == "iMac20,1"
        assert (cg["SystemSerialNumber"],cg["MLB"],cg["SystemUUID"]) == (SERIAL,MLB,UUID)
        assert check["Kernel"]["Quirks"]["XhciPortLimit"] is False
        assert check["Misc"]["Boot"]["Timeout"] == 0
        assert check["Misc"]["Security"]["ScanPolicy"] == 0x200703
        kexts = {x["BundlePath"]: x for x in check["Kernel"]["Add"]}
        assert "UTBMap.kext" in kexts and kexts["UTBMap.kext"]["Enabled"] is True
        os.replace(tmp, path)
    finally:
        if os.path.exists(tmp): os.remove(tmp)
def selftest():
    cfg = {"PlatformInfo":{"Generic":{"SystemProductName":"iMac20,1","SystemSerialNumber":"REPLACE_LOCALLY","MLB":"REPLACE_LOCALLY","SystemUUID":ZERO_UUID,"ROM":bytes(6)}},
      "Kernel":{"Quirks":{"XhciPortLimit":False},"Add":[{"BundlePath":"UTBMap.kext","Enabled":True}]},
      "Misc":{"Boot":{"Timeout":0},"Security":{"ScanPolicy":0x200703}}}
    fd, p = tempfile.mkstemp(suffix=".plist"); os.close(fd)
    try:
        with open(p,"wb") as f: plistlib.dump(cfg,f,fmt=plistlib.FMT_XML,sort_keys=False)
        mp=p+".utb.plist"
        map_data={"IOKitPersonalities":{"XHC":{"IOProviderMergeProperties":{"ports":{str(i):{} for i in range(11)}}}}}
        with open(mp,"wb") as f: plistlib.dump(map_data,f)
        patch(p,mp)
        with open(p,"rb") as f: out=plistlib.load(f)
        g=out["PlatformInfo"]["Generic"]
        assert (g["SystemSerialNumber"],g["MLB"],g["SystemUUID"]) == (SERIAL,MLB,UUID)
        assert g["ROM"] == bytes(6)
        try:
            patch(p,mp)
            raise AssertionError("OVERWRITE_GUARD_FAILED")
        except AssertionError as e:
            if str(e) == "OVERWRITE_GUARD_FAILED": raise
        print("SMBIOS_PATCH_SELFTEST=PASS")
    finally:
        if os.path.exists(p): os.remove(p)
        if os.path.exists(p+".utb.plist"): os.remove(p+".utb.plist")
if __name__ == "__main__":
    if sys.argv[1] == "--self-test": selftest()
    elif sys.argv[1] == "--patch": patch(sys.argv[2],sys.argv[3])
    else: raise SystemExit("INVALID_MODE")
'@
    return $code.Replace('__SERIAL__',$TestSerial).Replace('__MLB__',$TestMLB).Replace('__UUID__',$TestUUID)
}
if ($SelfTest) {
    $python = Find-Python
    if (-not $python) { Stop-Write 'PYTHON3_REQUIRED_FOR_SELFTEST' }
    $helper = Join-Path $env:TEMP ('B460M-SMBIOS-Helper-' + [guid]::NewGuid().ToString('N') + '.py')
    try {
        [IO.File]::WriteAllText($helper,(Get-PythonHelper),[Text.Encoding]::ASCII)
        $argsList = @($python.Args) + @($helper,'--self-test')
        & $python.Path @argsList
        if ($LASTEXITCODE -ne 0) { Stop-Write "SELFTEST_FAILED=$LASTEXITCODE" }
        Write-Host 'POWERSHELL_51_SELFTEST=PASS'
    } finally { Remove-Item -LiteralPath $helper -Force -ErrorAction SilentlyContinue }
    return
}
if ($PSVersionTable.PSVersion -lt [version]'5.1' -or $PSVersionTable.PSVersion.Major -ne 5) { Stop-Write 'WINDOWS_POWERSHELL_51_REQUIRED' }
$identity = [Security.Principal.WindowsIdentity]::GetCurrent()
$principal = New-Object Security.Principal.WindowsPrincipal($identity)
if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) { Stop-Write 'ADMINISTRATOR_REQUIRED' }
$diskMatches = @(Get-Disk | Where-Object {
    $_.BusType -eq 'USB' -and ([string]$_.FriendlyName).Trim().StartsWith($ExpectedDiskModel,[StringComparison]::OrdinalIgnoreCase) -and
    (([string]$_.SerialNumber).Trim() -replace '\s','') -eq $ExpectedDiskSerial -and
    [int64]$_.Size -ge $MinDiskBytes -and [int64]$_.Size -le $MaxDiskBytes -and
    -not $_.IsBoot -and -not $_.IsSystem -and -not $_.IsReadOnly -and -not $_.IsOffline
})
if ($diskMatches.Count -ne 1) { Stop-Write "TARGET_USB_IDENTITY_NOT_UNIQUE; MATCHES=$($diskMatches.Count)" }
$disk = $diskMatches[0]
$cimMatches = @(Get-CimInstance Win32_DiskDrive | Where-Object {
    ([string]$_.Index) -eq [string]$disk.Number -and
    ([string]$_.Model).Trim().StartsWith('Samsung SSD 860 EVO USB Device',[StringComparison]::OrdinalIgnoreCase) -and
    (([string]$_.SerialNumber).Trim() -replace '\s','') -eq $ExpectedDiskSerial -and
    ([string]$_.InterfaceType).Trim() -eq 'USB' -and ([string]$_.PNPDeviceID).StartsWith('USBSTOR\',[StringComparison]::OrdinalIgnoreCase)
})
if ($cimMatches.Count -ne 1) { Stop-Write "CIM_USB_IDENTITY_CROSSCHECK_FAILED; MATCHES=$($cimMatches.Count)" }
$allParts = @(Get-Partition -DiskNumber $disk.Number -ErrorAction Stop)
if ($allParts.Count -ne 1) { Stop-Write "TARGET_USB_MUST_HAVE_EXACTLY_ONE_PREPARED_ESP; PARTITIONS=$($allParts.Count)" }
$parts = @($allParts | Where-Object { $_.DriveLetter -eq $ExpectedDriveLetter })
if ($parts.Count -ne 1) { Stop-Write "EXPECTED_ESP_DRIVE_NOT_UNIQUE=F:" }
$part = $parts[0]
if (([string]$part.GptType).Trim('{}').ToLowerInvariant() -ne $EspGuid) { Stop-Write 'TARGET_PARTITION_IS_NOT_GPT_ESP' }
if ([string]$part.Type -notmatch 'System') { Stop-Write 'TARGET_PARTITION_TYPE_NOT_SYSTEM' }
$vol = Get-Volume -DriveLetter $ExpectedDriveLetter -ErrorAction Stop
if ($vol.FileSystem -ne 'FAT32' -or $vol.FileSystemLabel -ne $ExpectedVolumeLabel) { Stop-Write 'TARGET_ESP_VOLUME_LABEL_OR_FILESYSTEM_MISMATCH' }
$config = 'F:\EFI\OC\config.plist'
$utbInfo = 'F:\EFI\OC\Kexts\UTBMap.kext\Contents\Info.plist'
if (-not (Test-Path -LiteralPath $config -PathType Leaf)) { Stop-Write 'CONFIG_PLIST_NOT_FOUND_ON_F_DRIVE' }
if (-not (Test-Path -LiteralPath $utbInfo -PathType Leaf)) { Stop-Write 'UTBMAP_INFO_PLIST_NOT_FOUND' }
$python = Find-Python
if (-not $python) { Stop-Write 'PYTHON3_REQUIRED; INSTALL_PYTHON_3_AND_RETRY' }
$work = Join-Path $env:TEMP ('B460M-SMBIOS-Write-' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $work | Out-Null
$helper = Join-Path $work 'patch_smbios.py'
$backup = 'F:\EFI\OC\config.plist.pre-test-smbios-' + (Get-Date -Format 'yyyyMMdd-HHmmss') + '.bak'
try {
    [IO.File]::WriteAllText($helper,(Get-PythonHelper),[Text.Encoding]::ASCII)
    $again = @(Get-Disk | Where-Object { $_.Number -eq $disk.Number -and $_.BusType -eq 'USB' -and (([string]$_.SerialNumber).Trim() -replace '\s','') -eq $ExpectedDiskSerial -and ([string]$_.FriendlyName).Trim().StartsWith($ExpectedDiskModel,[StringComparison]::OrdinalIgnoreCase) -and [int64]$_.Size -ge $MinDiskBytes -and [int64]$_.Size -le $MaxDiskBytes -and -not $_.IsBoot -and -not $_.IsSystem -and -not $_.IsReadOnly -and -not $_.IsOffline })
    if ($again.Count -ne 1) { Stop-Write 'TARGET_USB_CHANGED_BEFORE_WRITE' }
    $againParts = @(Get-Partition -DiskNumber $disk.Number -ErrorAction Stop)
    if ($againParts.Count -ne 1 -or $againParts[0].DriveLetter -ne $ExpectedDriveLetter -or ([string]$againParts[0].GptType).Trim('{}').ToLowerInvariant() -ne $EspGuid) { Stop-Write 'TARGET_ESP_LAYOUT_CHANGED_BEFORE_WRITE' }
    $againVol = Get-Volume -DriveLetter $ExpectedDriveLetter -ErrorAction Stop
    if ($againVol.FileSystem -ne 'FAT32' -or $againVol.FileSystemLabel -ne $ExpectedVolumeLabel) { Stop-Write 'TARGET_ESP_VOLUME_CHANGED_BEFORE_WRITE' }
    Copy-Item -LiteralPath $config -Destination $backup -ErrorAction Stop
    $argsList = @($python.Args) + @($helper,'--patch',$config,$utbInfo)
    & $python.Path @argsList
    if ($LASTEXITCODE -ne 0) { throw "PLIST_PATCH_FAILED=$LASTEXITCODE" }
    Write-Host 'SMBIOS_TEST_FIELDS_WRITE=PASS' -ForegroundColor Green
    Write-Host 'SYSTEM_PRODUCT_NAME=iMac20,1'
    Write-Host 'ROM=UNCHANGED'
    Write-Host 'UTBMAP=UNCHANGED'
    Write-Host ('CONFIG_BACKUP=' + $backup)
    Write-Host 'TEMPORARY_TEST_IDENTIFIERS_ONLY=YES'
} catch {
    if (Test-Path -LiteralPath $backup -PathType Leaf) {
        Copy-Item -LiteralPath $backup -Destination $config -Force
        Write-Host 'CONFIG_RESTORED_FROM_BACKUP=YES' -ForegroundColor Yellow
    }
    throw
} finally {
    Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue
}
#requires -Version 5.1
[CmdletBinding()]
param(
    [switch]$SelfTest
)

$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
Set-StrictMode -Version 2

$ExpectedSerial = '000000123ADC'
$ExpectedModelPrefix = 'Samsung SSD 860 EVO'
$ExpectedCimModelPrefix = 'Samsung SSD 860 EVO USB Device'
$MinDiskBytes = [int64](225GB)
$MaxDiskBytes = [int64](240GB)
$MaxCimSizeDelta = [int64](16MB)
$EspGuid = 'c12a7328-f81f-11d2-ba4b-00a0c93ec93b'
$EfiAssetUrl = 'https://github.com/hf9syu5v-dev/game-accelerator/releases/download/b460m-baseline-efi02-sequoia-oc108/B460M-Baseline-EFI-02.zip'
$EfiAssetSha256 = 'c639d82cf099da15afe6fce1b15b47e833c62a9bb77d628a1ccaff4953c1086c'
$ManifestUrl = 'https://github.com/hf9syu5v-dev/game-accelerator/releases/download/b460m-baseline-efi02-sequoia-oc108/EFI-SHA256SUMS.txt'
$ManifestSha256 = '635023086dbbad2bf8b72ad7bb640b234c90f903edbdf6da0f66a3d55d27ac50'
$OpenCoreUrl = 'https://github.com/acidanthera/OpenCorePkg/releases/download/1.0.8/OpenCore-1.0.8-RELEASE.zip'
$OpenCoreSha256 = '2011e8b7216ecb2645d97ea710df965947edd406846e92050b9bc4190be6d27b'
$BoardId = 'Mac-7BA5B2D9E42DDD94'

function Stop-Build([string]$Message) { throw $Message }
function Get-Sha256([string]$Path) {
    (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant()
}
function Get-TargetPartitions([uint32]$DiskNumber) {
    try {
        # Do not use a provider-side WQL filter: empty GPT disks can fail that query.
        $all = @(Get-CimInstance -Namespace 'root/Microsoft/Windows/Storage' -ClassName 'MSFT_Partition' -ErrorAction Stop)
        return @($all | Where-Object {
            $null -ne $_.DiskNumber -and [uint32]$_.DiskNumber -eq $DiskNumber
        })
    } catch {
        throw ('PARTITION_QUERY_FAILED for disk {0}: {1}' -f $DiskNumber,$_.Exception.Message)
    }
}
function Get-StoragePartitions([uint32]$DiskNumber) {
    try {
        return @(Get-Partition -DiskNumber $DiskNumber -ErrorAction Stop)
    } catch {
        # Storage cmdlets report an empty disk as a not-found error instead of an empty array.
        if ($_.FullyQualifiedErrorId -like 'CmdletizationQuery_NotFound_DiskNumber*' -or
            $_.Exception.Message -match 'No MSFT_Partition objects found') {
            return @()
        }
        throw
    }
}
function Test-TargetDiskIdentity($Disk,$CimDisk) {
    if ($null -eq $Disk -or $null -eq $CimDisk) { return $false }
    $serial = ([string]$Disk.SerialNumber).Trim() -replace '\s',''
    $cimSerial = ([string]$CimDisk.SerialNumber).Trim() -replace '\s',''
    $deviceId = '\\.\PHYSICALDRIVE' + [string]$Disk.Number
    $diskSize = [int64]$Disk.Size
    $cimSize = [int64]$CimDisk.Size
    return (
        $Disk.BusType -eq 'USB' -and
        ([string]$Disk.FriendlyName).Trim().StartsWith($ExpectedModelPrefix,[StringComparison]::OrdinalIgnoreCase) -and
        $serial -eq $ExpectedSerial -and
        $diskSize -ge $MinDiskBytes -and $diskSize -le $MaxDiskBytes -and
        -not $Disk.IsBoot -and -not $Disk.IsSystem -and
        -not $Disk.IsReadOnly -and -not $Disk.IsOffline -and
        [int]$CimDisk.Index -eq [int]$Disk.Number -and
        ([string]$CimDisk.DeviceID).Trim() -eq $deviceId -and
        ([string]$CimDisk.Model).Trim().StartsWith($ExpectedCimModelPrefix,[StringComparison]::OrdinalIgnoreCase) -and
        $cimSerial -eq $ExpectedSerial -and
        ([string]$CimDisk.InterfaceType).Trim() -eq 'USB' -and
        ([string]$CimDisk.PNPDeviceID).StartsWith('USBSTOR\',[StringComparison]::OrdinalIgnoreCase) -and
        $cimSize -ge $MinDiskBytes -and $cimSize -le $MaxDiskBytes -and
        [math]::Abs([double]$diskSize - [double]$cimSize) -le $MaxCimSizeDelta
    )
}
function Test-EmptyGpt($Disk,[object[]]$Partitions) {
    return ($Disk.PartitionStyle -eq 'GPT' -and @($Partitions).Count -eq 0)
}
function Get-EspVolumeInfo([string[]]$DiskPartOutput) {
    $found = @()
    foreach ($line in @($DiskPartOutput)) {
        if ([string]$line -match '(?i)(?:卷|Volume)\s+(\d+)\s+([A-Z])\s+OC-SEQUOIA\s+FAT32\b') {
            $found += [pscustomobject]@{Number=[int]$Matches[1];Letter=$Matches[2].ToUpperInvariant()}
        }
    }
    if ($found.Count -ne 1) { return $null }
    return $found[0]
}
function Find-Python {
    $candidates = @()
    $launcher = Get-Command py.exe -ErrorAction SilentlyContinue
    if ($launcher) { $candidates += [pscustomobject]@{Path=$launcher.Source;Args=@('-3')} }
    $cmd = Get-Command python.exe -ErrorAction SilentlyContinue
    if ($cmd) { $candidates += [pscustomobject]@{Path=$cmd.Source;Args=@()} }
    $cmd = Get-Command python3.exe -ErrorAction SilentlyContinue
    if ($cmd) { $candidates += [pscustomobject]@{Path=$cmd.Source;Args=@()} }
    foreach ($path in @(
        (Join-Path $env:ProgramFiles 'PyManager\python.exe'),
        (Join-Path $env:LOCALAPPDATA 'Programs\Python\Python315\python.exe'),
        (Join-Path $env:LOCALAPPDATA 'Programs\Python\Python314\python.exe'),
        (Join-Path $env:LOCALAPPDATA 'Programs\Python\Python313\python.exe'),
        (Join-Path $env:LOCALAPPDATA 'Programs\Python\Python312\python.exe'),
        'C:\Python313\python.exe'
    )) {
        if ($path -and (Test-Path -LiteralPath $path -PathType Leaf)) {
            $candidates += [pscustomobject]@{Path=$path;Args=@()}
        }
    }
    foreach ($candidate in $candidates) {
        try {
            $candidateArgs = @($candidate.Args)
            $v = (& $candidate.Path @candidateArgs --version 2>&1 | Out-String).Trim()
            if ($LASTEXITCODE -eq 0 -and $v -match '^Python\s+3\.') { return $candidate }
        } catch {}
    }
    return $null
}
function Test-ManifestAndEFI([string]$EfiRoot,[string]$ManifestPath) {
    $lines = @(Get-Content -LiteralPath $ManifestPath | Where-Object { -not [string]::IsNullOrWhiteSpace($_) })
    if ($lines.Count -ne 60) { Stop-Build "EFI_MANIFEST_ENTRY_COUNT_INVALID=$($lines.Count); expected 60." }
    foreach ($line in $lines) {
        if ($line -notmatch '^([0-9a-fA-F]{64})\s+(.+)$') { Stop-Build "EFI_MANIFEST_LINE_INVALID=$line" }
        $expected = $Matches[1].ToLowerInvariant()
        $relative = $Matches[2].Replace('/','\')
        if ($relative -match '(^|\\)\.\.(\\|$)' -or [IO.Path]::IsPathRooted($relative)) { Stop-Build "EFI_MANIFEST_PATH_UNSAFE=$relative" }
        $path = Join-Path $EfiRoot $relative
        if (!(Test-Path -LiteralPath $path -PathType Leaf)) { Stop-Build "EFI_MANIFEST_FILE_MISSING=$relative" }
        $actual = Get-Sha256 $path
        if ($actual -ne $expected) { Stop-Build "EFI_MANIFEST_SHA256_MISMATCH=$relative" }
    }
    $required = @('BOOT\BOOTx64.efi','OC\OpenCore.efi','OC\config.plist','OC\Drivers\OpenRuntime.efi','OC\Drivers\HfsPlus.efi','OC\Kexts\UTBMap.kext\Contents\Info.plist')
    foreach ($rel in $required) {
        if (!(Test-Path -LiteralPath (Join-Path $EfiRoot $rel) -PathType Leaf)) { Stop-Build "EFI_REQUIRED_FILE_MISSING=$rel" }
    }
    Write-Host 'EFI_MANIFEST_VERIFIED=60_OF_60' -ForegroundColor Green
}
function Invoke-EFIConfigPatch([string]$Python,[string[]]$PythonArgs,[string]$ConfigPath,[string]$HelperPath) {
    $code = @'
import plistlib,sys
p=sys.argv[1]
with open(p,"rb") as f: c=plistlib.load(f)
c["Kernel"]["Quirks"]["XhciPortLimit"]=False
c["Misc"]["Boot"]["Timeout"]=0
c["Misc"]["Security"]["ScanPolicy"]=0x200703
g=c["PlatformInfo"]["Generic"]
assert g.get("SystemProductName")=="iMac20,1"
assert g.get("SystemSerialNumber")=="REPLACE_LOCALLY"
assert g.get("MLB")=="REPLACE_LOCALLY"
assert g.get("SystemUUID")=="00000000-0000-0000-0000-000000000000"
assert bytes(g.get("ROM",b""))==bytes(6)
k={x["BundlePath"]:x for x in c["Kernel"]["Add"]}
assert "UTBMap.kext" in k and k["UTBMap.kext"]["Enabled"] is True
m=sys.argv[2]
with open(m,"rb") as f: utb=plistlib.load(f)
ports=utb["IOKitPersonalities"]["XHC"]["IOProviderMergeProperties"]["ports"]
assert len(ports)==11, len(ports)
with open(p,"wb") as f: plistlib.dump(c,f,fmt=plistlib.FMT_XML,sort_keys=False)
with open(p,"rb") as f: d=plistlib.load(f)
assert d["Kernel"]["Quirks"]["XhciPortLimit"] is False
assert d["Misc"]["Boot"]["Timeout"]==0
assert d["Misc"]["Security"]["ScanPolicy"]==0x200703
print("EFI02_SEQUOIA_BOOT_SETTINGS_PATCH=PASS")
print("UTBMAP_PORTS=11")
print("SMBIOS_PLACEHOLDERS_RETAINED=YES")
'@
    [IO.File]::WriteAllText($HelperPath,$code,[Text.Encoding]::ASCII)
    $mapPath = Join-Path (Split-Path $ConfigPath -Parent) 'Kexts\UTBMap.kext\Contents\Info.plist'
    if (!(Test-Path -LiteralPath $mapPath -PathType Leaf)) { Stop-Build "UTBMAP_INFO_PLIST_MISSING=$mapPath" }
    & $Python @PythonArgs $HelperPath $ConfigPath $mapPath
    if ($LASTEXITCODE -ne 0) { Stop-Build "EFI_CONFIG_PATCH_FAILED=$LASTEXITCODE" }
}
function Invoke-BuilderSelfTest {
    $goodDisk = [pscustomobject]@{
        Number=1;FriendlyName='Samsung SSD 860 EVO';SerialNumber=$ExpectedSerial;BusType='USB'
        Size=[int64]250059350016;PartitionStyle='GPT';IsBoot=$false;IsSystem=$false;IsReadOnly=$false;IsOffline=$false
    }
    $goodCim = [pscustomobject]@{
        Index=1;DeviceID='\\.\PHYSICALDRIVE1';Model='Samsung SSD 860 EVO USB Device'
        SerialNumber=$ExpectedSerial;InterfaceType='USB';PNPDeviceID='USBSTOR\DISK&VEN_SAMSUNG&PROD_SSD_860_EVO\000000123ADC&0'
        Size=[int64]250056737280
    }
    if (-not (Test-TargetDiskIdentity $goodDisk $goodCim)) { throw 'SELFTEST_VALID_USB_REJECTED' }
    $badIndex=$goodCim.PSObject.Copy();$badIndex.Index=0
    if (Test-TargetDiskIdentity $goodDisk $badIndex) { throw 'SELFTEST_WRONG_PHYSICAL_INDEX_ACCEPTED' }
    $badSerial=$goodCim.PSObject.Copy();$badSerial.SerialNumber='OTHER'
    if (Test-TargetDiskIdentity $goodDisk $badSerial) { throw 'SELFTEST_WRONG_SERIAL_ACCEPTED' }
    $badBus=$goodCim.PSObject.Copy();$badBus.InterfaceType='SATA'
    if (Test-TargetDiskIdentity $goodDisk $badBus) { throw 'SELFTEST_NON_USB_CIM_ACCEPTED' }
    $badDisk=$goodDisk.PSObject.Copy();$badDisk.IsSystem=$true
    if (Test-TargetDiskIdentity $badDisk $goodCim) { throw 'SELFTEST_SYSTEM_DISK_ACCEPTED' }
    $badSize=$goodCim.PSObject.Copy();$badSize.Size += [int64](32MB)
    if (Test-TargetDiskIdentity $goodDisk $badSize) { throw 'SELFTEST_SIZE_DELTA_ACCEPTED' }
    if (-not (Test-EmptyGpt $goodDisk @())) { throw 'SELFTEST_EMPTY_GPT_REJECTED' }
    if (Test-EmptyGpt $goodDisk @([pscustomobject]@{DiskNumber=1})) { throw 'SELFTEST_NONEMPTY_GPT_ACCEPTED' }
    $cnInfo = Get-EspVolumeInfo @('  卷     3     G   OC-SEQUOIA   FAT32   磁盘分区          15 GB  正常         已隐藏')
    if (!$cnInfo -or $cnInfo.Number -ne 3 -or $cnInfo.Letter -ne 'G') { throw 'SELFTEST_CHINESE_VOLUME_PARSE_FAILED' }
    $enInfo = Get-EspVolumeInfo @('  Volume  4   H   OC-SEQUOIA   FAT32   Partition  15 GB  Healthy Hidden')
    if (!$enInfo -or $enInfo.Number -ne 4 -or $enInfo.Letter -ne 'H') { throw 'SELFTEST_ENGLISH_VOLUME_PARSE_FAILED' }
    if (Get-EspVolumeInfo @('  Volume  3   H   OTHER       FAT32   Partition  15 GB  Healthy')) { throw 'SELFTEST_WRONG_LABEL_ACCEPTED' }
    $mbr=$goodDisk.PSObject.Copy();$mbr.PartitionStyle='MBR'
    if (Test-EmptyGpt $mbr @()) { throw 'SELFTEST_MBR_ACCEPTED' }
    Write-Host 'BUILDER_SELFTEST=PASS' -ForegroundColor Green
}
if ($SelfTest) {
    Invoke-BuilderSelfTest
    return
}

if ($PSVersionTable.PSVersion.Major -ne 5 -or $PSVersionTable.PSVersion.Minor -ne 1) { Stop-Build 'WINDOWS_POWERSHELL_51_REQUIRED' }
$identity = [Security.Principal.WindowsIdentity]::GetCurrent()
$principal = New-Object Security.Principal.WindowsPrincipal($identity)
if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Stop-Build 'ADMINISTRATOR_REQUIRED: reopen Windows PowerShell 5.1 as Administrator.'
}

$work = Join-Path $env:TEMP ('B460M-Sequoia-USB-r4-' + [guid]::NewGuid().ToString('N'))
$espLetter = $null
$espPartition = $null
$targetDisk = $null
try {
    Write-Host '=== B460M SEQUOIA USB BUILDER r4 ===' -ForegroundColor Cyan
    Write-Host 'Target: Samsung SSD 860 EVO USB / serial 000000123ADC / empty GPT or existing single ESP.'
    Write-Host 'Disk 0, all non-target disks, E:, F:, HP NVMe and internal SATA are protected.'
    New-Item -ItemType Directory -Path $work -Force | Out-Null

    $allDisks = @(Get-Disk -ErrorAction Stop)
    $cimDisks = @(Get-CimInstance -ClassName Win32_DiskDrive -ErrorAction Stop)
    $matches = @()
    foreach ($d in $allDisks) {
        $candidates = @($cimDisks | Where-Object { [int]$_.Index -eq [int]$d.Number })
        if ($candidates.Count -eq 1 -and (Test-TargetDiskIdentity $d $candidates[0])) {
            $matches += [pscustomobject]@{Disk=$d;Cim=$candidates[0]}
        }
    }
    if ($matches.Count -ne 1) { Stop-Build "SAFETY_STOP: expected exactly one fully matched Samsung USB; found $($matches.Count)." }
    $targetDisk = $matches[0].Disk
    $targetCim = $matches[0].Cim

    $targetParts = @(Get-TargetPartitions ([uint32]$targetDisk.Number))
    $storageParts = @(Get-StoragePartitions ([uint32]$targetDisk.Number))
    $script:ExistingEsp = $false
    if ($targetDisk.PartitionStyle -ne 'GPT') { Stop-Build 'SAFETY_STOP: target is not GPT.' }
    if ($targetParts.Count -eq 0 -and $storageParts.Count -eq 0) {
        $script:ExistingEsp = $false
    } elseif ($targetParts.Count -eq 1 -and $storageParts.Count -eq 1) {
        $p = $storageParts[0]
        if (([string]$p.GptType).Trim('{}').ToLowerInvariant() -ne $EspGuid -or $p.Size -lt 15GB -or $p.Size -gt 17GB) {
            Stop-Build 'SAFETY_STOP: existing partition is not the expected 15-17GB EFI System Partition.'
        }
        $script:ExistingEsp = $true
    } else {
        Stop-Build "SAFETY_STOP: expected empty GPT or exactly one 15-17GB EFI partition. MSFT_Partition=$($targetParts.Count); Get-Partition=$($storageParts.Count)."
    }
    $fPart = Get-Partition -DriveLetter F -ErrorAction SilentlyContinue
    if ($fPart -and [int]$fPart.DiskNumber -eq [int]$targetDisk.Number) {
        Stop-Build 'SAFETY_STOP: F: belongs to target USB; F: is protected.'
    }
    $ePart = Get-Partition -DriveLetter E -ErrorAction SilentlyContinue
    if ($ePart -and [int]$ePart.DiskNumber -eq [int]$targetDisk.Number) {
        Stop-Build 'SAFETY_STOP: E: belongs to target USB; refusing to alter protected E:.'
    }
    Write-Host ''
    Write-Host 'VERIFIED TARGET DEVICE' -ForegroundColor Green
    $targetDisk | Format-List Number,FriendlyName,SerialNumber,BusType,Size,PartitionStyle,IsBoot,IsSystem
    $targetCim | Format-List Index,DeviceID,Model,SerialNumber,InterfaceType,Size,PNPDeviceID
    Write-Host (('TARGET_LAYOUT_PRECHECK=PASS; EXISTING_ESP={0}; GPT=PASS; DISK0_AND_OTHER_DISKS=PROTECTED; E_AND_F=PROTECTED' -f $script:ExistingEsp)) -ForegroundColor Green

    $python = Find-Python
    if (-not $python) { Stop-Build 'PYTHON3_NOT_FOUND: Python 3 is required to verify Apple Recovery and patch config.plist.' }
    $pythonExe = $python.Path
    $pythonArgs = @($python.Args)
    Write-Host ("PYTHON_OK=" + ((& $pythonExe @pythonArgs --version 2>&1 | Out-String).Trim())) -ForegroundColor Green

    Write-Host 'STEP 1: Download and verify EFI02 release package and manifest...'
    $efiZip = Join-Path $work 'B460M-Baseline-EFI-02.zip'
    $manifest = Join-Path $work 'EFI-SHA256SUMS.txt'
    Invoke-WebRequest -Uri $EfiAssetUrl -OutFile $efiZip -UseBasicParsing
    Invoke-WebRequest -Uri $ManifestUrl -OutFile $manifest -UseBasicParsing
    if ((Get-Sha256 $efiZip) -ne $EfiAssetSha256) { Stop-Build 'EFI02_RELEASE_ASSET_SHA256_MISMATCH' }
    if ((Get-Sha256 $manifest) -ne $ManifestSha256) { Stop-Build 'EFI02_MANIFEST_SHA256_MISMATCH' }
    $efiExtract = Join-Path $work 'EFI02'
    Expand-Archive -LiteralPath $efiZip -DestinationPath $efiExtract -Force
    $efiRoot = Join-Path $efiExtract 'EFI'
    if (!(Test-Path -LiteralPath $efiRoot -PathType Container)) { Stop-Build 'EFI02_ROOT_MISSING' }
    Test-ManifestAndEFI $efiRoot $manifest
    $efiFiles = @(Get-ChildItem -LiteralPath $efiRoot -File -Recurse)

    Write-Host 'STEP 2: Apply Sequoia USB and first-boot picker settings...'
    $config = Join-Path $efiRoot 'OC\config.plist'
    Invoke-EFIConfigPatch $pythonExe $pythonArgs $config (Join-Path $work 'patch-efi02.py')
    Write-Host 'NOTE: EFI02 SMBIOS placeholders remain; inject the target board SMBIOS values before macOS installation.' -ForegroundColor Yellow

    Write-Host 'STEP 3: Download OpenCore 1.0.8 RELEASE tools and Apple Recovery...'
    $ocZip = Join-Path $work 'OpenCore-1.0.8-RELEASE.zip'
    Invoke-WebRequest -Uri $OpenCoreUrl -OutFile $ocZip -UseBasicParsing
    if ((Get-Sha256 $ocZip) -ne $OpenCoreSha256) { Stop-Build 'OPENCORE_1_0_8_RELEASE_SHA256_MISMATCH' }
    $ocExtract = Join-Path $work 'OpenCoreTools'
    Expand-Archive -LiteralPath $ocZip -DestinationPath $ocExtract -Force
    $macrec = @(Get-ChildItem -LiteralPath $ocExtract -Filter 'macrecovery.py' -File -Recurse)
    if ($macrec.Count -ne 1) { Stop-Build "MACRECOVERY_SCRIPT_COUNT=$($macrec.Count)" }
    $recovery = Join-Path $work 'com.apple.recovery.boot'
    New-Item -ItemType Directory -Path $recovery -Force | Out-Null
    $downloadOk = $false
    for ($attempt=1; $attempt -le 6; $attempt++) {
        Remove-Item -LiteralPath (Join-Path $recovery 'BaseSystem.dmg'),(Join-Path $recovery 'BaseSystem.chunklist') -Force -ErrorAction SilentlyContinue
        Push-Location $macrec[0].DirectoryName
        try {
            & $pythonExe @pythonArgs $macrec[0].FullName -b $BoardId -m 00000000000000000 -o $recovery download
            $rc = $LASTEXITCODE
        } finally { Pop-Location }
        $dmg = Join-Path $recovery 'BaseSystem.dmg'
        $chunk = Join-Path $recovery 'BaseSystem.chunklist'
        if ($rc -eq 0 -and (Test-Path -LiteralPath $dmg -PathType Leaf) -and (Test-Path -LiteralPath $chunk -PathType Leaf) -and (Get-Item $dmg).Length -ge 100MB) {
            $downloadOk = $true
            break
        }
        if ($attempt -lt 6) { Start-Sleep -Seconds (5 * $attempt) }
    }
    if (-not $downloadOk) { Stop-Build 'APPLE_RECOVERY_DOWNLOAD_FAILED; USB remains unchanged.' }
    $verifyPy = Join-Path $work 'verify-recovery.py'
    $verifyCode = @'
import importlib.util,sys
spec=importlib.util.spec_from_file_location("macrecovery",sys.argv[1])
m=importlib.util.module_from_spec(spec)
spec.loader.exec_module(m)
m.verify_image(sys.argv[2],sys.argv[3])
'@
    [IO.File]::WriteAllText($verifyPy,$verifyCode,[Text.Encoding]::ASCII)
    & $pythonExe @pythonArgs $verifyPy $macrec[0].FullName $dmg $chunk
    if ($LASTEXITCODE -ne 0) { Stop-Build 'APPLE_RECOVERY_CHUNKLIST_VERIFICATION_FAILED; USB remains unchanged.' }
    Write-Host 'APPLE_RECOVERY_CHUNKLIST_VERIFICATION=PASS' -ForegroundColor Green

    Write-Host ''
    Write-Host ("TARGET: Disk {0} | {1} | Serial {2} | {3:N2} GiB" -f $targetDisk.Number,$targetDisk.FriendlyName,$targetDisk.SerialNumber,($targetDisk.Size/1GB)) -ForegroundColor Yellow
    Write-Host 'WRITE SCOPE: reuse the existing single 16GB EFI partition when present; otherwise create it. No DiskPart clean.' -ForegroundColor Yellow
    $confirmText = 'BUILD SEQUOIA INSTALLER ON SAMSUNG USB ' + $ExpectedSerial
    $answer = Read-Host ('Type exactly: ' + $confirmText)
    if ($answer -cne $confirmText) { Write-Host 'CANCELLED: no disk changes made.' -ForegroundColor Yellow; exit 2 }

    # Revalidate target identity and accepted layout immediately before any write.
    $diskNow = Get-Disk -Number $targetDisk.Number -ErrorAction Stop
    $cimNow = @(Get-CimInstance Win32_DiskDrive -ErrorAction Stop | Where-Object { [int]$_.Index -eq [int]$targetDisk.Number })
    $partsNow = @(Get-TargetPartitions ([uint32]$targetDisk.Number))
    $partsStorageNow = @(Get-StoragePartitions ([uint32]$targetDisk.Number))
    $layoutOk = $diskNow.PartitionStyle -eq 'GPT' -and $partsNow.Count -eq $partsStorageNow.Count -and
        (($partsNow.Count -eq 0 -and $partsStorageNow.Count -eq 0) -or
         ($partsNow.Count -eq 1 -and $partsStorageNow.Count -eq 1 -and
          ([string]$partsStorageNow[0].GptType).Trim('{}').ToLowerInvariant() -eq $EspGuid -and
          $partsStorageNow[0].Size -ge 15GB -and $partsStorageNow[0].Size -le 17GB))
    if ($cimNow.Count -ne 1 -or -not (Test-TargetDiskIdentity $diskNow $cimNow[0]) -or -not $layoutOk) {
        Stop-Build 'SAFETY_STOP: target identity or accepted GPT layout changed before write.'
    }
    $fPartNow = Get-Partition -DriveLetter F -ErrorAction SilentlyContinue
    if ($fPartNow -and [int]$fPartNow.DiskNumber -eq [int]$targetDisk.Number) { Stop-Build 'SAFETY_STOP: F: protection check failed.' }
    $ePartNow = Get-Partition -DriveLetter E -ErrorAction SilentlyContinue
    if ($ePartNow -and [int]$ePartNow.DiskNumber -eq [int]$targetDisk.Number) { Stop-Build 'SAFETY_STOP: E: protection check failed.' }

    if ($script:ExistingEsp) {
        $espPartition = $storageParts[0]
        $dp = Join-Path $work 'inspect-existing-esp.txt'
        @("select disk $($targetDisk.Number)",'select partition 1','detail partition','exit') | Set-Content -LiteralPath $dp -Encoding ASCII
        $detail = @(& diskpart.exe /s $dp 2>&1 | ForEach-Object { [string]$_ })
        $espInfo = Get-EspVolumeInfo $detail
        if (-not $espInfo) { Stop-Build 'EXISTING_ESP_VOLUME_NOT_FOUND_IN_DISKPART_DETAIL.' }
        $espLetter = $espInfo.Letter
        $espVolumeNumber = $espInfo.Number
        $usbRoot = $espLetter + ':\'
        if (-not (Test-Path -LiteralPath $usbRoot -PathType Container)) { Stop-Build ('EXISTING_ESP_DRIVE_LETTER_NOT_ACCESSIBLE=' + $espLetter) }
        Write-Host ('EXISTING_ESP_REUSED=' + $espLetter + ':; DiskPart confirms OC-SEQUOIA FAT32.') -ForegroundColor Green
    } else {
        $usedLetters = @(Get-CimInstance Win32_LogicalDisk -ErrorAction Stop | ForEach-Object { ([string]$_.DeviceID).TrimEnd(':').ToUpperInvariant() })
        foreach ($candidate in @('G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')) {
            if ($usedLetters -notcontains $candidate) { $espLetter = $candidate; break }
        }
        if (-not $espLetter) { Stop-Build 'NO_FREE_DRIVE_LETTER_G_TO_Z; E: and F: remain untouched.' }
        $dp = Join-Path $work 'create-efi.txt'
        @("select disk $($targetDisk.Number)",'create partition efi size=16000','format fs=fat32 quick label=OC-SEQUOIA',"assign letter=$espLetter",'select partition 1','detail partition','exit') |
            Set-Content -LiteralPath $dp -Encoding ASCII
        $dpOut = @(& diskpart.exe /s $dp 2>&1 | ForEach-Object { [string]$_ })
        $dpOut | ForEach-Object { Write-Host $_ }
        if ($LASTEXITCODE -ne 0) { Stop-Build ('DISKPART_CREATE_ESP_FAILED=' + $LASTEXITCODE) }
        $espInfo = Get-EspVolumeInfo $dpOut
        if (!$espInfo -or $espInfo.Letter -ne $espLetter) { Stop-Build 'DISKPART_CREATED_ESP_VOLUME_IDENTITY_MISMATCH' }
        $espVolumeNumber = $espInfo.Number
        if (Get-Command Update-HostStorageCache -ErrorAction SilentlyContinue) { Update-HostStorageCache -ErrorAction SilentlyContinue }
        Start-Sleep -Seconds 3
        $finalParts = @(Get-Partition -DiskNumber $targetDisk.Number -ErrorAction Stop)
        if ($finalParts.Count -ne 1 -or ([string]$finalParts[0].GptType).Trim('{}').ToLowerInvariant() -ne $EspGuid -or
            $finalParts[0].Size -lt 15GB -or $finalParts[0].Size -gt 17GB) {
            Stop-Build 'CREATED_ESP_PARTITION_TYPE_OR_SIZE_VERIFICATION_FAILED'
        }
        $espPartition = $finalParts[0]
        $usbRoot = $espLetter + ':\'
        if (-not (Test-Path -LiteralPath $usbRoot -PathType Container)) { Stop-Build ('CREATED_ESP_DRIVE_LETTER_NOT_ACCESSIBLE=' + $espLetter) }
    }

    Write-Host 'STEP 4: Copy EFI02 and verified Apple Recovery...'
    New-Item -ItemType Directory -Path (Join-Path $usbRoot 'EFI') -Force | Out-Null
    Get-ChildItem -LiteralPath $efiRoot -Force | ForEach-Object {
        Copy-Item -LiteralPath $_.FullName -Destination (Join-Path $usbRoot 'EFI') -Recurse -Force
    }
    Copy-Item -LiteralPath $recovery -Destination $usbRoot -Recurse -Force

    foreach ($f in $efiFiles) {
        $rel = $f.FullName.Substring($efiRoot.Length).TrimStart([char]92)
        $dst = Join-Path (Join-Path $usbRoot 'EFI') $rel
        if (!(Test-Path -LiteralPath $dst -PathType Leaf) -or (Get-Sha256 $dst) -ne (Get-Sha256 $f.FullName)) {
            Stop-Build "EFI_COPY_SHA256_MISMATCH=$rel"
        }
    }
    foreach ($name in @('BaseSystem.dmg','BaseSystem.chunklist')) {
        $src = Join-Path $recovery $name
        $dst = Join-Path (Join-Path $usbRoot 'com.apple.recovery.boot') $name
        if (!(Test-Path -LiteralPath $dst -PathType Leaf) -or (Get-Sha256 $dst) -ne (Get-Sha256 $src)) {
            Stop-Build "RECOVERY_COPY_SHA256_MISMATCH=$name"
        }
    }

    $report = @(
        'B460M Sequoia USB Builder r4',
        "TARGET_DISK_NUMBER=$($targetDisk.Number)",
        "TARGET_MODEL=$($targetDisk.FriendlyName)",
        "TARGET_SERIAL=$ExpectedSerial",
        'PARTITION_STYLE=GPT',
        'PARTITION_COUNT=1',
        'PARTITION_TYPE=EFI_SYSTEM_PARTITION',
        'FILESYSTEM=FAT32',
        'VOLUME_LABEL=OC-SEQUOIA',
        "EFI_FILES_SHA256_VERIFIED=$($efiFiles.Count)",
        'EFI02_MANIFEST_VERIFIED=60_OF_60',
        'APPLE_RECOVERY_CHUNKLIST_VERIFICATION=PASS',
        'EFI_COPY_SHA256=PASS',
        'RECOVERY_COPY_SHA256=PASS',
        'XHCI_PORT_LIMIT=False',
        'BOOT_TIMEOUT=0',
        'SCAN_POLICY=0x200703',
        'SMBIOS_PLACEHOLDERS_RETAINED=YES',
        'DISKPART_CLEAN=NOT_USED',
        'E_AND_F=PROTECTED',
        'OTHER_DISKS=NOT_MODIFIED'
    )
    $report | Set-Content -LiteralPath (Join-Path $usbRoot 'USB-BUILD-REPORT.txt') -Encoding ASCII

    # Remove the temporary drive letter using DiskPart; Windows Storage cmdlets may hide ESP paths.
    $removeDp = Join-Path $work 'remove-esp-letter.txt'
    @("select volume $espVolumeNumber",'remove letter=' + $espLetter,'exit') | Set-Content -LiteralPath $removeDp -Encoding ASCII
    $removeOut = @(& diskpart.exe /s $removeDp 2>&1 | ForEach-Object { [string]$_ })
    $removeOut | ForEach-Object { Write-Host $_ }
    if ($LASTEXITCODE -ne 0 -or (($removeOut -join [Environment]::NewLine) -notmatch '(?i)(成功地删除|successfully removed)')) {
        Stop-Build 'TEMPORARY_ESP_DRIVE_LETTER_REMOVE_FAILED'
    }
    $checkDisk = Get-Disk -Number $targetDisk.Number -ErrorAction Stop
    $checkParts = @(Get-StoragePartitions ([uint32]$targetDisk.Number))
    if ($checkDisk.PartitionStyle -ne 'GPT' -or $checkParts.Count -ne 1 -or
        ([string]$checkParts[0].GptType).Trim('{}').ToLowerInvariant() -ne $EspGuid -or
        $checkParts[0].Size -lt 15GB -or $checkParts[0].Size -gt 17GB) {
        Stop-Build 'FINAL_USB_PARTITION_LAYOUT_VERIFICATION_FAILED'
    }

    Write-Host ''
    Write-Host 'SEQUOIA_USB_BUILD_SUCCESS' -ForegroundColor Green
    Write-Host "USB_DISK=$($targetDisk.Number); MODEL=$($targetDisk.FriendlyName); SERIAL=$ExpectedSerial"
    Write-Host 'USB_LAYOUT=GPT / one 16GB FAT32 EFI System Partition / remaining space unallocated'
    Write-Host "EFI_FILES_SHA256_VERIFIED=$($efiFiles.Count)"
    Write-Host 'EFI02_MANIFEST_VERIFIED=60_OF_60'
    Write-Host 'APPLE_RECOVERY_CHUNKLIST_VERIFICATION=PASS'
    Write-Host 'EFI_COPY_SHA256=PASS'
    Write-Host 'RECOVERY_COPY_SHA256=PASS'
    Write-Host 'DRIVE_LETTER=REMOVED'
    Write-Host 'DISKPART_CLEAN=NOT_USED'
    Write-Host 'SMBIOS_PLACEHOLDERS_RETAINED=YES'
    Write-Host 'Before macOS installation, inject the target board SMBIOS values into EFI\OC\config.plist.'
}
catch {
    Write-Host ("BUILD_ERROR: " + $_.Exception.Message) -ForegroundColor Red
    if ($_.InvocationInfo) {
        Write-Host ("ERROR_LINE=" + $_.InvocationInfo.ScriptLineNumber) -ForegroundColor Yellow
        Write-Host ("ERROR_COMMAND=" + $_.InvocationInfo.Line.Trim()) -ForegroundColor Yellow
    }
    exit 1
}
finally {
    if ($espLetter -and $espPartition) {
        try {
            $access = $espLetter + ':\'
            Remove-PartitionAccessPath -DiskNumber $targetDisk.Number -PartitionNumber $espPartition.PartitionNumber -AccessPath $access -ErrorAction SilentlyContinue
        } catch {}
    }
    if (Test-Path -LiteralPath $work) {
        Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue
    }
}

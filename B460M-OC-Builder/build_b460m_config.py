#!/usr/bin/env python3
"""Build a B460M-PLUS OpenCore 1.0.8 staging config from the official Sample.plist.
The supplied UTBMap is included, but physical USB and full hardware validation remain outstanding.
"""
import plistlib
import sys
from pathlib import Path

if len(sys.argv) != 4:
    raise SystemExit("usage: build_b460m_config.py SAMPLE.plist OUTPUT.plist EFI_OC_DIR")

sample = Path(sys.argv[1])
output = Path(sys.argv[2])
oc_dir = Path(sys.argv[3])
with sample.open("rb") as f:
    cfg = plistlib.load(f)

def need(mapping, key):
    if key not in mapping:
        raise SystemExit(f"Missing expected Sample.plist key: {key}")
    return mapping[key]

# TEMPORARY TEST IDENTITY requested for first hardware bring-up.
# Replace locally with a fresh matching GenSMBIOS set after initial boot testing.
# These values are test-only and must not be treated as a permanent identity.
generic = need(need(cfg, "PlatformInfo"), "Generic")
generic.update({
    "AdviseFeatures": True,
    "MaxBIOSVersion": False,
    "MLB": "C02231609GUPHC1JC",
    "ProcessorType": 0,
    "ROM": bytes.fromhex("3c7c3fd77ee8"),
    "SpoofVendor": True,
    "SystemMemoryStatus": "Auto",
    "SystemProductName": "iMac20,1",
    "SystemSerialNumber": "C02J5NYBPN5T",
    "SystemUUID": "78BDA777-E7DE-493E-BB3C-DE76B4D3AEE6",
})
need(cfg, "PlatformInfo").update({
    "Automatic": True,
    "CustomMemory": False,
    "UpdateDataHub": True,
    "UpdateNVRAM": True,
    "UpdateSMBIOS": True,
    "UpdateSMBIOSMode": "Create",
})

# ACPI: PLUG, desktop EC/USBX, and AWAC. USBToolBox handles the broken 400-series RHUB path.
acpi = need(cfg, "ACPI")
acpi["Add"] = [
    {"Comment": "CPU power management; Dortania PLUG", "Enabled": True, "Path": "SSDT-PLUG-DRTNIA.aml"},
    {"Comment": "Desktop EC and USB power", "Enabled": True, "Path": "SSDT-EC-USBX-DESKTOP.aml"},
    {"Comment": "AWAC/RTC Darwin selection", "Enabled": True, "Path": "SSDT-AWAC.aml"},
]
acpi["Delete"] = []
acpi["Patch"] = []
need(acpi, "Quirks").update({
    "FadtEnableReset": False,
    "NormalizeHeaders": False,
    "RebaseRegions": False,
    "ResetHwSig": False,
    "ResetLogoStatus": False,
    "SyncTableIds": False,
})

# Kernel extensions. Bundle identifiers and executable paths are verified against their Info.plists.
kexts = [
    ("Lilu.kext", "as.vit9696.Lilu", "Contents/MacOS/Lilu"),
    ("VirtualSMC.kext", "as.vit9696.VirtualSMC", "Contents/MacOS/VirtualSMC"),
    ("WhateverGreen.kext", "as.vit9696.WhateverGreen", "Contents/MacOS/WhateverGreen"),
    ("AppleALC.kext", "as.vit9696.AppleALC", "Contents/MacOS/AppleALC"),
    ("IntelMausi.kext", "as.acidanthera.mieze.IntelMausi", "Contents/MacOS/IntelMausi"),
    ("NVMeFix.kext", "org.acidanthera.NVMeFix", "Contents/MacOS/NVMeFix"),
    ("USBToolBox.kext", "com.dhinakg.USBToolBox.kext", "Contents/MacOS/USBToolBox"),
    ("UTBMap.kext", "com.dhinakg.USBToolBox.map", None),
]
kernel = need(cfg, "Kernel")
kernel["Add"] = []
for folder, bundle_id, executable in kexts:
    bundle = oc_dir / "Kexts" / folder
    info = bundle / "Contents" / "Info.plist"
    if not info.is_file():
        raise SystemExit(f"Missing kext Info.plist: {info}")
    with info.open("rb") as f:
        actual = plistlib.load(f)
    if actual.get("CFBundleIdentifier") != bundle_id:
        raise SystemExit(f"Bundle ID mismatch for {folder}: {actual.get('CFBundleIdentifier')}")
    if executable is not None:
        exe = bundle / executable
        if not exe.is_file():
            raise SystemExit(f"Missing kext executable: {exe}")
    elif folder != "UTBMap.kext":
        raise SystemExit(f"Unexpected codeless kext without an executable: {folder}")
    kernel["Add"].append({
        "Arch": "x86_64",
        "BundlePath": folder,
        "Comment": folder,
        "Enabled": True,
        "ExecutablePath": executable or "",
        "MaxKernel": "",
        "MinKernel": "",
        "PlistPath": "Contents/Info.plist",
    })
need(kernel, "Quirks").update({
    "AppleCpuPmCfgLock": False,
    "AppleXcpmCfgLock": True,
    "DisableIoMapper": False,
    "DisableLinkeditJettison": True,
    "PanicNoKextDump": False,
    "PowerTimeoutKernelPanic": True,
    "SetApfsTrimTimeout": 0,
    "XhciPortLimit": False,
})

# Intel UHD 630 is headless; RX 570 remains the display GPU.
dp = need(cfg, "DeviceProperties")
dp["Add"] = {
    # Exact-model ASUS TUF GAMING B460M-PLUS community EFI reports working ALC S1200A audio with layout 1.
    "PciRoot(0x0)/Pci(0x1F,0x3)": {
        "layout-id": bytes.fromhex("01000000"),
    },
    "PciRoot(0x0)/Pci(0x2,0x0)": {
        "AAPL,ig-platform-id": bytes.fromhex("0300C89B"),
    }
}
dp["Delete"] = {}

# Conservative Booter baseline for modern UEFI; no MMIO map guesswork.
need(cfg, "Booter")["Quirks"].update({
    "AvoidRuntimeDefrag": True,
    "DevirtualiseMmio": True,
    "EnableSafeModeSlide": True,
    "EnableWriteUnprotector": False,
    "ProvideCustomSlide": True,
    "RebuildAppleMemoryMap": True,
    "ResizeAppleGpuBars": -1,
    "SetupVirtualMap": False,
    "SyncRuntimePermissions": True,
    "ProtectUefiServices": True,
})

# NVRAM: verbose diagnostic boot. Leave ALC layout unset until board-level testing.
nvram = need(cfg, "NVRAM")
nvram["Add"].setdefault("7C436110-AB2A-4BBB-A880-FE41995C9F82", {}).update({
    "boot-args": "-v keepsyms=1 debug=0x100",
    "csr-active-config": bytes.fromhex("00000000"),
    "prev-lang:kbd": bytes.fromhex("656e2d55533a30"),
})
nvram["Delete"] = {}
nvram["LegacyOverwrite"] = False
nvram["WriteFlash"] = True

# UEFI drivers.
uefi = need(cfg, "UEFI")
uefi["Drivers"] = [
    {"Arguments": "", "Comment": "OpenCore runtime services", "Enabled": True, "HideVerbose": False, "LoadEarly": False, "Path": "OpenRuntime.efi"},
    {"Arguments": "", "Comment": "HFS filesystem driver", "Enabled": True, "HideVerbose": False, "LoadEarly": False, "Path": "HfsPlus.efi"},
]
for driver in uefi["Drivers"]:
    if not (oc_dir / "Drivers" / driver["Path"]).is_file():
        raise SystemExit(f"Missing UEFI driver: {driver['Path']}")
need(uefi, "Quirks").update({
    "RequestBootVarRouting": True,
    "EnableVectorAcceleration": True,
    "EnableVmx": False,
    "ExitBootServicesDelay": 0,
    "IgnoreInvalidFlexRatio": False,
    "ReleaseUsbOwnership": False,
    "UnblockFsConnect": False,
})

# Boot picker and security defaults suitable for a DEBUG diagnostic candidate.
misc = need(cfg, "Misc")
need(misc, "Boot").update({
    "HideAuxiliary": False,
    "PickerMode": "Builtin",
    "PickerVariant": "Auto",
    "ShowPicker": True,
    # Never auto-launch an internal OS during the initial removable-USB picker test.
    "Timeout": 0,
})
need(misc, "Debug").update({
    "AppleDebug": True,
    "DisplayLevel": 2147483714,
    "ApplePanic": True,
    "DisableWatchDog": True,
    "Target": 67,
})
need(misc, "Security").update({
    "AllowSetDefault": True,
    "AuthRestart": False,
    "BlacklistAppleUpdate": True,
    "DmgLoading": "Signed",
    "EnablePassword": False,
    "ExposeSensitiveData": 6,
    # USB-only scan: 0x00200000 is USB; 0x00080000 is NVMe and remains excluded.
    # Keep APFS/HFS/EFI filesystems enabled and internal SATA/NVMe devices excluded.
    "ScanPolicy": 0x00200703,
    "SecureBootModel": "Default",
    "Vault": "Optional",
})

# Confirm required paths and emit a deterministic XML plist.
for entry in acpi["Add"]:
    if not (oc_dir / "ACPI" / entry["Path"]).is_file():
        raise SystemExit(f"Missing ACPI table: {entry['Path']}")
output.parent.mkdir(parents=True, exist_ok=True)
with output.open("wb") as f:
    plistlib.dump(cfg, f, fmt=plistlib.FMT_XML, sort_keys=True)
print(f"Created staging config: {output}")
print(f"Enabled ACPI tables: {len(acpi['Add'])}; enabled kexts: {len(kernel['Add'])}; enabled UEFI drivers: {len(uefi['Drivers'])}")
print("WARNING: candidate only; USB port mapping and real-hardware testing are incomplete.")

#!/usr/bin/env python3
"""Build a B460M-PLUS OpenCore 1.0.8 configuration candidate from the official Sample.plist.
This creates a staging config only. USB mapping and real-hardware validation remain outstanding.
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

# SMBIOS values supplied by the user for this build.
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

# ACPI: board-specific RHUB SSDT plus the previously inspected desktop tables.
acpi = need(cfg, "ACPI")
acpi["Add"] = [
    {"Comment": "CPU power management; Dortania PLUG", "Enabled": True, "Path": "SSDT-PLUG-DRTNIA.aml"},
    {"Comment": "Desktop EC and USB power", "Enabled": True, "Path": "SSDT-EC-USBX-DESKTOP.aml"},
    {"Comment": "AWAC/RTC Darwin selection", "Enabled": True, "Path": "SSDT-AWAC.aml"},
    {"Comment": "B460M-PLUS RHUB disable for Darwin", "Enabled": True, "Path": "SSDT-RHUB-B460M-PLUS.aml"},
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
    ("IntelMausi.kext", "com.insanelymac.IntelMausi", "Contents/MacOS/IntelMausi"),
    ("NVMeFix.kext", "as.vit9696.NVMeFix", "Contents/MacOS/NVMeFix"),
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
    exe = bundle / executable
    if not exe.is_file():
        raise SystemExit(f"Missing kext executable: {exe}")
    kernel["Add"].append({
        "Arch": "x86_64",
        "BundlePath": folder,
        "Comment": folder,
        "Enabled": True,
        "ExecutablePath": executable,
        "MaxKernel": "",
        "MinKernel": "",
        "PlistPath": "Contents/Info.plist",
    })
need(kernel, "Quirks").update({
    "AppleCpuPmCfgLock": False,
    "AppleXcpmCfgLock": True,
    "DisableIoMapper": False,
    "DisableLinkeditJettison": True,
    "PanicNoKextDump": True,
    "PowerTimeoutKernelPanic": True,
    "SetApfsTrimTimeout": 0,
    "XhciPortLimit": False,
})

# Intel UHD 630 is headless; RX 570 remains the display GPU.
dp = need(cfg, "DeviceProperties")
dp["Add"] = {
    "PciRoot(0x0)/Pci(0x2,0x0)": {
        "AAPL,ig-platform-id": bytes.fromhex("0300C89B"),
    }
}
dp["Delete"] = {}

# Conservative Booter baseline for modern UEFI; no MMIO map guesswork.
need(cfg, "Booter")["Quirks"].update({
    "AvoidRuntimeDefrag": True,
    "DevirtualiseMmio": False,
    "EnableSafeModeSlide": True,
    "EnableWriteUnprotector": False,
    "ProvideCustomSlide": True,
    "RebuildAppleMemoryMap": True,
    "ResizeAppleGpuBars": -1,
    "SetupVirtualMap": True,
    "SyncRuntimePermissions": True,
})

# NVRAM: verbose diagnostic boot and ALC layout 3 as a first-pass candidate.
nvram = need(cfg, "NVRAM")
nvram["Add"].setdefault("7C436110-AB2A-4BBB-A880-FE41995C9F82", {}).update({
    "boot-args": "-v keepsyms=1 debug=0x100 alcid=3",
    "csr-active-config": bytes.fromhex("00000000"),
    "prev-lang:kbd": bytes.fromhex("656e2d55533a30"),
})
nvram["Delete"] = {}
nvram["LegacyEnable"] = False
nvram["LegacyOverwrite"] = False
nvram["WriteFlash"] = True

# UEFI drivers.
uefi = need(cfg, "UEFI")
uefi["Drivers"] = [
    {"Arguments": "", "Comment": "OpenCore runtime services", "Enabled": True, "LoadEarly": False, "Path": "OpenRuntime.efi"},
    {"Arguments": "", "Comment": "HFS filesystem driver", "Enabled": True, "LoadEarly": False, "Path": "HfsPlus.efi"},
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
    "Timeout": 5,
})
need(misc, "Debug").update({
    "AppleDebug": True,
    "ApplePanic": False,
    "DisableWatchDog": False,
    "Target": 67,
})
need(misc, "Security").update({
    "AllowSetDefault": True,
    "AuthRestart": False,
    "BlacklistAppleUpdate": False,
    "DmgLoading": "Signed",
    "EnablePassword": False,
    "ExposeSensitiveData": 6,
    "ScanPolicy": 0,
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

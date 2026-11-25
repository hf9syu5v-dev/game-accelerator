# B460M-PLUS OpenCore config planning report

Date: 2026-11-25
Target: OpenCore 1.0.8 DEBUG / macOS Sequoia 15
Status: planning only; no bootable config.plist is approved.

## 1. Build artifact audit

GitHub Actions run: 45555239626
Commit: 279363f9e6034a166d77cedcbaf366b6f9786014
Artifact: B460M-OpenCore-1.0.8-DEBUG-STAGING-NOT-BOOTABLE
Artifact SHA-256: 30d2647b0aaf2d679e2e8aebdc21f509c62c1e83109612128b146bee199592b

The artifact was downloaded and inspected. It contains OpenCore 1.0.8 DEBUG, BOOTx64.efi, OpenRuntime.efi, HfsPlus.efi, OpenShell.efi, six planned kext bundles, and four ACPI AML tables. The six kext Info.plists report the exact planned versions:
- Lilu 1.7.2
- VirtualSMC 1.3.8
- WhateverGreen 1.7.1
- AppleALC 1.9.8
- IntelMausi 1.0.8
- NVMeFix 1.1.3

RHUB was compiled in the workflow; the resulting AML is 109 bytes and passed ACPI signature, declared-length, and checksum checks. The artifact contains no config.plist and is explicitly marked NOT BOOTABLE.

## 2. Important Sample.plist hazards

The OpenCore 1.0.8 Sample.plist is a schema starting point, not a usable configuration. Its stock PlatformInfo -> Generic section contains example values (including an iMac19,1 product name and example serial/MLB/ROM/UUID fields). These must never be copied into a real EFI. This project will keep SystemSerialNumber, MLB, ROM, and SystemUUID unset until the user explicitly completes SMBIOS generation.

The stock Sample.plist also contains a sample audio layout-id under DeviceProperties. It must not be blindly retained: the motherboard codec/layout and PCI path must be deliberately selected. The actual board codec is Realtek ALC S1200A. A community EFI for the same B460M-PLUS family reports layout-id 3, so alcid=3 is now the best-supported first test candidate; it is not verified on this ES-CPU/RX 570 machine and must be tested with rear/front audio and microphone. Source: https://github.com/nadhirfr/ASUS-TUF-GAMING-B460M-PLUS-WIFI-i5-10400-Hackintosh-Build-Opencore

## 3. Hardware-specific configuration direction

Known platform:
- ASUS TUF GAMING B460M-PLUS, BIOS 1601
- Intel Core i5-10500ES, 6 cores / 12 threads
- CPU-Z family/model/stepping data previously reported as Family 6, Model 5, Extended Model A5, Stepping 0, Revision G0
- Intel's 10th Gen Core datasheet maps Comet Lake-S S6/S4/S2 stepping G0 to CPUID 0x000A0650; this matches the CPU-Z Revision G0 and 6-core/12-thread profile reported for this CPU. Treat 0x000A0650 as a strongly supported identification, but do not add a Kernel -> Emulate override unless a direct CPUID read or boot log demonstrates it is necessary.
- XFX Radeon RX 570 4 GB (Polaris), DisplayPort-connected
- Intel UHD iGPU is enabled in BIOS; DVMT pre-allocation reported as 512 MB
- Intel I219-V Ethernet; Realtek ALC S1200A audio
- No Wi-Fi/Bluetooth card
- Windows boot drive WD SN720 must remain untouched; macOS target drive is HP EX900 Plus 256 GB NVMe

### ACPI Add candidates
Enable these four entries, matching the files in EFI/OC/ACPI:
- SSDT-PLUG-DRTNIA.aml
- SSDT-EC-USBX-DESKTOP.aml
- SSDT-AWAC.aml
- SSDT-RHUB-B460M-PLUS.aml

Do not inject the dumped OEM DSDT or every OEM SSDT. USB port mapping is not complete; RHUB is a first-boot candidate, not proof of a finished USB map.

### Kernel -> Add order
Use the verified bundle paths and executable paths from the staged kexts. Keep Lilu before its dependents. Proposed order:
1. Lilu.kext
2. VirtualSMC.kext
3. WhateverGreen.kext
4. AppleALC.kext
5. IntelMausi.kext
6. NVMeFix.kext

All six entries should be x86_64/Any as appropriate, enabled, with each executable and Info.plist path matching its actual bundle. Do not add Wi-Fi/BT kexts or USB mapping kexts without hardware need and a measured map.

### UEFI -> Drivers
Only enable:
- OpenRuntime.efi
- HfsPlus.efi

OpenShell.efi is a tool, not a UEFI driver entry. Keep it under EFI/OC/Tools and register it only if the final Misc -> Tools plan requires it.

### Booter quirks
The Dortania Comet Lake guidance is the starting point for this 400-series platform. Candidate values:
- DevirtualiseMmio = true
- EnableWriteUnprotector = false
- ProtectUefiServices = true
- RebuildAppleMemoryMap = true
- ResizeAppleGpuBars = -1 unless firmware Resizable BAR is confirmed enabled
- SetupVirtualMap = false (ASUS Comet Lake guidance specifically warns against enabling it)
- SyncRuntimePermissions = true

These are a platform baseline; DEBUG boot logs and firmware behavior still need review.

### Kernel quirks requiring BIOS confirmation
- AppleXcpmCfgLock: enable only if CFG Lock cannot be disabled in BIOS; otherwise false.
- DisableIoMapper: enable only if VT-d remains enabled; otherwise false.
- XhciPortLimit: false for Sequoia; do not rely on the historical port-limit patch.
- Do not force Kernel -> Emulate CPUID until the ES CPU's actual CPUID is measured and its macOS compatibility is established.

### DeviceProperties / graphics
Do not inject I225-V properties: the board has Intel I219-V.
Do not use agdpmod=pikera (RX 570 is Polaris, not Navi).
Do not use -wegnoegpu.
No iGPU framebuffer properties are approved yet. The display is connected to RX 570; the BIOS iGPU is enabled and DVMT is 512 MB. Decide whether the UHD iGPU is to be used headless for Quick Sync before adding any iGPU device properties. Do not copy generic desktop framebuffer values without confirming the device path and intended role.

### Audio
ALC S1200A is the identified codec. Use alcid=3 as the first test candidate because a community EFI for the closely matching ASUS TUF B460M-PLUS Wi-Fi / i5-10400 platform reports layout-id 3. This is evidence for a test, not proof that every board revision and jack configuration behaves identically. Confirm speaker output, microphone input, front-panel detection and sleep/wake audio before treating audio as complete. Do not keep the Sample.plist's unrelated layout-id by accident.

## 4. Required facts before producing the next config candidate

1. BIOS CFG Lock state (disabled/enabled/not exposed).
2. BIOS VT-d state.
3. BIOS Above 4G Decoding and Resizable BAR state (if present).
4. Direct CPUID read is still desirable as a final confirmation, but Intel's datasheet already maps the reported Comet Lake-S G0 stepping to 0x000A0650; do not spoof this value by default.
5. Whether Intel UHD iGPU should provide Quick Sync/headless compute, or remain unused while RX 570 drives the display.
6. Whether user is willing to generate a unique iMac20,1 SMBIOS using GenSMBIOS; serial, MLB, ROM and UUID will not be invented by this project.

## 5. Safety gates before any boot attempt

- Generate a config from the exact OpenCore 1.0.8 Sample.plist and this hardware profile.
- Run the matching OpenCore 1.0.8 ocvalidate against config.plist.
- Verify every ACPI, kext, driver and tool path exists and is referenced exactly once.
- Verify no placeholder/example SMBIOS identifiers remain.
- Keep the Windows WD SN720 untouched; before any disk operation, positively identify the HP EX900 Plus by model and capacity.
- Do not describe the EFI as bootable until validation and real-hardware testing are complete.

## References

- Intel 10th Gen Core processor datasheet, CPUID table (Comet Lake-S S6/S4/S2 G0 = A0650): https://cdrdv2-public.intel.com/615211/615211-008.pdf
- Dortania Desktop Comet Lake configuration guide: https://dortania.github.io/OpenCore-Install-Guide/config.plist/comet-lake.html
- Dortania config.plist setup and file consistency guidance: https://dortania.github.io/OpenCore-Install-Guide/config.plist/

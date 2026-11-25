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

### BIOS facts now confirmed by user
- VT-d: Disabled.
- Above 4G Decoding: Enabled.
- CFG Lock: no visible BIOS menu item was found by the user; actual MSR 0xE2 lock state has not yet been measured.
- Resizable BAR: not confirmed; keep ResizeAppleGpuBars = -1 and do not assume firmware ReBAR is enabled.

Consequent Kernel -> Quirks direction:
- DisableIoMapper = false, because VT-d is disabled in firmware. Do not enable it merely as a generic precaution.
- AppleXcpmCfgLock = true as the provisional first-boot workaround if CFG Lock cannot be disabled; confirm actual MSR 0xE2 state with OpenCore DEBUG log or ControlMsrE2.efi. If the register is already unlocked, set it false.
- AppleCpuPmCfgLock = false; this is not the relevant workaround for this Comet Lake CPU generation.
- XhciPortLimit = false for Sequoia; do not rely on the historical port-limit patch.
- Do not force Kernel -> Emulate CPUID unless a direct CPUID read or boot log demonstrates it is necessary.

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

Above 4G Decoding is confirmed enabled. Do not add an unnecessary npci=0x2000 boot argument by default. ReBAR remains unconfirmed; ResizeAppleGpuBars stays -1.

These are a platform baseline; DEBUG boot logs and firmware behavior still need review.

### DeviceProperties / graphics
Do not inject I225-V properties: the board has Intel I219-V.
Do not use agdpmod=pikera (RX 570 is Polaris, not Navi).
Do not use -wegnoegpu.
User selected the headless Quick Sync design: RX 570 remains the display/output GPU; Intel UHD 630 is intended only for compute/video acceleration. The BIOS iGPU remains enabled, iGPU Multi-Monitor is enabled, and DVMT pre-allocation is 512 MB.

For Comet Lake-S desktop UHD 630, the Dortania Comet Lake guide identifies the headless platform-id as Data `0300C89B` (framebuffer `0x9BC80003`); the official WhateverGreen framebuffer table lists `0x9BC80003` as a desktop framebuffer with zero connectors and 1 MB stolen memory. Candidate DeviceProperties path is `PciRoot(0x0)/Pci(0x2,0x0)`, subject to confirming the actual IGPU PCI device in this machine.

Initial candidate: inject only `AAPL,ig-platform-id` = Data `0300C89B`. Do not add connector patches, `framebuffer-patch-enable`, `framebuffer-stolenmem`, or a fake `device-id` for a headless framebuffer. Confirmed from the user's Windows Device Manager Hardware Id: `PCI\\VEN_8086&DEV_9BC8&SUBSYS_86941043&REV_00`. `VEN_8086&DEV_9BC8` confirms the Intel Comet Lake UHD 630 PCI device; ASUS subsystem `SUBSYS_86941043` is recorded. No `device-id` spoofing or override is needed. The candidate headless `AAPL,ig-platform-id` remains Data `0300C89B`.

### Audio
ALC S1200A is the identified codec. Use alcid=3 as the first test candidate because a community EFI for the closely matching ASUS TUF B460M-PLUS Wi-Fi / i5-10400 platform reports layout-id 3. This is evidence for a test, not proof that every board revision and jack configuration behaves identically. Confirm speaker output, microphone input, front-panel detection and sleep/wake audio before treating audio as complete. Do not keep the Sample.plist's unrelated layout-id by accident.

## 4. Remaining decisions before producing a real config candidate

1. Direct CFG Lock state is still desirable but is no longer a blocker: use the provisional AppleXcpmCfgLock workaround for a first-boot candidate, then verify from DEBUG log.
2. Direct CPUID read is still desirable as a final confirmation, but Intel's datasheet already maps the reported Comet Lake-S G0 stepping to 0x000A0650; do not spoof this value by default.
3. iGPU PCI Hardware Id is confirmed: `PCI\\VEN_8086&DEV_9BC8&SUBSYS_86941043&REV_00`; no device-id spoofing planned.
4. User approved iMac20,1 SMBIOS. A generated identifier set was accidentally committed to the public repository root and subsequently deleted from the current branch. Treat that entire set as compromised: do not reuse it. The old contents may remain retrievable from Git history until history is rewritten. Generate a fresh set locally on the target B460M PC; derive ROM from that board's Intel I219-V MAC. Never commit the local output. `.gitignore` now excludes `B460M-SMBIOS-Values-LOCAL.txt`.

## 5. Safety gates before any boot attempt

- Generate a config from the exact OpenCore 1.0.8 Sample.plist and this hardware profile.
- Run the matching OpenCore 1.0.8 ocvalidate against config.plist.
- Verify every ACPI, kext, driver and tool path exists and is referenced exactly once.
- Verify no placeholder/example SMBIOS identifiers remain. Use only a newly generated, uncompromised iMac20,1 set supplied locally; never commit the generated identifier file. The previous set was exposed in a public commit and must not be reused.
- Keep the Windows WD SN720 untouched; before any disk operation, positively identify the HP EX900 Plus by model and capacity.
- Do not describe the EFI as bootable until validation and real-hardware testing are complete.

## References

- Intel 10th Gen Core processor datasheet, CPUID table (Comet Lake-S S6/S4/S2 G0 = A0650): https://cdrdv2-public.intel.com/615211/615211-008.pdf
- Dortania Desktop Comet Lake configuration guide (headless iGPU platform-id `0300C89B`): https://dortania.github.io/OpenCore-Install-Guide/config.plist/comet-lake.html
- WhateverGreen official Intel framebuffer FAQ (Comet Lake `0x9BC80003` desktop, zero connectors): https://github.com/acidanthera/WhateverGreen/blob/master/Manual/FAQ.IntelHD.en.md
- Dortania config.plist setup and file consistency guidance: https://dortania.github.io/OpenCore-Install-Guide/config.plist/

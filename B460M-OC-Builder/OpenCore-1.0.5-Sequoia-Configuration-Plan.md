# B460M-PLUS — OpenCore 1.0.5 / Sequoia 15 build plan

Date: 2026-11-26
Branch: `opencore-1.0.5-sequoia-rx570`
Target: ASUS TUF GAMING B460M-PLUS (non-Wi-Fi), i5-10500ES, XFX RX 570 4 GB, macOS Sequoia 15
Status: engineering plan; not a bootable EFI and not hardware-tested.

## 1. Version baseline

Use the official Acidanthera OpenCorePkg **1.0.5 DEBUG** release as the version baseline because the closest known same-board/same-CPU Tahoe 26 Beta case reports OpenCore 1.0.5. Obtain every OpenCore binary, `Sample.plist`, and `ocvalidate` from that same release archive. Do not mix OpenCore binaries or validation tools from 1.0.8/1.0.9 with the 1.0.5 configuration schema.

OpenCore 1.0.5 release notes explicitly mention fixing kext injection compatibility with macOS 26; this is a release-history fact, not a claim that 1.0.5 is required for Sequoia. Sequoia 15 remains the target OS.

Official release: https://github.com/acidanthera/OpenCorePkg/releases/tag/1.0.5

## 2. Hardware facts carried forward

- ASUS TUF GAMING B460M-PLUS, non-Wi-Fi, BIOS 1601.
- Intel Core i5-10500ES, Comet Lake-S G0, reported 6C/12T; CPUID 0x000A0650 remains a candidate derived from the CPU identification, not a direct raw capture.
- XFX Radeon RX 570 4 GB, Polaris/Ellesmere, PCI device 1002:67DF; DisplayPort display output.
- Intel UHD 630, device ID 9BC8, intended headless compute/Quick Sync only.
- Intel I219-V Ethernet; Realtek ALC S1200A audio (codec ID 0x0B00).
- VT-d disabled, Above 4G enabled, CSM disabled, Fast Boot disabled, XHCI Hand-off enabled, SATA AHCI, DVMT 512 MB, iGPU Multi-Monitor enabled.
- CFG Lock menu was not found; actual MSR 0xE2 state remains unmeasured.
- Secure Boot keys are installed and MUST NOT be deleted or changed.

## 3. Configuration rules

1. Start from the **1.0.5 release's own Sample.plist**, then populate all schema keys; do not prune required sections.
2. Run only the **1.0.5 ocvalidate** against the resulting config.
3. Never copy another author's SMBIOS serial, MLB, ROM or UUID. Generate a fresh independent set for this machine.
4. Do not add speculative CPUID emulation. Do not assume the ES CPU needs spoofing.
5. RX 570 is Polaris: keep WhateverGreen; do not add Navi-only `agdpmod=pikera`; do not disable the RX 570.
6. Do not add I225-V properties: this board uses Intel I219-V.
7. No `-wegnoegpu`. Keep UHD 630 headless only if the iGPU device path and framebuffer are validated.
8. Keep the internal Windows disk, E: macOS test volume, F: EFI volume, Recovery files and all existing EFI backups untouched during construction.

## 4. ACPI baseline from the actual board dump

The project's decompiled DSDT/SSDT analysis identifies:
- CPU path `\\_SB.PR00` → use the Dortania Comet Lake PLUG SSDT.
- Hidden OEM EC `\\_SB.PCI0.LPCB.H_EC` with existing _STA → use desktop EC-USBX pattern; do not rename or delete OEM H_EC.
- AWAC and legacy RTC are both present; the Dortania AWAC SSDT sets GNVS STAS to select legacy RTC.
- XHC is `\\_SB.PCI0.XHC`; OEM RHUB exists.

Initial ACPI set:
- `SSDT-PLUG-DRTNIA.aml`
- `SSDT-EC-USBX-DESKTOP.aml`
- `SSDT-AWAC.aml`

USB decision: do not inject `SSDT-RHUB` at the same time as USBToolBox, because the USBToolBox project documents that its 400-series RHUB workaround replaces that path. Use USBToolBox + the project's supplied UTBMap only after validating the map's provenance and port coverage. If the map cannot be verified, keep USB mapping as an explicit unresolved gate rather than pretending it is correct.

Do not inject raw DSDT or OEM SSDTs.

## 5. Comet Lake config decisions to encode and validate

Use Dortania's Comet Lake desktop guide as the platform baseline, then check each key against OpenCore 1.0.5's Sample.plist/Configuration.pdf:

- Booter: `SetupVirtualMap = false` (Dortania specifically warns ASUS Comet Lake boards will not boot with it enabled); `ResizeAppleGpuBars = -1` unless firmware Re-Size BAR is positively confirmed enabled; `EnableWriteUnprotector = false`; use the guide's matching MMIO/runtime settings as a baseline, not as unquestioned truth.
- Kernel: `DisableIoMapper = false` because VT-d is disabled in BIOS; `XhciPortLimit = false` for Sequoia; provisionally `AppleXcpmCfgLock = true` only because CFG Lock could not be found, then verify actual MSR state/log. `AppleCpuPmCfgLock = false`. Do not force CPUID emulation.
- DeviceProperties: audio layout must be explicitly researched for ALC S1200A; no blind carry-over of generic layout IDs. UHD 630 headless property candidate is Data `0300C89B`, only after confirming the PCI path.
- UEFI Drivers: `OpenRuntime.efi` and `HfsPlus.efi` only for the first build.
- Kernel kext order: Lilu before dependent kexts; then VirtualSMC, WhateverGreen, AppleALC, IntelMausi, NVMeFix as justified. No Wi-Fi/BT kexts.

## 6. Build gates

A build is not approved until all are true:
1. Official OpenCore 1.0.5 DEBUG archive downloaded and SHA-256 recorded.
2. Sample.plist is from that same archive.
3. ACPI AMLs are compiled from identified source and checked by ACPICA.
4. Kext binaries, Bundle IDs, versions, architectures and dependencies are verified.
5. Config parses and passes matching 1.0.5 `ocvalidate`.
6. Every enabled config entry has a matching file and every file is accounted for.
7. Artifact is clearly labelled STAGING until a separate removable-USB hardware test is performed.

No script in this branch may write to a physical EFI partition. Deployment requires a separate explicit step and must preserve the existing F: backups.
 
## Official references

- OpenCore 1.0.5 release: https://github.com/acidanthera/OpenCorePkg/releases/tag/1.0.5
- Dortania Comet Lake guide: https://dortania.github.io/OpenCore-Install-Guide/config.plist/comet-lake.html
- Dortania config setup: https://dortania.github.io/OpenCore-Install-Guide/config.plist/
- USBToolBox: https://github.com/USBToolBox/kext


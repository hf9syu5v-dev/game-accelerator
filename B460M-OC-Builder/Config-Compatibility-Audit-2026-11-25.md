# B460M-PLUS OpenCore configuration compatibility audit

Date: 2026-11-25
Target: ASUS TUF GAMING B460M-PLUS / Intel Core i5-10500ES / macOS Sequoia 15
OpenCore candidate: 1.0.8 DEBUG
Status: staging only; not approved to boot

## 1. CPU and SMBIOS

- The target is a Comet Lake desktop CPU, reported as an i5-10500ES, 6 cores / 12 threads.
- CPU-Z evidence records Family 6, Model 5, Extended Model A5, Stepping 0, Revision G0. CPUID 0x000A0650 is a derived candidate, not yet a direct raw CPUID capture.
- Dortania's Comet Lake guide explicitly recommends iMac20,1 for i7-10700K and lower (8 cores and lower), and iMac20,2 for 10-core i9-10850K and higher. iMac20,1 is therefore the appropriate initial SMBIOS class for this 6-core CPU.
- Do not add Kernel -> Emulate -> Cpuid1Data/Cpuid1Mask until a real boot log demonstrates that the ES CPU requires emulation. Avoid speculative CPUID spoofing.

## 2. Kernel quirks

| Quirk | Current value | Audit result |
|---|---:|---|
| AppleXcpmCfgLock | True | Correct fallback because CFG Lock was not found in BIOS; Dortania says enable this when the option cannot be found/disabled |
| AppleCpuPmCfgLock | False | Correct for Comet Lake; this legacy quirk is for Ivy Bridge and older |
| DisableIoMapper | False | Appropriate because VT-d is disabled in BIOS |
| XhciPortLimit | False | Correct for modern macOS; do not enable the old port-limit patch |
| PanicNoKextDump | True | Matches Dortania's Comet Lake baseline |
| PowerTimeoutKernelPanic | True | Matches Dortania's Comet Lake baseline |

## 3. Booter quirks

The current values match Dortania's Comet Lake desktop baseline: AvoidRuntimeDefrag=True, DevirtualiseMmio=True, EnableSafeModeSlide=True, EnableWriteUnprotector=False, ProvideCustomSlide=True, RebuildAppleMemoryMap=True, ResizeAppleGpuBars=-1, SetupVirtualMap=False, SyncRuntimePermissions=True, ProtectUefiServices=True.

In particular, SetupVirtualMap must remain False on this ASUS Comet Lake platform; Dortania notes ASUS boards will not boot with it enabled. Keep ResizeAppleGpuBars=-1 unless firmware Re-Size BAR support is explicitly enabled and a reason to set it to 0 is established.

## 4. Graphics

- The repository BIOS screenshot confirms Primary Display=Auto, iGPU Multi-Monitor=Enabled, DVMT Pre-Allocated=512M and RC6=Enabled.
- The Windows Device Manager screenshot shows both Intel UHD Graphics 630 and Radeon RX 570 Series.
- The iGPU property 0300C89B is the Comet Lake desktop headless platform ID for compute-only use when the discrete GPU drives the display. No framebuffer stolen-memory patch is needed for this headless use case.
- RX 570 is a Polaris/Ellesmere card; Dortania's GPU guide lists Polaris 10/20 as supported through Sequoia. Do not add Navi-only agdpmod=pikera. Keep WhateverGreen and do not disable the RX 570.

## 5. USB / ACPI interaction

- USBToolBox 1.2.0 documentation explicitly states it can ignore broken ACPI port definitions on 400-series Intel boards and replaces SSDT-RHUB.
- The selected staging set uses USBToolBox.kext + the user's UTBMap.kext, so SSDT-RHUB is intentionally not injected at the same time.
- This does not prove that the supplied 11-port map matches every physical socket. Physical mapping, USB 2/3 companion behavior, sleep/wake and installer access still require testing on the actual motherboard.
- The board-specific SSDT-RHUB DSL is retained as a fallback if USBToolBox's RHUB bypass is later found ineffective or USBToolBox is removed.

## 6. Audio

- Codec is reported as Realtek ALC S1200A (CodecID 0x0B00); AppleALC supports ALCS1200A and several layout IDs.
- No layout ID or alcid boot argument is currently injected. This is intentional: a supported codec layout is not necessarily the correct jack map for this ASUS board.
- Select and test an ASUS-specific layout after the first successful boot; do not treat generic layout 1 or another B460 board's layout as verified for this motherboard.

## 7. Validation already passed

For Run 45572403055:
- OpenCore 1.0.8 matching ocvalidate: No issues found.
- config.plist parsed successfully.
- 8 kext entries; USBToolBox precedes UTBMap.
- Original UTBMap Info.plist extracted from the supplied RAR and staged with matching SHA-256.
- 3 ACPI tables enabled: PLUG, EC-USBX, AWAC.
- 2 UEFI drivers enabled: OpenRuntime and HfsPlus.
- Artifact ZIP integrity passed.

## 8. Remaining gates before a bootable EFI can be approved

1. Read-only BIOS preflight: confirm Secure Boot, CSM, Fast Boot, VT-x, Hyper-Threading, XD, XHCI Hand-off and other applicable options. Do not change SATA/RST/AHCI mode until Windows storage compatibility is understood.
2. Directly confirm ES CPU CPUID and actual active logical processor count from Windows/hardware diagnostics.
3. Verify that the supplied UTBMap was generated for this exact motherboard/controller and physically test all mapped USB ports.
4. First boot test with a separate removable USB EFI only; do not write the internal EFI partition.
5. Validate RX 570 acceleration, UHD 630 compute functions, Ethernet, NVMe, audio and sleep/wake.
6. Only after successful testing, prepare a clearly marked bootable candidate. No disk install or partition changes are part of this stage.

## Official references

- Comet Lake desktop config / SMBIOS / quirks / BIOS: https://dortania.github.io/OpenCore-Install-Guide/config.plist/comet-lake.html
- SMBIOS selection: https://dortania.github.io/OpenCore-Install-Guide/extras/smbios-support.html
- Intel and AMD GPU compatibility: https://dortania.github.io/GPU-Buyers-Guide/
- USBToolBox RHUB bypass documentation: https://github.com/USBToolBox/kext
- AppleALC supported codecs: https://github.com/acidanthera/AppleALC/wiki/Supported-codecs

This is a configuration compatibility review, not a hardware boot test. The artifact remains STAGING ONLY — NOT BOOTABLE.

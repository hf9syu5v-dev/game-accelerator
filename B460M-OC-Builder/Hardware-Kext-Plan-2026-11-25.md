# B460M-PLUS Hardware and Kext Plan
Date: 2026-11-25
Target OS: macOS Sequoia 15
OpenCore target: 1.0.8 DEBUG for initial diagnostics
Board: ASUS TUF GAMING B460M-PLUS, BIOS 1601 (user chose not to update)

## 1. Confirmed target hardware

| Component | Confirmed detail | Configuration implication |
|---|---|---|
| Motherboard | ASUS TUF GAMING B460M-PLUS | Intel 400-series / Comet Lake desktop ACPI |
| BIOS | Version 1601 | Keep current; do not flash during EFI preparation |
| BIOS iGPU settings | Primary Display Auto; iGPU Multi-Monitor Enabled; DVMT Pre-Allocated 512M; RC6 Enabled (from the uploaded ASUS BIOS screenshot) | iGPU is enabled in firmware; do not disable it. Actual iGPU PCI ID and whether macOS needs it for acceleration remain to be verified |
| CPU | Intel Core i5-10500ES, 6 cores / 12 threads | Comet Lake family target; do not infer CPU identity from DSDT's 20 Processor objects |
| CPU-Z | Family 6, Model 5, Extended Model A5, Stepping 0, Revision G0 | CPUID 0x000A0650 is a derived candidate, not a direct CPUID dump; no forced spoof until boot evidence |
| GPU | XFX Radeon RX 570 4GB, Ellesmere / Polaris | Use native macOS AMD Polaris support plus WhateverGreen; monitor connected to RX 570 DisplayPort |
| GPU PCI ID | 1002:67DF; subvendor 1682:C570 | Do not apply Navi-only `agdpmod=pikera` |
| VRAM | Micron GDDR5, 4 GB, 256-bit, 2048 shaders | No framebuffer patch anticipated for discrete Polaris card |
| RAM | 32 GB DDR4-2666 dual-channel | No memory patch planned |
| Install target | HP EX900 Plus 256GB NVMe | NVMeFix is appropriate to include |
| Separate Windows disk | WD SN720 | Leave untouched; do not erase or repartition |
| Ethernet | Intel I219-V | IntelMausi |
| Wi-Fi / Bluetooth | No separate Wi-Fi or Bluetooth card | Do not add AirportItlwm, itlwm, IntelBluetoothFirmware, BlueToolFixup or Brcm kexts |
| Audio | Realtek ALC S1200A | AppleALC; codec is present in AppleALC as ALCS1200A, CodecID 0x0B00 |

## 2. Release versions checked

Latest release metadata was checked against the official Acidanthera GitHub release endpoints on 2026-11-25. These are the versions selected for the initial staging set, not a claim that the target machine has boot-tested them.

| Component | Version | Role | Official release |
|---|---:|---|---|
| OpenCorePkg | 1.0.8 | Bootloader; DEBUG package for first boot | https://github.com/acidanthera/OpenCorePkg/releases/tag/1.0.8 |
| Lilu | 1.7.2 | Kext patching framework; dependency | https://github.com/acidanthera/Lilu/releases/tag/1.7.2 |
| VirtualSMC | 1.3.8 | SMC emulation | https://github.com/acidanthera/VirtualSMC/releases/tag/1.3.8 |
| WhateverGreen | 1.7.1 | AMD/iGPU graphics compatibility | https://github.com/acidanthera/WhateverGreen/releases/tag/1.7.1 |
| AppleALC | 1.9.8 | Realtek audio | https://github.com/acidanthera/AppleALC/releases/tag/1.9.8 |
| IntelMausi | 1.0.8 | Intel I219-V Ethernet | https://github.com/acidanthera/IntelMausi/releases/tag/1.0.8 |
| NVMeFix | 1.1.3 | NVMe power management / compatibility | https://github.com/acidanthera/NVMeFix/releases/tag/1.1.3 |

## 3. Initial Kext set and load order

Use RELEASE builds for the initial boot unless a diagnostic explicitly requires DEBUG. Keep this order in Kernel -> Add:

1. Lilu.kext
2. VirtualSMC.kext
3. WhateverGreen.kext
4. AppleALC.kext
5. IntelMausi.kext
6. NVMeFix.kext

VirtualSMC plugins:
- SMCProcessor.kext: optional CPU sensor monitoring; may be added after the base boot is stable.
- SMCSuperIO.kext: optional motherboard fan/sensor monitoring; defer until the Super I/O chip is identified and sensor behavior is checked.

Do not add unrelated kexts just to make the folder look complete. The current staging design uses USBToolBox.kext + the supplied UTBMap.kext from the first boot candidate. USBToolBox's official documentation states that it can ignore broken ACPI port definitions on 400-series Intel boards and replaces SSDT-RHUB. This is the selected alternative to injecting the board-specific SSDT-RHUB; do not enable both without a controlled test. The supplied map still requires physical port-by-port verification.

## 4. Audio decision

AppleALC's official `Resources/ALCS1200A/Info.plist` identifies codec ID 2816 (hex 0x0B00) and provides layout IDs including 1, 2, 3, 7, 11, 12, 23, 31, 49, 50, 51, 52 and 69.

Some layouts are board-specific (for example, layout 23 is documented for MSI B460I Gaming Edge WIFI; layout 50 is for Gigabyte B460M Aorus Pro). They must not be copied to this ASUS board by chipset similarity alone.

Initial diagnostic choice: try `alcid=1` only as a provisional first test because it is the generic ALCS1200A 5/6-port map. If audio does not work or ports are mismatched, test other supported layouts after boot and record jack behavior. This is not yet a confirmed ASUS B460M-PLUS layout.

## 5. Graphics decision

RX 570 is Ellesmere / Polaris and is natively supported by macOS AMD drivers. Keep WhateverGreen installed. Do not use Navi-specific `agdpmod=pikera`. Do not inject guessed framebuffer connectors or device properties before checking IORegistry / actual display output behavior.

The display is connected to the RX 570 DisplayPort. Keep the discrete card as the primary display device for initial boot. Do not disable the RX 570 with `-wegnoegpu`.

## 6. OpenCore configuration decisions (staging only)

- SMBIOS candidate: `iMac20,1` (Comet Lake desktop, 6-core class). This is a candidate pending validation against the ES CPU's CPUID and macOS boot behavior.
- Do not publish or commit generated SystemSerialNumber, MLB, SystemUUID or ROM. Generate unique values locally with GenSMBIOS and keep them private.
- Do not force `Kernel -> Emulate -> Cpuid1Data/Mask` yet. CPU-Z-derived CPUID 0x000A0650 is not a direct raw CPUID capture; first test native identity and inspect boot logs.
- Initial boot-args can be diagnostic: `-v keepsyms=1 debug=0x100 alcid=1`. Remove or revise diagnostic flags after a stable boot.
- Do not add `agdpmod=pikera`, `-wegnoegpu`, `npci=0x2000`, `cpus=1`, or other symptom-specific flags without a matching observed problem.
- Use `OpenRuntime.efi` and `HfsPlus.efi` from the matching OpenCore 1.0.8 package. No unrelated drivers at first boot.
- The WD SN720 Windows disk is excluded from all installation/partitioning instructions.

## 7. Firmware screenshot evidence\n\nThe repository screenshot `华硕 B460 核显开启页 02.png` shows: Primary Display = Auto, iGPU Multi-Monitor = Enabled, DVMT Pre-Allocated = 512M, RC6 = Enabled. Preserve these settings during the initial boot attempt. Do not change Primary Display from Auto without a concrete display-initialization problem.\n\n## 8. Deferred until first successful macOS boot

1. USB port mapping using physical port-by-port tests, then create UTBMap.kext.
2. Confirm audio codec detection and select the correct ALCS1200A layout for this ASUS board.
3. Confirm CPU CPUID, power management and sleep/wake behavior; add CPU-specific workarounds only if logs justify them.
4. Verify RX 570 acceleration, DisplayPort output and hardware decoding.
5. Confirm I219-V Ethernet, HP EX900 Plus NVMe behavior and sleep/wake.
6. Run the matching OpenCore 1.0.8 `ocvalidate` against the finished config.plist.

## 9. Current boundary

This is a verified hardware and component plan. It is not a completed EFI. The serial-number fields, exact CPU emulation decision, audio layout, USB map and final config validation remain intentionally unset rather than guessed.

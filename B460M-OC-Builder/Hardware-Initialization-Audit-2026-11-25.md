# B460M-PLUS hardware initialization audit

Date: 2026-11-25
Target: ASUS TUF GAMING B460M-PLUS / i5-10500ES / RX 570 4GB / macOS Sequoia 15
Scope: static review of the config generator and the Run #35 CI-validated staging definition
Status: staging only; no target-machine boot test has occurred

## 1. Evidence boundary

The current artifact is Run 45586016881 (artifact 15007769687), built from commit `6967993d4ff3ac9d9d44abeedbbe45fcc65a96c7`. Its workflow job and every step completed successfully. The artifact is still explicitly named `STAGING-NOT-BOOTABLE`.

The workflow generates config.plist during CI from the OpenCore 1.0.8 Sample.plist. The generated config is not committed as a standalone repository file; this review therefore audits the exact generator and the assertions executed by Run #35, not a locally extracted binary plist.

## 2. Graphics: RX 570 + UHD 630

### RX 570

- Confirmed device: XFX Radeon RX 570 4GB, PCI vendor/device 1002:67DF, subvendor 1682:C570; monitor is connected to the card's DisplayPort.
- Polaris/Ellesmere is in the supported AMD GPU family for Sequoia.
- The generator does not inject guessed AMD framebuffer properties, does not add Navi-only `agdpmod=pikera`, and does not disable the dGPU with `-wegnoegpu`.
- WhateverGreen is enabled and loads after Lilu.
- Decision: keep the RX 570 as the display GPU, with no speculative device-property patch. Acceleration, DisplayPort output, sleep/wake and video decode still require real macOS testing.

### UHD 630

- BIOS evidence: iGPU Multi-Monitor Enabled, DVMT Pre-Allocated 512M, RC6 Enabled; Primary Display remains Auto.
- The generated DeviceProperties section contains one entry only: `PciRoot(0x0)/Pci(0x2,0x0)` with `AAPL,ig-platform-id = 03 00 C8 9B` (Comet Lake desktop headless platform ID).
- No guessed framebuffer connector patches, stolen-memory patches or extra device-id spoof are injected.
- Decision: retain the headless configuration because the RX 570 drives the display. Validate iGPU enumeration and any desired compute/video functions after boot; if it is not needed for the intended workload, reassess rather than adding more properties pre-emptively.

## 3. NVMe: HP EX900 Plus 256GB

- The drive is specified as M.2 2280, PCIe Gen3 x4, NVMe (vendor documentation lists NVMe 1.3/1.4 across product documents).
- NVMeFix is staged at 1.1.3 after Lilu. Its upstream project describes it as a set of patches for Apple's IONVMeFamily driver to improve compatibility with non-Apple NVMe SSDs, including APST/power-state handling and selected timeout workarounds.
- HP's official specifications confirm PCIe Gen3 x4 / NVMe 1.4 but do not name the controller. Two independent reviews specifically of the 256GB EX900 Plus report an InnoGrit IG5216 controller (one identifies the marking IG5216BBA). This is useful model/capacity-level evidence, but not a serial-specific identification of the user's physical unit; manufacturing revisions can vary. Do not confuse the older non-Plus EX900's Silicon Motion SM2263XT controller with the EX900 Plus.
- Decision: retain NVMeFix as a conservative compatibility/power-management component; do not inject guessed SSD PCI properties or force ASPM. Confirm controller identity from read-only Windows hardware information if needed, then validate detection, SMART, sleep/wake and power-state stability after macOS boot.
- Safety: no NVMe write, format, partition, install or internal EFI operation is authorized or included. HP EX900 Plus remains untouched.

## 4. Ethernet: Intel I219-V

- IntelMausi 1.0.8 is staged and enabled.
- Upstream IntelMausi documentation explicitly lists I219V among supported controllers; the Dortania kext guide also lists I219 as supported.
- Decision: no extra device property or alternate Ethernet kext is justified by the current evidence. Link negotiation, DHCP, throughput, wake-on-LAN and sleep/wake remain hardware tests.

## 5. Audio: Realtek ALC S1200A

- Codec ID recorded for the board is 0x0B00 (decimal 2816), identified in AppleALC's codec resources as ALCS1200A.
- AppleALC 1.9.8 is staged and enabled after Lilu.
- AppleALC's current supported-codecs table lists ALCS1200A layout IDs 1, 2, 3, 7, 11, 12, 23, 49, 50, 51, 52 and 69. Some layouts are associated with other manufacturers' boards and cannot be assumed correct for this ASUS board.
- The config generator intentionally does not set `alcid` and does not add an audio layout device property.
- Decision: preserve this conservative state. After first boot, inspect codec detection and test layouts with a documented jack-by-jack matrix. Do not blindly set layout 1 or copy a Gigabyte/MSI layout.

## 6. CPU identity and CPUID

- CPU-Z evidence provided for this processor reports Family 6, Model 5, Extended Model A5, Stepping 0, Revision G0. The signature candidate `0x000A0650` is consistent with those displayed fields.
- A separate Windows WMI report returned ProcessorId `BFEBFBFF000A0650`; its low 32 bits contain the same candidate signature, but WMI's ProcessorId is firmware/OS-reported and should not be described as a raw CPUID instruction dump.
- The system reports 6 cores / 12 logical processors. The 20 ACPI Processor objects in firmware do not represent the installed CPU's active core count.
- The generator leaves `Kernel -> Emulate -> Cpuid1Data/Cpuid1Mask` untouched. No CPUID spoof is currently justified.
- Decision: keep native CPUID and iMac20,1 as the initial 6-core Comet Lake SMBIOS class. If a boot log exposes an actual CPU identity/power-management issue, collect direct CPUID and kernel evidence before changing emulation.

## 7. Configuration review summary

| Area | Current decision | Result |
|---|---|---|
| RX 570 | Native Polaris + WhateverGreen; no guessed properties | Keep |
| UHD 630 | Headless `0300C89B` at iGPU PCI path | Keep |
| NVMe | NVMeFix 1.1.3; no forced ASPM | Keep; controller identity not established |
| Ethernet | IntelMausi 1.0.8 for I219-V | Keep |
| Audio | AppleALC 1.9.8; no layout injected | Keep until board-specific test |
| CPU | Native CPUID; no spoof | Keep |
| SMBIOS | iMac20,1 | Keep as initial candidate |

No config change was made by this audit because the current values are conservative and no evidence justifies adding device properties, audio layout IDs, forced ASPM or CPU spoofing.

## 7A. Exact staged USB port map structure

The independently inspected Run #38 artifact contains this exact map (hardware indices are zero-based as encoded by USBToolBox; the displayed names are HS/SS logical port names):

| Logical port | Hardware index | Connector |
|---|---:|---:|
| HS01–HS04 | 1–4 | USB 3 |
| HS05 | 9 | USB 2 |
| HS06 | 10 | USB 2 |
| HS07 | 11 | Internal (255) |
| SS01–SS04 | 17–20 | USB 3 |

There are 11 entries, 11 unique hardware indices, and `port-count=20`. CI now pins the exact names, indices and connector types so an accidental edit is detected. This is only a structural integrity check: it does not prove which physical rear/front-panel socket corresponds to each entry.

## 8. Remaining hardware gates

1. A separate removable USB drive must be explicitly designated before any USB preparation. No internal disk is to be touched.
2. Initial test must be limited to firmware/OpenCore picker detection using the removable USB; no macOS installer or internal-disk write.
3. After an authorized first boot: validate RX 570 acceleration, UHD 630 enumeration, I219-V networking, EX900 Plus NVMe stability, ALC S1200A layout, USB mapping, CPU identity/power management and sleep/wake.
4. Do not call the EFI bootable until those tests and a final config/artifact audit pass.

## References

- IntelMausi supported devices: https://github.com/acidanthera/IntelMausi
- IntelMausi changelog: https://github.com/acidanthera/IntelMausi/blob/master/Changelog.md
- NVMeFix purpose and configuration: https://github.com/acidanthera/NVMeFix
- HP EX900 Plus official specifications: https://hp.biwintech.com/u_file/photo/20220728/EX900-Plus-Specifications.pdf
- 256GB EX900 Plus controller identification (independent review): https://club.dns-shop.ru/review/t-101-ssd-nakopiteli-2-5/115732-obzor-256-gb-ssd-m-2-nakopitelya-hp-ex900-plus/
- Additional 256GB EX900 Plus review: https://club.dns-shop.ru/review/t-101-ssd-nakopiteli-2-5/84915-obzor-ssd-hp-ex900-plus-256-gb-35m32aa-abb/
- Dortania Ethernet kext guidance: https://dortania.github.io/OpenCore-Install-Guide/ktext.html
- AppleALC supported codecs: https://github.com/acidanthera/AppleALC/wiki/Supported-codecs

This is a static configuration review. It is not a hardware boot test and does not authorize any internal-disk operation.


## 9. Deep-review addendum — reviewed EFI changes and USB-map discrepancy (2026-11-25)

The latest self-review identified and corrected two boot-test safety/diagnostic weaknesses and one board-specific audio omission:

- `Misc -> Boot -> Timeout=0`: picker waits for manual selection; no automatic launch of a detected internal OS.
- `Misc -> Security -> ScanPolicy=0x200703`: initial test scans USB devices and APFS/HFS/EFI filesystems only, excluding SATA/NVMe boot entries. This is a guardrail, not an absolute boundary; firmware device classification can vary. This USB-only profile is not the final internal-NVMe daily-boot profile.
- DEBUG capture: `ApplePanic=True`, `DisableWatchDog=True`, `DisplayLevel=0x80000042`, `Target=67`; panic/log output is expected on the OpenCore boot volume, so initial testing must launch OpenCore from the removable USB.
- ALC S1200A: HDEF `PciRoot(0x0)/Pci(0x1F,0x3)` now receives `layout-id=01000000` (layout 1), based on an exact-model non-Wi-Fi B460M-PLUS community EFI and its codec dump. Physical jack behavior remains untested.

### USB map cross-check

The current supplied UTBMap remains structurally valid (11 entries, unique indices, port-count 20), but a comparison against two public EFI projects for the same B460M-PLUS family exposed material differences:

- Current supplied map: HS01–04 -> indices 1–4, HS05 -> 9, HS06 -> 10, HS07 -> 11 (internal), SS01–04 -> 17–20.
- Exact non-Wi-Fi B460M-PLUS reference map: 10 HS entries (including HS05 index 5, HS07 index 7, HS08 index 8 internal, HS09 index 9, HS10 index 10, HS11 index 11 internal) and SS01–05 (indices 17–21), 15 entries total.
- A B460M-PLUS Wi-Fi reference map has a different set again, including SS02 and SS04–08.

ASUS documents 4 rear USB 3.2 Gen 1 Type-A ports, 2 rear USB 2.0 ports, one internal USB 3.2 Gen 1 header (2 ports), and two USB 2.0 headers (4 ports). The supplied 11-entry map therefore cannot be certified complete from structural checks alone. The community maps are useful comparison evidence, not proof of this machine's physical wiring. The current UTBMap was deliberately not overwritten with a guessed third-party map. Treat physical port-by-port validation as a high-priority hardware gate; until then, some rear/front ports may be missing or incorrectly classified.

References:
- Exact non-Wi-Fi B460M-PLUS reference EFI: https://github.com/Stick-Study/ASUS-TUF-GAMING-B460M-PLUS-HACKINTOSH
- B460M-PLUS Wi-Fi reference EFI: https://github.com/truedaz/OpenCore_ASUS-TUF-Gaming-B460M-Plus_i9-10850K_EFI
- ASUS official B460M-PLUS manual / rear I/O and USB layout: https://dlcdnets.asus.com/pub/ASUS/mb/LGA1200/TUF_GAMING_B460M-PLUS/E17227_TUF_GAMING_B460M-PLUS_UM_V3_WEB.pdf

No USB or internal disk has been written during this review.

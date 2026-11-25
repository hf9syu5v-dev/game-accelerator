# ASUS TUF GAMING B460M-PLUS BIOS preflight checklist

Date: 2026-11-25
Board: ASUS TUF GAMING B460M-PLUS
BIOS: 1601 (user elected to keep this version)
Purpose: read-only preflight before any first-boot attempt with the staging EFI.

**Do not change unknown settings blindly.** In particular, do not change storage-controller mode or boot mode until Windows boot compatibility with the WD SN720 has been considered. This checklist does not authorize BIOS flashing, disk formatting, partitioning, or writing an EFI partition.

## Confirmed from user-provided BIOS screenshots / conversation

| BIOS item | Observed value | Status |
|---|---|---|
| BIOS version | 1601 | Confirmed |
| VT-d | Disabled | Confirmed |
| Above 4G Decoding | Enabled | Confirmed |
| Primary Display | Auto | Confirmed |
| iGPU Multi-Monitor | Enabled | Confirmed |
| DVMT Pre-Allocated | 512M | Confirmed |
| RC6 (Render Standby) | Enabled | Confirmed |
| CFG Lock menu | User could not find the option | Treat as unavailable; config enables AppleXcpmCfgLock=True per Dortania's Comet Lake guidance |

## Read-only checks still needed before a hardware boot

| BIOS item | Dortania Comet Lake recommendation | Current evidence |
|---|---|---|
| Fast Boot | Disabled | Not yet confirmed |
| Secure Boot | Disabled | Not yet confirmed |
| CSM / Compatibility Support Module | Disabled; use UEFI boot | Not yet confirmed |
| VT-x | Enabled | Not yet confirmed |
| Hyper-Threading | Enabled | Not yet confirmed |
| Execute Disable Bit / XD | Enabled | Not yet confirmed |
| XHCI Hand-off | Enabled | Not yet confirmed |
| SATA Controller Mode | AHCI | Not yet confirmed; **do not change until Windows storage configuration is understood** |
| OS Type | Windows 8.1/10 UEFI mode, or firmware-specific equivalent | Not yet confirmed |
| Serial/COM and Parallel ports | Disabled if present | Not yet confirmed |
| Intel SGX / Intel Platform Trust | Disabled if present | Not yet confirmed |
| Thunderbolt | Disabled for initial install if present | Not yet confirmed |
| Re-Size BAR | Keep disabled / do not enable for this initial configuration | Not yet confirmed; current OpenCore ResizeAppleGpuBars=-1 disables OpenCore-side BAR resizing |

## Config decisions tied to confirmed firmware state

- Kernel -> Quirks -> AppleXcpmCfgLock = True: appropriate when CFG Lock cannot be found/disabled, per the Comet Lake guide. If a later BIOS inspection confirms CFG Lock is disabled, this quirk can be set to False.
- Kernel -> Quirks -> DisableIoMapper = False: VT-d is already disabled in firmware, so no VT-d workaround is needed.
- Booter -> Quirks -> DevirtualiseMmio = True, ProtectUefiServices = True, RebuildAppleMemoryMap = True, SetupVirtualMap = False, SyncRuntimePermissions = True, ResizeAppleGpuBars = -1: matches the current Dortania Comet Lake baseline; keep SetupVirtualMap disabled on this ASUS/Comet Lake platform.
- iGPU headless property AAPL,ig-platform-id = 0300C89B is supported by the Comet Lake desktop guide for compute-only iGPU use.

## Important storage / Windows protection boundary

The Windows disk WD SN720 is outside the macOS installation scope. Do not:
- format, repartition, erase, or initialize either physical disk;
- change SATA/RST/AHCI mode without first checking Windows' current storage-driver mode;
- install OpenCore to an internal disk EFI partition during this staging phase;
- run an installer or disk utility against the WD SN720.

The intended macOS target remains the HP EX900 Plus 256GB NVMe, but no write operation to it is authorized by this preflight checklist.

## Official reference

Dortania Desktop Comet Lake configuration and BIOS guidance:
https://dortania.github.io/OpenCore-Install-Guide/config.plist/comet-lake.html

This document is a checklist, not evidence that all BIOS items have been verified. The unknown rows require inspection on the actual BIOS screen before first boot; if an item is absent, record it as absent rather than inventing a value.

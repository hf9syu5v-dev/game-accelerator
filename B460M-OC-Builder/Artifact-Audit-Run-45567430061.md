# EFI Artifact Audit — Run 45567430061 — 2026-11-25

## Build result

- Workflow run: 45567430061
- Commit: e32f469f53536132b6ab972143f42cf1001e415a
- Run attempt: 1
- Job: 139045541697 — completed / success
- All 12 main build steps completed successfully, including matching OpenCore 1.0.8 `ocvalidate`.
- Artifact ID: 14999354893
- Artifact: `B460M-OpenCore-1.0.8-DEBUG-STAGING-NOT-BOOTABLE`
- ZIP size: 4,538,081 bytes
- Artifact SHA-256: `ce3a80a825ebb2dc1dcbcd751d7c983a2f4c11802908f059dc5caaf5e5f5d3a2`

## Independent downloaded-artifact checks

- ZIP integrity test: passed; no corrupt members.
- Extracted payload: 26 files.
- `config.plist`: parsed successfully as XML plist.
- Enabled entries: 4 ACPI tables, 6 kexts, 2 UEFI drivers.
- Every enabled ACPI, kext Info.plist/executable, and UEFI driver path exists.
- All six kext Info.plist bundle identifiers and versions match the builder's expected values:
  - Lilu 1.7.2
  - VirtualSMC 1.3.8
  - WhateverGreen 1.7.1
  - AppleALC 1.9.8
  - IntelMausi 1.0.8
  - NVMeFix 1.1.3
- EFI executables and drivers are PE32+ x86-64.
- Kext binaries contain x86_64 code.
- All eight EFI/ACPI SHA-256 entries in BUILD-MANIFEST.md match the extracted files.
- RHUB AML is present (109 bytes); compile, disassemble, ACPI header length/checksum checks passed in workflow.

## Configuration state confirmed

- SMBIOS model: `iMac20,1`.
- SystemSerialNumber, MLB, ROM, SystemUUID: intentionally blank. The previously exposed values are not reused.
- iGPU property: `AAPL,ig-platform-id = 0300C89B` at `PciRoot(0x0)/Pci(0x2,0x0)`.
- Boot arguments: `-v keepsyms=1 debug=0x100`; no unverified `alcid` is forced.
- Booter Quirks: DevirtualiseMmio=true, SetupVirtualMap=false, ProtectUefiServices=true.
- `ocvalidate` validates the schema; it does not prove these hardware-dependent quirk choices are correct on the actual BIOS/board.

## Existing local SMBIOS helper

`Generate-B460M-SMBIOS-Values.ps1` is present in the repository. It accepts a matching GenSMBIOS iMac20,1 serial/MLB/SmUUID set, derives ROM from the target board's Intel I219-V MAC, and writes a local text file only after explicit confirmation. It does not edit EFI/config/BIOS/disks and warns not to commit the values. Run it on the B460M target PC, not on another computer.

## Still not approved for boot

1. Generate fresh SMBIOS values locally and apply them to a private copy of config.plist; rerun OpenCore 1.0.8 ocvalidate.
2. Confirm CFG Lock state if possible. AppleXcpmCfgLock remains provisional because the BIOS menu did not expose the setting.
3. Confirm the Booter Quirks against actual firmware behavior before boot approval; schema success is not hardware validation.
4. Complete USB port mapping using the actual ports/controllers.
5. Test first boot, RX 570 acceleration, UHD 630 headless behavior, ALC S1200A layout, I219-V Ethernet, NVMe and sleep/wake.

## Safety

Artifact is explicitly marked STAGING ONLY / NOT BOOTABLE. No installer or disk image is included. No physical disk was formatted, repartitioned, or written. WD SN720 remains out of scope.

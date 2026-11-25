# B460M OpenCore Artifact Audit — Run 45568071585

Date: 2026-11-25

## Build identity

- Workflow: Build B460M OpenCore staging EFI
- Run: 45568071585
- Commit: 939298fb066bfc1eeda90d3c4c879a10f5b8506f
- Result: completed / success
- Job: build-staging (139047800782)
- Artifact ID: 15000816206
- Artifact: B460M-OpenCore-1.0.8-DEBUG-STAGING-NOT-BOOTABLE
- Size: 4,538,138 bytes
- SHA-256: 95aee6192f2342f1f866917ac5167bad14f190bb4fe1025c04fa1b4e0924d901
- Expiration: 2026-12-09

## Changes in this build

The config builder now inserts the user's explicitly requested temporary test SMBIOS identity for first hardware bring-up. The workflow asserts that the test Serial, MLB, SmUUID, and ROM are present and match the requested test set. The user intends to replace them locally with a fresh matching set after initial testing.

## Validation

All workflow steps succeeded, including:

1. OpenCore 1.0.8 DEBUG download and SHA-256 verification
2. HfsPlus driver download and SHA-256 verification
3. Six kext releases staged
4. RHUB SSDT compiled, disassembled, and ACPI header/length/checksum validated
5. Four ACPI entries copied
6. Hardware-specific config.plist generated and passed matching OpenCore 1.0.8 ocvalidate
7. Artifact manifest generated and uploaded

Independent post-build audit:

- ZIP integrity passed
- config.plist parsed successfully as XML plist
- Temporary test SMBIOS values are present in PlatformInfo -> Generic
- All enabled ACPI paths exist
- All six enabled kext bundles have Info.plist and executable files
- Both enabled UEFI drivers exist
- BOOTx64.efi and OpenCore.efi exist
- All eight SHA-256 entries in BUILD-MANIFEST.md match the extracted files

## Remaining before hardware boot

- USB port mapping on the actual B460M-PLUS machine is still outstanding
- Review the interaction between the custom SSDT-RHUB and USBToolBox's ACPI/RHUB handling when the final UTBMap is available; USBToolBox documents an ACPI bypass for 400-series Intel boards that can replace SSDT-RHUB
- Confirm CFG Lock behavior; AppleXcpmCfgLock remains provisional
- Perform controlled first boot and record the exact OpenCore/macOS stop point if it fails
- Validate RX 570 display acceleration, UHD 630 headless, ALC S1200A audio, I219-V Ethernet, NVMe, and sleep/wake

## Safety

This artifact remains STAGING ONLY and is explicitly NOT BOOTABLE. USB mapping and real-hardware validation are incomplete. No disk image or physical EFI write is included. No disks were formatted, repartitioned, or modified by this workflow. WD SN720 remains out of scope.

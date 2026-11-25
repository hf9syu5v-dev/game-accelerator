# Artifact Audit — Run 45572403055

Date: 2026-11-25
Commit built: `f65183e5957c8411cea4693801f4e091f7558bc3`
Workflow: https://github.com/hf9syu5v-dev/game-accelerator/actions/runs/45572403055
Artifact ID: `15003605173`
Artifact: `B460M-OpenCore-1.0.8-DEBUG-STAGING-NOT-BOOTABLE`
Artifact SHA-256: `b470ec065e08655c91273616a552aafad6972d1bd38a6a012cd1d8f9f8d66e69`
Size: 4,548,303 bytes
Expires: 2026-12-09

## Original UTBMap archive verification

The workflow installed `unar`, extracted the user's original `UTBMap.kext.rar`, and copied the extracted `UTBMap.kext/Contents/Info.plist` into the EFI staging tree. The workflow log reports identical SHA-256 values for the extracted source and staged plist:

`9c9a3d71f11d31c5ffc7e66c18ebd8dc41f7426e5715151f4d6b8dc811a1c479`

The downloaded artifact was independently opened and its UTBMap plist parsed. It is 3,280 bytes, bundle ID `com.dhinakg.USBToolBox.map`, version 1.1, depends on `com.dhinakg.USBToolBox.kext`, contains 11 map entries (HS01-HS07 and SS01-SS04), and has `port-count=20` (highest hardware index). No executable is present in UTBMap, as expected for this codeless mapping bundle.

## Configuration checks

- ZIP integrity test: passed.
- `config.plist` parsed successfully.
- OpenCore 1.0.8 matching `ocvalidate`: `No issues found`.
- 8 enabled kexts; USBToolBox precedes UTBMap.
- UTBMap `ExecutablePath` is empty.
- 3 enabled ACPI tables: PLUG, EC-USBX, AWAC.
- No separate SSDT-RHUB is injected alongside USBToolBox.
- 2 UEFI drivers: OpenRuntime and HfsPlus.
- USBToolBox 1.2.0 release archive checksum passed.

## Status and remaining validation

**STAGING ONLY — NOT BOOTABLE.** Static plist and packaging checks do not establish physical USB port correctness or successful boot on the target motherboard. Validate every physical USB receptacle, USB 2/3 companion behavior, sleep/wake, and installer access on the ASUS TUF GAMING B460M-PLUS before approving a bootable EFI. No physical EFI partition or disk was written by this workflow.

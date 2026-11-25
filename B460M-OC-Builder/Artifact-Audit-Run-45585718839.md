# Artifact audit — Run 45585718839 (Run #31)

Date: 2026-11-25
Target: ASUS TUF GAMING B460M-PLUS / Intel Core i5-10500ES / macOS Sequoia 15
Workflow run: https://github.com/hf9syu5v-dev/game-accelerator/actions/runs/45585718839
Source commit: 2441e21d746090736efa0a8198e5fe1179aeccd9
Artifact ID: 15008651678
Artifact: B460M-OpenCore-1.0.8-DEBUG-STAGING-NOT-BOOTABLE
Size: 4,548,305 bytes
GitHub artifact SHA-256: 383327c4f8897e6a6b9ce0029fa7cf0ba16982574ddf40383986f659ae01fb51
Artifact expires: 2026-12-09T09:28:45Z

## Result

Run #31 completed successfully. All build steps passed, including:
- OpenCore 1.0.8 DEBUG package checksum and required binaries.
- Pinned HfsPlus driver checksum.
- Official release download and staging for all binary kexts.
- Extraction and structural validation of the original supplied UTBMap.
- New kext metadata and executable architecture validation.
- Three ACPI AML copies.
- Hardware-specific config generation, matching OpenCore 1.0.8 `ocvalidate`, and expanded cross-file assertions.
- Staging manifest, safety notice, and artifact upload.

## New kext validation

The new CI step checks each binary kext's exact bundle identifier and CFBundleVersion, verifies its executable exists, and uses macOS `lipo -verify_arch x86_64` to confirm x86_64 support:
- Lilu 1.7.2
- VirtualSMC 1.3.8
- WhateverGreen 1.7.1
- AppleALC 1.9.8
- IntelMausi 1.0.8
- NVMeFix 1.1.3
- USBToolBox 1.2.0

UTBMap 1.1 is separately checked as a codeless bundle with bundle ID `com.dhinakg.USBToolBox.map` and dependency `com.dhinakg.USBToolBox.kext` version `1.0.0`.

Note: the first attempt at this new validation in Run #30 failed because the `lipo` arguments were ordered incorrectly. The workflow was corrected to call `lipo <binary> -verify_arch x86_64`; Run #31 passed. Run #30's failure was a test-command syntax issue, not evidence of a bad kext binary.

## Configuration and safety

The config retains the already-audited Run #28/29 settings: 8 kexts in the correct order, USBToolBox before codeless UTBMap, PLUG + EC-USBX + AWAC only, no simultaneous RHUB SSDT, OpenRuntime + HfsPlus, required Comet Lake quirks, UHD 630 headless platform-id 0300C89B, temporary SMBIOS test values explicitly approved for initial bring-up, and no speculative ALC layout.

The artifact is **STAGING ONLY — NOT BOOTABLE**. Structural checks and architecture checks do not constitute a successful hardware boot. Physical USB socket mapping, USB2/USB3 companion behavior, RX 570 acceleration, UHD 630 runtime behavior, CPU power management, I219-V, NVMe, ALC S1200A layout, and sleep/wake remain hardware-test gates.

No installer, disk image, internal disk operation, partition change, or physical EFI write is included. WD SN720 and HP EX900 Plus internal disks remain outside the workflow's scope. Any future first-boot test must use a separate removable USB explicitly designated by the user.

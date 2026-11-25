# Artifact audit — Run 45586016881 (Run #35)

Date: 2026-11-25
Target: ASUS TUF GAMING B460M-PLUS / Intel Core i5-10500ES / macOS Sequoia 15
Workflow run: https://github.com/hf9syu5v-dev/game-accelerator/actions/runs/45586016881
Source commit: 6967993d4ff3ac9d9d44abeedbbe45fcc65a96c7
Artifact ID: 15007769687
Artifact name: B460M-OpenCore-1.0.8-DEBUG-STAGING-NOT-BOOTABLE
Artifact size: 4,548,305 bytes
GitHub artifact SHA-256: 0f1dd243fbbc75fcb47a26073dc457a15c455e56726cc8dc5d9bdce342d30d7e
Artifact expires: 2026-12-09T09:30:47Z

## Result

Run #35 completed successfully. Every job step passed, including the newly added ACPICA AML disassembly check.

## Validation performed

1. OpenCore 1.0.8 DEBUG archive checksum and required EFI binaries.
2. Pinned HfsPlus driver checksum.
3. Seven binary kexts staged from official releases; each exact Bundle ID and CFBundleVersion checked, executable presence checked, and x86_64 architecture verified with macOS `lipo`.
4. Original user-supplied UTBMap extracted without reconstructing its plist; source and staged Info.plist SHA-256 both equal `9c9a3d71f11d31c5ffc7e66c18ebd8dc41f7426e5715151f4d6b8dc811a1c479`. Eleven map entries, port-count 20, codeless bundle and USBToolBox dependency metadata passed.
5. The three enabled AML tables (PLUG, EC-USBX-DESKTOP, AWAC) copied to staging and each successfully disassembled by ACPICA `iasl -d` in an isolated temporary directory. The parser produced a non-empty ASL DefinitionBlock for each file.
6. Hardware-specific config generated; matching OpenCore 1.0.8 `ocvalidate` reported no issues; expanded cross-file assertions passed for kext order, enabled flags, paths, ACPI files, UEFI drivers, quirks, boot arguments and UHD 630 platform ID.
7. Staging manifest and DO-NOT-BOOT notice produced; artifact uploaded.

## Script correction history

Run #32/#33 exposed an ACPICA validation-script output-path assumption: `iasl -d` writes its DSL output alongside the AML input. The validation step was corrected to copy each AML into an isolated temporary workspace before disassembly. Run #35 confirms that the corrected procedure succeeds for all three AML tables. The earlier failures were validation-script issues, not evidence that the source AML was damaged.

## Configuration decision status

- Kext load order remains Lilu, VirtualSMC, WhateverGreen, AppleALC, IntelMausi, NVMeFix, USBToolBox, UTBMap.
- USBToolBox and UTBMap are both enabled; RHUB SSDT remains excluded.
- ACPI/Add remains exactly PLUG, EC-USBX-DESKTOP and AWAC.
- UEFI drivers remain OpenRuntime and HfsPlus.
- UHD 630 headless platform ID remains 0300C89B.
- No audio layout ID is injected; ALC S1200A layout must be tested on the board.
- Temporary test SMBIOS identity remains as explicitly approved for initial bring-up.

## Safety and remaining hardware gates

**STAGING ONLY — NOT BOOTABLE.** CI parser, architecture, metadata and config checks do not prove successful hardware boot. Physical USB socket mapping and USB2/USB3 companion behavior, first boot, RX 570 acceleration, UHD 630 runtime behavior, ES CPU identity/power management, I219-V, NVMe, ALC S1200A layout, and sleep/wake remain unverified on the target machine.

No installer, disk image, partition operation, internal-disk write, or physical EFI write is included. WD SN720 and HP EX900 Plus remain outside the workflow's write scope. Any future first-boot test must use a separately designated removable USB drive.

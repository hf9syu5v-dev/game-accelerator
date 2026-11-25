# Artifact audit — Run 45585127841

Date: 2026-11-25
Target: ASUS TUF GAMING B460M-PLUS / Intel Core i5-10500ES / macOS Sequoia 15
Workflow: Build B460M OpenCore staging EFI
Run: https://github.com/hf9syu5v-dev/game-accelerator/actions/runs/45585127841
Source commit: 47ccc81a2334535216bf52836f7db4e3092b28b6
Artifact ID: 15007324314
Artifact name: B460M-OpenCore-1.0.8-DEBUG-STAGING-NOT-BOOTABLE
Artifact size: 4,548,305 bytes
GitHub artifact SHA-256: 3b2697ce520f9f8fc09121bc2ed416c141456d622261d30f286d46ceecb980f1
Artifact expires: 2026-12-09T09:25:00Z

## Build result

GitHub Actions Run 28 completed successfully. The following workflow steps passed:
- OpenCore 1.0.8 DEBUG archive checksum and required EFI binaries.
- Pinned HfsPlus driver checksum.
- Download and staging of all seven binary kexts.
- Extraction of the original user-supplied UTBMap archive and metadata checks.
- Copy of the three selected ACPI tables.
- Hardware-specific config generation and OpenCore 1.0.8 matching `ocvalidate`.
- Expanded cross-file assertions for kext order, enabled flags, executable paths, ACPI list and file presence, UEFI driver list and file presence, key quirks, verbose boot arguments, and UHD 630 platform ID.
- Staging manifest and safety notice creation; artifact upload.

The job log explicitly reports:
- `UTBMap plist verified: 11 mapped ports; highest hardware index 20`
- `Completed validating build/EFI/OC/config.plist in 1 ms. No issues found.`
- `config.plist parsed and cross-checked against staged files: 34376 bytes`

## Configuration cross-check

- Kext order: Lilu, VirtualSMC, WhateverGreen, AppleALC, IntelMausi, NVMeFix, USBToolBox, UTBMap.
- USBToolBox is enabled with its executable; UTBMap is enabled and codeless, after USBToolBox.
- ACPI/Add is exactly PLUG, EC-USBX-DESKTOP, AWAC; all three corresponding AML files exist in the staged artifact.
- SSDT-RHUB is not injected while USBToolBox 1.2.0 is selected.
- UEFI drivers are OpenRuntime.efi and HfsPlus.efi; both staged files exist and are enabled.
- Kernel quirks include AppleXcpmCfgLock=True, DisableIoMapper=False, XhciPortLimit=False.
- UHD 630 headless platform-id is 0300C89B.
- The temporary test SMBIOS identity remains as explicitly requested for initial bring-up.

## USB / ACPI decision

The existing UTBMap is retained; no new USB map was generated. Its 11 entries and port-count metadata pass structural validation. The map's physical socket assignments and USB 2/3 companion behavior have not been proven by physical plug/unplug testing on this exact board.

The current ACPI set and USBToolBox choice are mutually consistent: do not enable the archived board-specific SSDT-RHUB at the same time as USBToolBox. Keep the RHUB DSL as fallback only.

## Sequoia configuration review

Static configuration review finds no new OpenCore schema or cross-file blocker: the matching validator reports no issues, all configured kext/ACPI/driver paths are staged, and the selected Comet Lake baseline remains consistent with the collected hardware and BIOS facts.

The following require actual machine testing and cannot be certified by CI:
- USB physical port mapping, installer USB access, sleep/wake.
- RX 570 graphics acceleration and UHD 630 headless behavior.
- Intel I219-V Ethernet, HP EX900 Plus NVMe behavior, ALC S1200A audio layout.
- CPU power management and stability with the ES CPU.
- First boot from a separately designated removable USB device.

## Safety status

**STAGING ONLY — NOT BOOTABLE.** This artifact is a CI-validated candidate, not a hardware-validated boot EFI. No installer, disk image, internal-disk operation, partition change, or physical EFI write is included. Do not write to either internal drive (WD SN720 Windows disk or HP EX900 Plus target disk). Any eventual first-boot test must use a removable USB drive explicitly designated by the user.

The generated config is created in the CI artifact, not checked into the repository source tree. The EFI README was corrected to reflect that the artifact contains the temporary test SMBIOS identity approved for initial bring-up; the user plans to replace it locally with a fresh matching GenSMBIOS set after initial testing.

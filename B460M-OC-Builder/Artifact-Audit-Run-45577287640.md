# Artifact audit — Run 45577287640

Date: 2026-11-25
Repository: hf9syu5v-dev/game-accelerator
Workflow: Build B460M OpenCore staging EFI
Run: https://github.com/hf9syu5v-dev/game-accelerator/actions/runs/45577287640
Source commit: cf11befc0f88ffa6b5b32669db3bfb34731c33f8
Artifact ID: 15005391442
Artifact name: B460M-OpenCore-1.0.8-DEBUG-STAGING-NOT-BOOTABLE
Artifact size: 4,548,305 bytes
Artifact SHA-256: 6c5bb617ee49b181ebb378a9e5efd485d6f06ce31531bfb8241efba16b38ef23

## Build result

- GitHub Actions job `build-staging`: success.
- OpenCore 1.0.8 DEBUG download and pinned SHA-256 check: passed.
- HfsPlus driver pinned SHA-256 check: passed.
- Required kext staging: passed.
- Original supplied UTBMap RAR extraction and metadata checks: passed.
- Three ACPI tables copied: passed.
- Hardware-specific config generation: passed.
- Matching OpenCore `ocvalidate` step: workflow step completed successfully.
- Additional Python assertions: passed, including `Misc.Security.BlacklistAppleUpdate == True`.
- Artifact uploaded successfully.

## Independent ZIP inspection

The artifact was downloaded and inspected locally. ZIP listing and CRC/integrity check succeeded. The archive contains 27 files, including:

- EFI/BOOT/BOOTx64.efi
- EFI/OC/OpenCore.efi
- EFI/OC/Drivers/HfsPlus.efi and OpenRuntime.efi
- EFI/OC/ACPI/SSDT-PLUG-DRTNIA.aml
- EFI/OC/ACPI/SSDT-EC-USBX-DESKTOP.aml
- EFI/OC/ACPI/SSDT-AWAC.aml
- Eight configured kext bundles
- EFI/OC/config.plist
- BUILD-MANIFEST.md and DO-NOT-BOOT.txt

ACPI file sizes: AWAC 73 bytes; EC-USBX desktop 7,341 bytes; PLUG 693 bytes. The 73-byte AWAC table has an SSDT signature and a matching AML table length field; its small size alone is not evidence of corruption.

The config was parsed from the actual downloaded ZIP. Confirmed:
- SMBIOS product: iMac20,1 (temporary test identity as requested)
- BlacklistAppleUpdate: true
- UHD 630 headless platform-id: 0300C89B
- Eight enabled kexts, USBToolBox before UTBMap
- Three enabled ACPI entries: PLUG, EC-USBX-DESKTOP, AWAC
- OpenRuntime and HfsPlus drivers present
- SetupVirtualMap=false; XhciPortLimit=false; DisableIoMapper=false

## Safety and remaining gates

This is still **STAGING ONLY — NOT BOOTABLE**. No physical boot test has been performed. The supplied UTBMap's physical socket mapping, USB installer access, sleep/wake behavior, RX 570 acceleration, Ethernet, NVMe, audio and power management remain unverified.

Before a first boot:
1. Complete read-only BIOS preflight for Secure Boot enforcement, CSM, Fast Boot, VT-x, Execute Disable Bit and SATA controller mode. Do not change SATA/RST/AHCI without first establishing Windows boot dependencies.
2. Use a separate removable USB drive for any eventual EFI test.
3. Never write to or repartition the internal WD SN720 Windows disk.
4. Do not call this artifact bootable until target-machine testing and a separate approved candidate build are complete.

This audit records build and archive verification only; it does not certify hardware compatibility or bootability.

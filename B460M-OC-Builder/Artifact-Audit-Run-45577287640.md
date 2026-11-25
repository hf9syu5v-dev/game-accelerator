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

## Follow-up review: USB map and CPU evidence

A direct read of the supplied `UTBMap.kext/Contents/Info.plist` confirms 11 entries:
- HS01–HS04 use port indices 1–4 and connector type 3.
- HS05 and HS06 use indices 9 and 10 with connector type 0.
- HS07 uses index 11 with connector type 255.
- SS01–SS04 use indices 17–20 and connector type 3.
- Declared port-count is 20.

These are structural facts only. The repository contains no evidence that these indices were physically mapped on this exact B460M-PLUS board. Do not treat the map as hardware-verified. The USB 2/USB 3 companion pairing and case/front-panel connector types must be checked on the target machine.

### CPU report received from target Windows installation

The user ran the read-only PowerShell helper on the target Windows installation. Reported values:
- WMI processor name: `Genuine Intel(R) CPU 0000 @ 3.00GHz`
- Manufacturer: `GenuineIntel`
- WMI ProcessorId: `BFEBFBFF000A0650`
- Cores / logical processors: 6 / 12
- MaxClockSpeed: 3000 MHz
- Environment and ComputerSystem logical processor counts: 12

Interpretation:
- The 6-core/12-thread topology matches the planned Comet Lake-S configuration.
- For this 16-hex-digit Intel WMI ProcessorId representation, the trailing 8 digits `000A0650` are the CPUID signature candidate. The leading `BFEBFBFF` must **not** be interpreted as CPUID Leaf 1 EAX.
- Candidate signature `0x000A0650` decodes to Family 6, Model 0xA06 (extended model A, base model 6), Stepping 0, consistent with the previously observed G0/Comet Lake-S identification.
- WMI data is firmware/OS-reported and is not an independent direct CPUID instruction capture. The generic CPU name and blank WMI Family/Stepping/Revision fields do not establish a retail SKU; keep the exact ES identity provisional until direct CPUID evidence is collected.

The initial helper version incorrectly extracted the first 8 digits. This has been corrected: [Read-B460M-CPU-Info.ps1](Read-B460M-CPU-Info.ps1) now extracts the final 8 digits and labels them as a WMI-derived candidate only.

This audit records build and archive verification only; it does not certify hardware compatibility or bootability.

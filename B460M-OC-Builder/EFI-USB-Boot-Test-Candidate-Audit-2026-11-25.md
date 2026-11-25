# B460M-PLUS complete EFI USB boot-test candidate audit

Date: 2026-11-25
Target: ASUS TUF GAMING B460M-PLUS / Intel Core i5-10500ES / Radeon RX 570 / macOS Sequoia 15

## Final CI build

- Workflow run: [45589898536](https://github.com/hf9syu5v-dev/game-accelerator/actions/runs/45589898536)
- Run number: 42
- Commit: `5f5ac304cf703a61f81eacda8e7e1b5c2f5e150d`
- Result: success; every job step completed successfully.
- Artifact: `B460M-OpenCore-1.0.8-DEBUG-USB-BOOT-TEST-CANDIDATE`
- Artifact ID: `15009119500`
- Artifact SHA-256: `c0f03f13ce2ebf2f49c6b5bc7db4399a3f6f79cc0c652d19a01841402e873b3e`

## Independently inspected payload

The downloaded Run 42 artifact was extracted and inspected independently.

- Complete `EFI/` tree: 24 files.
- Required boot files: `EFI/BOOT/BOOTx64.efi`, `EFI/OC/OpenCore.efi`, and `EFI/OC/config.plist` present.
- UEFI drivers: OpenRuntime.efi and HfsPlus.efi enabled.
- ACPI: PLUG, EC-USBX-DESKTOP, AWAC enabled; RHUB fallback SSDT intentionally not loaded with USBToolBox.
- Kexts: all 8 expected entries enabled and present; UTBMap remains codeless and follows USBToolBox.
- Picker: Builtin; ShowPicker=true; Timeout=0, so it waits for manual selection rather than automatically launching an internal OS.
- All 24 EFI manifest SHA-256 entries matched.
- The ZIP passed `unzip -t`.
- Matching OpenCore 1.0.8 `ocvalidate`, kext x86_64 checks, ACPI disassembly, UTBMap structure assertions, and config cross-file assertions all passed in CI.

## Clean EFI-only ZIP

A clean ZIP containing only the root `EFI/` folder was generated from the independently inspected Run 42 payload:

- File: `B460M-PLUS-Sequoia-OpenCore-1.0.8-DEBUG-EFI.zip`
- SHA-256: `23a8ad091ddc02907e7d15a42c5c62b7e840cfe00f54e5462491121c08df2681`
- ZIP integrity: passed.

## Scope and remaining hardware gates

This is a complete OpenCore EFI package suitable for a removable-USB picker/boot test. It is not represented as hardware-boot-tested. The following require the actual target motherboard:

1. Confirm firmware launches OpenCore from a separate removable USB and displays the picker.
2. Validate the existing UTBMap against physical USB sockets and USB 2/3 companion ports.
3. Validate Sequoia boot and RX 570 acceleration, UHD 630, I219-V Ethernet, HP EX900 Plus NVMe, ALC S1200A audio, and sleep/wake.

The initial test must stop at the OpenCore picker. Do not select an installer or run format, partition, or installation operations. WD SN720 and HP EX900 Plus internal disks remain untouched. No internal disk or USB device was written by this build process.

The SMBIOS values in this configuration are the temporary test values explicitly approved by the user.

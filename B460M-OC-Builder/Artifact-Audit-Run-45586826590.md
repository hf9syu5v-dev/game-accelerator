# Artifact audit — Run #37

- Workflow run: https://github.com/hf9syu5v-dev/game-accelerator/actions/runs/45586826590
- Run ID: 45586826590
- Source commit: 2a135d630542828883ef2e4fc2b937a28a8b82d8
- Result: **success**
- Artifact ID: 15009840043
- Artifact name: `B460M-OpenCore-1.0.8-DEBUG-STAGING-NOT-BOOTABLE`
- Artifact size: 4,548,305 bytes
- Expiration: 2026-12-09T09:35:53Z
- Downloaded ZIP SHA-256: `6e2ac096e5e28757b8a5df3e4c51f5ba6ba3077414965509886a2ced25a48a80`

## Workflow checks

Every step completed successfully, including:
1. OpenCore 1.0.8 DEBUG download and verification.
2. Pinned HfsPlus driver download.
3. Eight kext releases staged and metadata/executable architecture checks passed.
4. Three enabled ACPI AML files copied, disassembled and parsed by ACPICA.
5. Hardware-specific config candidate generated.
6. Matching OpenCore 1.0.8 `ocvalidate` completed with **No issues found**.
7. Cross-file assertions passed, including graphics properties, boot arguments, kext order, ACPI, UEFI drivers, and native/no-override CPUID fields.
8. Staging manifest and safety notice generated; artifact uploaded.

## Independent downloaded-artifact inspection

The artifact ZIP was downloaded and inspected after workflow completion.

- ZIP contains 27 entries; EFI directory contains BOOTx64.efi, OpenCore.efi, config.plist, 8 kext bundles, 3 AML tables, OpenRuntime.efi and HfsPlus.efi.
- config.plist parses successfully with Python plistlib; size 34,376 bytes.
- SMBIOS fields match the explicitly approved temporary test values and product name iMac20,1.
- DeviceProperties contains only `PciRoot(0x0)/Pci(0x2,0x0)` with `AAPL,ig-platform-id = 03 00 C8 9B`; DeviceProperties/Delete is empty.
- Boot arguments are `-v keepsyms=1 debug=0x100`; no speculative `agdpmod=pikera`, `-wegnoegpu`, `alcid`, `cpus=1` or NVMe ASPM argument.
- Kernel Emulate Cpuid1Data and Cpuid1Mask are empty, matching OpenCore 1.0.8 Sample.plist; no CPUID spoof is active.
- Enabled ACPI tables: PLUG, EC-USBX-DESKTOP, AWAC only.
- Enabled UEFI drivers: OpenRuntime.efi and HfsPlus.efi.
- Enabled kext order: Lilu, VirtualSMC, WhateverGreen, AppleALC, IntelMausi, NVMeFix, USBToolBox, UTBMap.
- The manifest and DO-NOT-BOOT notice are present.

## Decision

**Run #37 staging artifact passed static/CI validation and independent ZIP/config inspection. It remains NOT BOOTABLE.** This does not establish physical USB port mapping, firmware boot behavior, GPU acceleration, audio output, network operation, NVMe stability, sleep/wake, or any other runtime hardware behavior.

No internal disk was read for writes, modified, partitioned, formatted, or used. No physical EFI was written. The artifact contains no macOS installer or disk image.

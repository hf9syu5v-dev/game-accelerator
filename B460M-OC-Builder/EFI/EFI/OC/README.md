# B460M-PLUS EFI staging tree

This directory is a staging layout, not yet a bootable EFI.

- `ACPI/`: three official Dortania AML files, copied byte-for-byte and verified against upstream, plus one board-specific RHUB DSL source awaiting compilation.
- `Kexts/`: official release manifest and intended load order; actual bundles still need to be downloaded/extracted.
- `Drivers/`: required UEFI driver manifest.
- `config.plist`: not yet generated. Do not boot this staging tree until the complete config has been generated, populated with locally generated SMBIOS values, and passed OpenCore 1.0.8 ocvalidate.

Hardware plan and outstanding validation: see `B460M-OC-Builder/Hardware-Kext-Plan-2026-11-25.md` and `B460M-OC-Builder/ACPI-Analysis-Report-2026-11-25.md`.

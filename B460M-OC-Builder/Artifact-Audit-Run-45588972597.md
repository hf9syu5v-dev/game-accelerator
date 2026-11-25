# Artifact audit — Run #38

- Workflow run: https://github.com/hf9syu5v-dev/game-accelerator/actions/runs/45588972597
- Run ID: 45588972597
- Result: **success**
- Source commit: 50abc68dcde6ca4a1edd3e7f1536d09fc780d66f
- Artifact ID: 15010605420
- Artifact name: `B460M-OpenCore-1.0.8-DEBUG-STAGING-NOT-BOOTABLE`
- Artifact size: 4,549,118 bytes
- Expiration: 2026-12-09T09:49:25Z
- Downloaded ZIP SHA-256: `b2daad387afa25b1d4c1d67705728f1e039bc148b63b28ff355ea51f55402794`

## CI result

The only job `build-staging` completed successfully. All workflow steps passed:
- OpenCore 1.0.8 DEBUG checksum and required EFI files.
- Pinned HfsPlus driver.
- Eight kext metadata, versions, executable presence and x86_64 checks.
- UTBMap codeless bundle/dependency/map checks.
- ACPICA disassembly/parser checks for all three enabled AML tables.
- Config generation, matching OpenCore 1.0.8 `ocvalidate`, and hardware guardrail assertions.
- Manifest and safety notice generation.
- Artifact upload.

## Independent downloaded-artifact verification

The downloaded artifact ZIP was independently extracted and checked.

- ZIP contains 24 EFI files plus manifest and DO-NOT-BOOT notice.
- Manifest now includes SHA-256 for every file under `EFI/`: 24 entries checked, **24/24 matched** the extracted payload bytes.
- `config.plist` parses successfully; size 34,376 bytes.
- 8 kexts enabled, 3 ACPI tables enabled, 2 UEFI drivers enabled.
- Configuration contents are the same hardware-specific staging candidate as Run #37; this change improves manifest coverage and does not change boot configuration.

## Decision

Run #38 is the latest successful staging build with a complete per-file EFI SHA-256 manifest. It remains **STAGING ONLY — NOT BOOTABLE**. No physical USB test, firmware boot test, macOS install, or target-hardware runtime test has occurred.

No internal disk was written, formatted, partitioned, or modified. No physical EFI was written. No installer or disk image is included.

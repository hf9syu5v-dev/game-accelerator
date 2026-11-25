# Artifact audit — Run #39

- Workflow run: https://github.com/hf9syu5v-dev/game-accelerator/actions/runs/45589183742
- Run ID: 45589183742
- Result: **success**
- Source commit: d1cf51af645ece00e8f389967e32b88fd7232c2a
- Artifact ID: 15009712619
- Artifact name: `B460M-OpenCore-1.0.8-DEBUG-STAGING-NOT-BOOTABLE`
- Artifact size: 4,549,118 bytes
- Downloaded ZIP SHA-256: `7844f3e2f544d9fe51acb0e2b120c74fb4067bcce447e1c18954e540bc1acadb`

## CI result

The `build-staging` job completed successfully. All workflow steps passed, including matching OpenCore 1.0.8 `ocvalidate`, eight kext checks, three ACPICA AML parser checks, hardware config guardrails, full EFI manifest generation and artifact upload.

## New USB map guardrail

The CI now verifies the exact supplied UTBMap contents:
- HS01–HS04: indices 1–4, connector 3
- HS05: index 9, connector 0
- HS06: index 10, connector 0
- HS07: index 11, connector 255
- SS01–SS04: indices 17–20, connector 3
- Exactly 11 entries, all hardware indices unique, port-count 20

This pins the user's existing map against accidental edits. It does not establish which physical socket maps to each logical port.

## Independent downloaded-artifact verification

- Downloaded ZIP extracted successfully.
- Manifest contains SHA-256 for all 24 files under `EFI/`; all 24 hashes match the extracted payload.
- `config.plist` parses successfully.
- UTBMap has 11 entries and exactly matches the expected names, indices and connector values; all 11 indices are unique.
- Eight kexts are enabled.

## Decision

Run #39 is the latest successful CI-validated staging artifact with full per-file hashes and exact USB-map structural assertions. It remains **STAGING ONLY — NOT BOOTABLE**. Physical USB port mapping, firmware picker behavior and all runtime hardware tests remain outstanding.

No internal disk was written, partitioned, formatted or modified. No physical EFI was written. No installer or disk image is included.

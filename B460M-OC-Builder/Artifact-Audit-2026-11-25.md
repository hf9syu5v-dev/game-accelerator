# B460M EFI artifact audit — 2026-11-25

## Artifact inspected

- Workflow run: 45565270737, attempt 10
- Artifact ID: 15000372208
- Artifact SHA-256: 2d39690f843479d74c9efc1d82832b11dd9d0b20b7a8ebf975d3d28a06c62c02
- ZIP size: 4,538,081 bytes
- ZIP integrity: passed; 26 files
- config.plist: parsed successfully; plutil lint passed
- All enabled ACPI, kext bundle, and UEFI driver paths exist
- Six kext bundle identifiers and executable files are present
- Eight EFI/ACPI SHA-256 entries in BUILD-MANIFEST.md match the extracted files

## Issues found in the downloaded artifact

1. The builder hard-coded SMBIOS serial, MLB, ROM and UUID values. The project planning report records that this set was exposed in public Git history. Do not reuse it. The builder has now been changed to keep iMac20,1 as the selected model while leaving those four unique identity fields blank for local generation on the target PC.
2. Booter Quirks differed from the project's Comet Lake/ASUS 400-series planning baseline: DevirtualiseMmio was false, SetupVirtualMap was true, and ProtectUefiServices was false. The builder now sets true, false, true respectively.
3. Audio layout was set to alcid=3 despite a conflicting project hardware plan that proposes a different initial test. The builder now omits alcid entirely; choose and test the ALC S1200A layout after first successful boot rather than baking an unverified layout into the initial EFI.

## Changes committed for the next staging build

- Builder update: 4eb427302544a7dc49b5b1a3704825600c610e99
- Workflow validation update: see the subsequent workflow commit in the repository
- EFI staging README updated to describe the generated config candidate and blank SMBIOS fields

## Remaining gates

- Re-run GitHub Actions on the updated main branch and inspect the new artifact.
- Generate a fresh iMac20,1 GenSMBIOS set on the target B460M PC. Use the local helper to derive ROM from that machine's Intel I219-V MAC. Keep the output private and do not commit it.
- Apply the fresh SMBIOS values locally to config.plist and run the matching OpenCore 1.0.8 ocvalidate.
- Confirm CFG Lock state if possible; AppleXcpmCfgLock remains a provisional workaround because the BIOS menu did not expose the setting.
- Perform USB physical port mapping after first successful macOS boot.
- Test ALC S1200A layout, RX 570 acceleration, UHD 630 headless behavior, I219-V Ethernet, NVMe and sleep/wake on hardware.

## Safety boundary

This artifact is a staging candidate, not a bootable EFI. No disk was formatted, repartitioned, or written. The WD SN720 Windows disk remains out of scope.

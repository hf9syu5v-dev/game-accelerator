# B460M Sequoia Build and Deployment Workflow

This workflow is based on the successful NO-iGPU diagnostic USB deployment on 2026-11-26.

## Mandatory rule: test scripts before asking the user to run them

Never hand an untested PowerShell script to the user when its behavior can be validated in CI. The validation must use the actual script intended for the user, not a simplified reimplementation.

## Required validation gates

1. **PowerShell parser gate**
   - Parse the complete script using the target Windows PowerShell version (currently Windows PowerShell 5.1 unless the script explicitly targets another version).
   - Fail on any parser errors before proceeding.

2. **Static safety gate**
   - Inspect the complete script for destructive or out-of-scope disk operations.
   - For USB contents-only deployment, prohibit partitioning, formatting, disk initialization/cleaning, partition-type changes, drive-letter changes, and all writes to internal disks.
   - Verify that the script targets only the explicitly identified USB device and stops on identity mismatch.

3. **Real dependency/download gate**
   - In Windows CI, execute the actual script's download and validation path against the real published release asset.
   - Verify HTTP download success, minimum/expected file size where applicable, and a pinned SHA256 digest.
   - Do not substitute a mock ZIP when the real asset is publicly retrievable.

4. **Archive and path-handling gate**
   - Exercise the actual PowerShell archive extraction mechanism, for example Expand-Archive.
   - Test the exact path/object conversions used by the script, including FileInfo.FullName.
   - Verify automatic discovery of the expected directory layout.

5. **Payload integrity/configuration gate**
   - Check all required EFI files and referenced drivers, kexts, ACPI tables, and configuration entries.
   - Run the matching OpenCore validation tool where applicable.
   - Assert expected boot arguments and SMBIOS configuration.
   - Assert explicitly excluded USB ports or mappings remain absent.
   - Verify ZIP integrity and record the payload SHA256.

6. **Recovery validation gate**
   - Verify Recovery image and chunklist presence and consistency.
   - Run Apple's chunklist verification using the same Python/macrecovery environment path intended for deployment.
   - Test Python discovery and invocation on Windows, including paths containing spaces.

7. **Copy/read-back gate**
   - Where safe in CI, exercise copy and SHA256 read-back logic against a temporary test directory or virtual fixture.
   - Never write to a physical user disk from CI.
   - On the user's machine, re-identify the target device immediately before copying and verify copied files by SHA256.

8. **User execution gate**
   - Give the user one clean, copy-paste-ready command.
   - Do not ask the user to manually download intermediate artifacts if the script can securely download them itself.
   - Clearly distinguish script output from PowerShell error diagnostics. Never instruct the user to paste prompt prefixes such as PS ...>, parser diagnostics, CategoryInfo, or continuation lines as commands.
   - Stop safely on pre-existing destination content; do not delete or overwrite it without an explicit, informed decision.

## Successful reference run (2026-11-26)

The NO-iGPU EFI deployment to the verified USB ESP completed with:

- Target: Disk 1, LITEON I T LCS-128L9S, serial 000000123ADC, drive F:.
- Release asset downloaded automatically and SHA256 pin verified.
- EFI source validation: 24 files; HS04/SS04 absent.
- Python found at C:\Program Files\PyManager\python.exe (Python 3.15.2).
- Apple Recovery chunklist verification: PASS.
- EFI copy and SHA256 read-back: PASS.
- Disk/partition/format/drive-letter operations: NONE.

The corresponding Windows PowerShell 5.1 CI validation passed parser, static safety, real release download, SHA256, archive extraction, path handling, EFI structure, and configuration checks.

## Reporting discipline

A CI pass proves only the checks actually executed in CI. It does not prove that a physical USB was written successfully or that macOS will boot. Report those as separate milestones. Never claim a physical deployment, boot, installer launch, or successful macOS installation until the user-provided evidence confirms it.

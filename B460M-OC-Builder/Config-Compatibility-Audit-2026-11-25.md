# B460M-PLUS OpenCore configuration compatibility audit

Date: 2026-11-25
Target: ASUS TUF GAMING B460M-PLUS / Intel Core i5-10500ES / macOS Sequoia 15
OpenCore candidate: 1.0.8 DEBUG
Status: staging only; not approved to boot

## 1. CPU and SMBIOS

- The target is a Comet Lake desktop CPU, reported as an i5-10500ES, 6 cores / 12 threads.
- CPU-Z evidence records Family 6, Model 5, Extended Model A5, Stepping 0, Revision G0. CPUID 0x000A0650 is a derived candidate, not yet a direct raw CPUID capture.
- Dortania's Comet Lake guide explicitly recommends iMac20,1 for i7-10700K and lower (8 cores and lower), and iMac20,2 for 10-core i9-10850K and higher. iMac20,1 is therefore the appropriate initial SMBIOS class for this 6-core CPU.
- Do not add Kernel -> Emulate -> Cpuid1Data/Cpuid1Mask until a real boot log demonstrates that the ES CPU requires emulation. Avoid speculative CPUID spoofing.

## 2. Kernel quirks

| Quirk | Current value | Audit result |
|---|---:|---|
| AppleXcpmCfgLock | True | Correct fallback because CFG Lock was not found in BIOS; Dortania says enable this when the option cannot be found/disabled |
| AppleCpuPmCfgLock | False | Correct for Comet Lake; this legacy quirk is for Ivy Bridge and older |
| DisableIoMapper | False | Appropriate because VT-d is disabled in BIOS |
| XhciPortLimit | False | Correct for modern macOS; do not enable the old port-limit patch |
| PanicNoKextDump | True | Matches Dortania's Comet Lake baseline |
| PowerTimeoutKernelPanic | True | Matches Dortania's Comet Lake baseline |

## 3. Booter quirks

The current values match Dortania's Comet Lake desktop baseline: AvoidRuntimeDefrag=True, DevirtualiseMmio=True, EnableSafeModeSlide=True, EnableWriteUnprotector=False, ProvideCustomSlide=True, RebuildAppleMemoryMap=True, ResizeAppleGpuBars=-1, SetupVirtualMap=False, SyncRuntimePermissions=True, ProtectUefiServices=True.

In particular, SetupVirtualMap must remain False on this ASUS Comet Lake platform; Dortania notes ASUS boards will not boot with it enabled. Keep ResizeAppleGpuBars=-1 unless firmware Re-Size BAR support is explicitly enabled and a reason to set it to 0 is established.

## 4. Graphics

- The repository BIOS screenshot confirms Primary Display=Auto, iGPU Multi-Monitor=Enabled, DVMT Pre-Allocated=512M and RC6=Enabled.
- The Windows Device Manager screenshot shows both Intel UHD Graphics 630 and Radeon RX 570 Series.
- The iGPU property 0300C89B is the Comet Lake desktop headless platform ID for compute-only use when the discrete GPU drives the display. No framebuffer stolen-memory patch is needed for this headless use case.
- RX 570 is a Polaris/Ellesmere card; Dortania's GPU guide lists Polaris 10/20 as supported through Sequoia. Do not add Navi-only agdpmod=pikera. Keep WhateverGreen and do not disable the RX 570.

## 5. USB / ACPI interaction

- USBToolBox 1.2.0 documentation explicitly states it can ignore broken ACPI port definitions on 400-series Intel boards and replaces SSDT-RHUB.
- The selected staging set uses USBToolBox.kext + the user's UTBMap.kext, so SSDT-RHUB is intentionally not injected at the same time.
- This does not prove that the supplied 11-port map matches every physical socket. Physical mapping, USB 2/3 companion behavior, sleep/wake and installer access still require testing on the actual motherboard.
- The board-specific SSDT-RHUB DSL is retained as a fallback if USBToolBox's RHUB bypass is later found ineffective or USBToolBox is removed.

## 6. Audio

- Codec is reported as Realtek ALC S1200A (CodecID 0x0B00); AppleALC supports ALCS1200A and several layout IDs.
- No layout ID or alcid boot argument is currently injected. This is intentional: a supported codec layout is not necessarily the correct jack map for this ASUS board.
- Select and test an ASUS-specific layout after the first successful boot; do not treat generic layout 1 or another B460 board's layout as verified for this motherboard.

## 6A. Firmware-update protection adjustment

The config generator was updated in commit `0f423d59e5a38c08365a5b1c903bda6858dc3213` to set `Misc -> Security -> BlacklistAppleUpdate = True`, matching Dortania's Comet Lake baseline. This is a protective setting to block Apple firmware-update payloads from being applied through macOS. The previously built Run 45572403055 artifact still contains the old False value; it is not silently treated as rebuilt. A fresh workflow run is required before this change appears in a new artifact.

## 7. Validation already passed

For Run 45572403055:
- OpenCore 1.0.8 matching ocvalidate: No issues found.
- config.plist parsed successfully.
- 8 kext entries; USBToolBox precedes UTBMap.
- Original UTBMap Info.plist extracted from the supplied RAR and staged with matching SHA-256.
- 3 ACPI tables enabled: PLUG, EC-USBX, AWAC.
- 2 UEFI drivers enabled: OpenRuntime and HfsPlus.
- Artifact ZIP integrity passed.

## 8. Remaining gates before a bootable EFI can be approved

1. BIOS preflight update (2026-11-25): CSM Disabled, Fast Boot Disabled, VT-x Enabled, SATA Mode AHCI, VT-d Disabled, Above 4G Enabled, Hyper-Threading Enabled and XHCI Hand-off Enabled are user-confirmed. Secure Boot is configured as `Other OS` with default PK/KEK/DB/DBX keys installed; leave key management untouched. Execute Disable Bit/XD was not found in the inspected CPU Configuration page. Remaining BIOS items are optional Serial/Parallel, SGX/PTT, Thunderbolt and Re-Size BAR checks if those options exist.
2. Directly confirm ES CPU CPUID and actual active logical processor count from Windows/hardware diagnostics; CPU-Z's displayed family/model/revision does not substitute for a raw CPUID capture.
3. Verify that the supplied UTBMap was generated for this exact motherboard/controller and physically test all mapped USB ports.
4. First boot test with a separate removable USB EFI only; do not write the internal EFI partition.
5. Validate RX 570 acceleration, UHD 630 compute functions, Ethernet, NVMe, audio and sleep/wake.
6. Only after successful testing, prepare a clearly marked bootable candidate. No disk install or partition changes are part of this stage.

## Official references

- Comet Lake desktop config / SMBIOS / quirks / BIOS: https://dortania.github.io/OpenCore-Install-Guide/config.plist/comet-lake.html
- SMBIOS selection: https://dortania.github.io/OpenCore-Install-Guide/extras/smbios-support.html
- Intel and AMD GPU compatibility: https://dortania.github.io/GPU-Buyers-Guide/
- USBToolBox RHUB bypass documentation: https://github.com/USBToolBox/kext
- AppleALC supported codecs: https://github.com/acidanthera/AppleALC/wiki/Supported-codecs

This is a configuration compatibility review, not a hardware boot test. The artifact remains STAGING ONLY — NOT BOOTABLE.


## 9. Artifact freshness note

Superseded by the independently inspected Run 45577287640 artifact (ID 15005391442), built from commit `cf11befc0f88ffa6b5b32669db3bfb34731c33f8`. That artifact includes `BlacklistAppleUpdate=True` and passed ZIP integrity, config parsing, kext/ACPI/driver presence checks and the workflow's matching `ocvalidate` step. It remains staging-only and is not approved to boot.


## 10. Latest CI verification — Run #31

The latest staging workflow is Run 45585718839, built from commit `2441e21d746090736efa0a8198e5fe1179aeccd9`. It completed successfully and produced artifact ID `15008651678` (SHA-256 `383327c4f8897e6a6b9ce0029fa7cf0ba16982574ddf40383986f659ae01fb51`).

In addition to the Run #28 config and cross-file assertions, Run #31 verifies the exact Bundle ID and CFBundleVersion of all seven binary kexts and checks each executable contains x86_64 using macOS `lipo`. It separately verifies UTBMap's codeless bundle and USBToolBox dependency metadata. All checks passed. The first test attempt (Run #30) exposed an incorrect `lipo` argument order in the new test; the workflow command was corrected and Run #31 passed.

See [Artifact-Audit-Run-45585718839.md](Artifact-Audit-Run-45585718839.md) for the full record. This remains a CI-validated staging candidate, **not a bootable or hardware-tested EFI**.


## 11. Latest full validation — Run #35

Run 45586016881 completed successfully from commit `6967993d4ff3ac9d9d44abeedbbe45fcc65a96c7`. Artifact ID `15007769687`, SHA-256 `0f1dd243fbbc75fcb47a26073dc457a15c455e56726cc8dc5d9bdce342d30d7e`.

Run #35 adds ACPICA disassembly of all three enabled AML tables in an isolated temporary directory. Each AML successfully parsed and produced a non-empty ASL DefinitionBlock. The kext version/Bundle ID/x86_64 checks, UTBMap structure/dependency checks, config cross-file assertions, and matching OpenCore 1.0.8 `ocvalidate` all passed.

The ACPICA check's first attempts exposed only a script output-path assumption; the script now copies AML inputs into the temporary workspace before disassembly. Run #35 is the first successful artifact containing this additional validation. Full details: [Artifact-Audit-Run-45586016881.md](Artifact-Audit-Run-45586016881.md).

The result is still **STAGING ONLY — NOT BOOTABLE** pending physical USB validation and target-machine hardware tests.

## 12. Latest full validation — Run #37

Run 45586826590 completed successfully from commit `2a135d630542828883ef2e4fc2b937a28a8b82d8`. Artifact ID `15009840043`, ZIP SHA-256 `6e2ac096e5e28757b8a5df3e4c51f5ba6ba3077414965509886a2ced25a48a80`.

Run #37 includes the new hardware-initialization guardrails: only the UHD 630 headless platform property is injected; no speculative AMD framebuffer/disable arguments, audio layout, NVMe ASPM argument or CPU spoof is permitted. The initial Run #36 attempt failed because the assertion expected 16 zero bytes for empty CPUID emulation fields, while OpenCore 1.0.8 Sample.plist correctly defines those fields as empty data. The assertion was corrected to match the official sample; no generated config behavior was changed.

Run #37 passed every workflow step, including matching OpenCore 1.0.8 `ocvalidate`, all kext metadata and x86_64 checks, ACPICA disassembly of all three AML tables, config assertions, manifest generation and artifact upload. The downloaded ZIP was independently inspected: config.plist parses, contains the expected iMac20,1 temporary test SMBIOS values, the single UHD 630 headless property, native/empty CPUID emulation fields, 8 enabled kexts, 3 enabled ACPI tables and 2 enabled UEFI drivers.

See [Artifact-Audit-Run-45586826590.md](Artifact-Audit-Run-45586826590.md) and [Hardware-Initialization-Audit-2026-11-25.md](Hardware-Initialization-Audit-2026-11-25.md).

Run #37 is the latest successful CI-validated staging artifact. It remains **STAGING ONLY — NOT BOOTABLE**; physical USB port mapping and all runtime hardware checks remain outstanding.

## 13. Latest staging build — Run #38

Run 45588972597 completed successfully from commit `50abc68dcde6ca4a1edd3e7f1536d09fc780d66f`. Artifact ID `15010605420`; downloaded ZIP SHA-256 `b2daad387afa25b1d4c1d67705728f1e039bc148b63b28ff355ea51f55402794`.

Run #38 does not change the generated OpenCore configuration. It improves artifact traceability: the staging manifest now hashes **every file under EFI/** rather than only the bootloader, OpenCore binary, drivers and ACPI tables. The artifact was downloaded and independently checked; all 24 manifest file hashes matched the extracted EFI payload, config.plist parsed successfully, and the expected 8 kexts / 3 ACPI tables / 2 UEFI drivers are enabled.

Full record: [Artifact-Audit-Run-45588972597.md](Artifact-Audit-Run-45588972597.md).

Run #38 is the latest successful CI-validated staging artifact. It remains **STAGING ONLY — NOT BOOTABLE** pending physical USB mapping and hardware validation.

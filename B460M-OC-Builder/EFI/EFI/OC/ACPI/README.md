# OpenCore ACPI binaries — B460M-PLUS staging set

These AML files are copied byte-for-byte from Dortania's Getting-Started-With-ACPI repository, `extra-files/compiled/`, on 2026-11-25.

Source repository: https://github.com/dortania/Getting-Started-With-ACPI
Source directory: https://github.com/dortania/Getting-Started-With-ACPI/tree/master/extra-files/compiled

Enabled staging files:
- SSDT-PLUG-DRTNIA.aml — target processor path \\_SB.PR00
- SSDT-EC-USBX-DESKTOP.aml — desktop Fake EC and USBX
- SSDT-AWAC.aml — Darwin sets STAS to 1, selecting legacy RTC on this firmware

Archived fallback source (not enabled or copied into the current artifact):
- `SSDT-RHUB-B460M-PLUS.dsl` — board-specific RHUB workaround source; compile only if USBToolBox is removed and a controlled test establishes the need.

These three AML files are staged and enabled in the Run #28 candidate, but are not yet proven boot-tested on this machine. The candidate passed matching OpenCore 1.0.8 `ocvalidate` and cross-file presence checks. This validates configuration structure, not runtime ACPI behavior.

Important: this DSDT uses `XHC` (no trailing underscore), so the generic Dortania prebuilt RHUB AML does not match the controller path. The board-specific DSL is retained as a fallback only. The current EFI uses USBToolBox 1.2.0, whose official documentation says it bypasses broken 400-series Intel RHUB ACPI and replaces SSDT-RHUB; consequently, do not inject the custom RHUB SSDT alongside USBToolBox unless a controlled test establishes that the bypass is ineffective. If USBToolBox is removed, compile the board-specific DSL with `B460M-OC-Builder/Compile-B460M-RHUB.ps1` from the repository root.

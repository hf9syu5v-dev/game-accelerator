# OpenCore ACPI binaries — B460M-PLUS staging set

These AML files are copied byte-for-byte from Dortania's Getting-Started-With-ACPI repository, `extra-files/compiled/`, on 2026-11-25.

Source repository: https://github.com/dortania/Getting-Started-With-ACPI
Source directory: https://github.com/dortania/Getting-Started-With-ACPI/tree/master/extra-files/compiled

Files:
- SSDT-PLUG-DRTNIA.aml — target processor path \\_SB.PR00
- SSDT-EC-USBX-DESKTOP.aml — desktop Fake EC and USBX
- SSDT-AWAC.aml — Darwin sets STAS to 1, selecting legacy RTC on this firmware
- SSDT-RHUB.aml — ASUS 400-series XHC RHUB workaround

These are staged candidates, not yet proven boot-tested on this machine. Before enabling them in config.plist, verify the ACPI analysis report and run the matching OpenCore 1.0.8 ocvalidate after config generation.

Important: Dortania's generic prebuilt `SSDT-RHUB.aml` targets `XHC_`, `XHCI` and `XHC1`; this DSDT uses `XHC` (no trailing underscore). The generic prebuilt AML was therefore removed from this staging tree. Use the board-specific DSL source here, not the generic prebuilt AML. Compile it with `B460M-OC-Builder/Compile-B460M-RHUB.ps1` from the repository root (or run the script with `-IaslPath 'C:\\path\\to\\iasl.exe'`).

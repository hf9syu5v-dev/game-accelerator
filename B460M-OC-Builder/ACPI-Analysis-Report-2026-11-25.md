# ASUS TUF GAMING B460M-PLUS — ACPI Analysis
Date: 2026-11-25
Target: macOS Sequoia / Intel Comet Lake desktop
Repository: hf9syu5v-dev/game-accelerator

## 1. Evidence inspected

Source files are in `B460M-ACPI-Decompile-Output/Disassembled-ASL/`:
- `DSDT-Upload/DSDT.part01.dsl` through `DSDT.part05.dsl`
- `DSDT-Upload/SHA256-MANIFEST.txt`
- `SSDT.dsl`, `SSDT1.dsl` ... `SSDT5.dsl`

The five DSDT parts concatenate to 3,929,002 characters. Their individual SHA-256 values are recorded in the manifest. This is a decompiled/annotated ASL representation; do not mistake its character count for the original binary DSDT size.

## 2. Confirmed namespace findings

### Embedded controller
- Native device path: `\\_SB.PCI0.LPCB.H_EC`
- `_HID = PNP0C09`
- Native `_STA` method explicitly returns `Zero` (and performs a GFX0.CLID store first).
- `ECAV` is initialized to `Zero`.
- OEM SSDT3/SSDT5 contain numerous references to H_EC methods/fields. They are firmware tables; their presence does not mean they should be copied into OpenCore's ACPI/Add list.

Decision: use the Dortania desktop `SSDT-EC-USBX-DESKTOP` pattern. Its source checks for existing EC devices and only adds a Darwin-specific _STA override to devices that have _HID/_CRS/_GPE but lack _STA. This H_EC already has _STA and already reports absent, so that override condition is not met. The SSDT still creates the separate fake `\\_SB.EC` device and `\\_SB.USBX`. Do not rename or delete the OEM H_EC.

### AWAC / RTC
- AWAC path: `\\_SB.AWAC`, HID `ACPI000E`.
- RTC path: `\\_SB.PCI0.LPCB.RTC`, HID `PNP0B00`.
- Both are controlled by the GNVS field `STAS`.
- AWAC returns present when STAS is 0 and absent otherwise.
- RTC returns present when STAS is 1 and absent otherwise.
- Dortania `SSDT-AWAC` sets STAS to `One` under Darwin, therefore selecting legacy RTC and hiding AWAC.

Important correction to earlier conversational notes: the STAS direction is **STAS=1 => RTC enabled / AWAC disabled**, not the reverse.

Decision: include `SSDT-AWAC.aml`; do not also add an RTC0 fake-clock SSDT unless later evidence proves the legacy RTC cannot be used.

### HPET
- Path: `\\_SB.PCI0.LPCB.HPET`, HID `PNP0103`.
- _STA and _CRS depend on GNVS fields `HPTE` and `HPTB`.
- Those fields are part of firmware GNVS; their runtime values are not established by static ASL alone.

Decision: no standalone HPET patch is currently justified by the Comet Lake desktop guide. Do not force HPTE/HPTB values or add an HPET SSDT speculatively.

### USB XHCI / RHUB
- Controller path: `\\_SB.PCI0.XHC`, _ADR `0x00140000`.
- Native child hub path: `\\_SB.PCI0.XHC.RHUB`.
- OEM DSDT defines RHUB and port objects beneath it; OEM SSDT4 contains further references/extensions to RHUB methods.
- DSDT contains HS01–HS14 and SS01–SS10 ACPI port objects (some SuperSpeed _ADR values are method-derived).
- Static ACPI cannot tell which physical motherboard sockets are actually wired/used.

Decision: include Dortania `SSDT-RHUB.aml`. Its implementation hides RHUB only when Darwin is detected, allowing macOS to rebuild the root hub/ports; Windows retains the OEM device. This is specifically recommended by Dortania for ASUS 400-series boards. Do not infer a final USB port map from ACPI object names alone; perform physical USB mapping after macOS boots.

### CPU
- DSDT contains 20 Processor objects: `\\_SB.PR00` through `\\_SB.PR19`.
- First processor path is `\\_SB.PR00`.
- Dortania's prebuilt `SSDT-PLUG-DRTNIA` explicitly supports this path.

Decision: include `SSDT-PLUG-DRTNIA.aml`. The 20 ACPI Processor declarations do **not** prove that the installed ES CPU has 20 active logical processors; actual core/thread topology must be read from the target CPU/firmware at runtime. Do not configure a core count from the number of ACPI declarations.

## 3. ACPI/Add decision list

| File | Decision | Reason |
|---|---|---|
| SSDT-PLUG-DRTNIA.aml | Include | CPU path is \\_SB.PR00 |
| SSDT-EC-USBX-DESKTOP.aml | Include | Native H_EC is hidden; desktop Fake EC + USBX required |
| SSDT-AWAC.aml | Include | B460/Comet Lake clock fix; GNVS STAS selects legacy RTC |
| SSDT-RHUB-B460M-PLUS.aml | Compile custom DSL first | Generic prebuilt AML path does not match this DSDT's XHC (no underscore) |
| SSDT-PMC.aml | Do not include | Not required for Comet Lake desktop |
| SSDT-RTC0*.aml | Do not include for now | Native legacy RTC exists and AWAC method selects it |
| Raw DSDT.aml | Do not add | Firmware already supplies DSDT |
| OEM SSDT.dsl files | Do not add manually | Firmware already loads OEM tables; these are analysis sources, not an OpenCore injection set |

## 4. What remains unverified / requires target-machine testing

1. Confirm CPU identity and actual active core/thread topology for the Intel Core i5-10500ES (6-core/12-thread) sample.
2. Confirm BIOS version and settings against the target board; static ACPI cannot report all live firmware settings.
3. Validate the compiled AML files with the exact OpenCore ACPI set and check for duplicate namespace objects.
4. Perform physical USB port mapping after first successful macOS boot. ACPI object labels are not a substitute for port-by-port testing.
5. Validate XFX Radeon RX 570 4GB (Polaris/Ellesmere) acceleration and display outputs after boot; this is outside ACPI static analysis.

## 5. Official references used

- Dortania Comet Lake desktop config: https://dortania.github.io/OpenCore-Install-Guide/config.plist/comet-lake.html
- Dortania prebuilt SSDTs: https://dortania.github.io/Getting-Started-With-ACPI/ssdt-methods/ssdt-prebuilt.html
- Dortania AWAC/RTC explanation: https://dortania.github.io/Getting-Started-With-ACPI/Universal/awac.html
- Dortania USB mapping: https://dortania.github.io/OpenCore-Post-Install/usb/manual/manual.html

This report records static analysis decisions. It is not a claim that an EFI has been built, compiled, boot-tested, or validated on the target machine.

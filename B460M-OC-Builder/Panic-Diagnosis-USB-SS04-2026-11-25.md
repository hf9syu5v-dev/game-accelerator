# B460M Sequoia panic diagnosis and targeted EFI revision

Date: 2026-11-25
Target: ASUS TUF GAMING B460M-PLUS / i5-10500ES / RX 570 / Sequoia 15.4 (Darwin 24.4.0)

## Evidence extracted from the user's GitHub screenshots

The screenshots in `efi 错误截图01目录/` were converted to JPEG and OCR'd by GitHub Actions run 45618972856. The original PNG files were not modified.

### Startup 04–05

- Repeated USB enumeration failures are logged on `SS04@14b00000`:
  - `AppleUSBHostPort::enumerateDeviceComplete_block_invoke: enumeration failed`
  - `AppleUSBHostPort::terminateDevice`
  - `AppleUSBHostPort::disconnect: persistent enumeration failures`
  - `AppleUSBHostPort::createDevice: failed to create device (0xe00002bc)`
- The log then reports a hub:
  - VID:PID `05e3:0610`
  - USB 2.1 Hub / 28
  - 480 Mbps
  - AppleUSB20Hub selected configuration 1

USB ID 05e3:0610 identifies a Genesys Logic USB 2.0/2.1 hub. The log's explicit port name is SS04, which matches the supplied UTBMap entry SS04 hardware index 20; its USB2 companion is HS04 hardware index 4.

### Startup 06–07

The panic is not an OpenCore picker or filesystem scan failure. macOS has entered Darwin 24.4.0 and initialized the recovery environment before panicking.

Panic signature:
```
panic(cpu 6 caller ...):
[kalloc.type.var6.16]: element modified after free
(off:8, val:0x0000000000000002, sz:16, ...)
```

Backtrace includes:
- `IOService::notifyInterestedDrivers`
- `IOService::ourChangeNotifyInterestedDriversWithChange`
- `IOService::startPowerChange`
- `IOPMService...`
- `IOPMWorkQueue...`

This is consistent with a kernel heap use-after-free detected during an IOKit power-change notification after USB hub enumeration. The screenshot does not show a third-party kext symbol in the panic backtrace, so it does not prove USBToolBox itself is the allocator-corruption source. The strongest actionable trigger in the log is the repeatedly failing SS04 port and the Genesys Logic hub that follows.

## EFI changes

1. Keep USBToolBox 1.2.0 enabled. Its documented purpose includes bypassing broken Intel 400-series RHUB ACPI definitions. Do not enable the separate SSDT-RHUB simultaneously.
2. Preserve the original user-supplied UTBMap as the standard candidate.
3. Add a separate diagnostic EFI variant that removes only:
   - HS04 (hardware index 4)
   - SS04 (hardware index 20)
   All other port definitions remain byte-for-byte equivalent at the logical property level.
4. Keep ScanPolicy at `0x00200703`; NVMe and SATA device bits remain disabled.
5. Set `Kernel -> Quirks -> PanicNoKextDump = false` in the generated config so subsequent panic evidence is not unnecessarily suppressed.
6. Keep all other ACPI, GPU, CPU, audio, SMBIOS, storage, and security settings unchanged.

## Validation and limits

- The standard candidate and targeted no-SS04 candidate are built independently by the existing OpenCore 1.0.8 DEBUG workflow.
- The targeted variant must pass the matching `ocvalidate`, verify the exact nine remaining map entries, retain the USB-only ScanPolicy, and preserve the picker timeout of zero.
- This is an evidence-based diagnostic mitigation, not proof of hardware repair until the target machine boots without the panic.
- If the recovery USB itself is physically connected through the disabled HS04/SS04 port pair, it may disappear when macOS takes over USB. The OpenCore picker can still see it at UEFI stage; this possibility is called out in the artifact README.
- No USB media or internal disk was written. No BIOS settings were changed. No installation, partitioning, or formatting was performed.

## References

- USBToolBox documents `-utbmapoff`, `-utboff`, and the Intel 400-series RHUB bypass: https://github.com/USBToolBox/kext
- Genesys Logic 05e3:0610 USB hub identification: https://rxtx.org/device/05e3-0610-hub
- OpenCore kernel panic troubleshooting: https://dortania.github.io/OpenCore-Install-Guide/troubleshooting/extended/kernel-issues.html

# B460M-PLUS Kext Download Verification

Date: 2026-11-25

## Result

The user ran `Download-B460M-Kexts-r3.ps1` successfully in Windows PowerShell. The console output reported successful download, extraction, bundle discovery, copy, and Info.plist presence checks for all six planned kexts.

| Kext bundle | Version | Result | Copied Info.plist SHA256 |
|---|---:|---|---|
| Lilu.kext | 1.7.2 | OK | B7798755A2DDA3006783341EFA5837444CEDA21C7A743651276E1ACCBB8D4DD3 |
| VirtualSMC.kext | 1.3.8 | OK | 6D3CF2E1EE61A428B3477CB332FBD285EBA715ECFCEB12A05CC7B3FDA2B95F89 |
| WhateverGreen.kext | 1.7.1 | OK | 6E973A3DC47F4B707828CB8F790F3A4CC4E32D9B01ACCFCB6C2433F8E6CFFB45 |
| AppleALC.kext | 1.9.8 | OK | 55A7B8FF8868F7EBA08ACDA3D7926A28F0A797780FDD73B0E155F157E122B185 |
| IntelMausi.kext | 1.0.8 | OK | 2B4E03BE83F14A2D49CDE3469E5B4FF3011FE8E9F3DB6BF22E5007C637929A24 |
| NVMeFix.kext | 1.1.3 | OK | 37C3F3927190728514EA7A352AE3909C23C9C76BB6305CEA4D7445FABDB31A30 |

## Workspace paths

- Archives and extraction: `Tools/Kext-Downloads`
- Copied bundles: `EFI/EFI/OC/Kexts`

## Scope and limitations

- The reported SHA256 values are for each copied `Contents/Info.plist`, not for the complete ZIP archive or complete kext bundle.
- This confirms local download/extraction/copy and basic bundle structure only. It does not prove that macOS has loaded the kexts or that the hardware works.
- The script reported that it did not modify `config.plist`, BIOS, disk partitions, Windows disks, or physical EFI volumes.

# Kext staging manifest — B460M-PLUS / Sequoia 15

Download RELEASE builds from the official Acidanthera releases. Do not put ZIP files themselves in this directory; extract the named `.kext` bundles here.

| Bundle | Version | Official release |
|---|---:|---|
| Lilu.kext | 1.7.2 | https://github.com/acidanthera/Lilu/releases/tag/1.7.2 |
| VirtualSMC.kext | 1.3.8 | https://github.com/acidanthera/VirtualSMC/releases/tag/1.3.8 |
| WhateverGreen.kext | 1.7.1 | https://github.com/acidanthera/WhateverGreen/releases/tag/1.7.1 |
| AppleALC.kext | 1.9.8 | https://github.com/acidanthera/AppleALC/releases/tag/1.9.8 |
| IntelMausi.kext | 1.0.8 | https://github.com/acidanthera/IntelMausi/releases/tag/1.0.8 |
| NVMeFix.kext | 1.1.3 | https://github.com/acidanthera/NVMeFix/releases/tag/1.1.3 |
| USBToolBox.kext | 1.2.0 | https://github.com/USBToolBox/kext/releases/tag/1.2.0 |
| UTBMap.kext | 1.1 | Supplied archive, inspected and stored at `UTBMap.kext/Contents/Info.plist` |

Kernel -> Add order: Lilu, VirtualSMC, WhateverGreen, AppleALC, IntelMausi, NVMeFix, USBToolBox, UTBMap. UTBMap is codeless (empty ExecutablePath) and must load after USBToolBox.

Do not add Wi-Fi/Bluetooth kexts: this target has no separate Wi-Fi or Bluetooth card. The user-supplied UTBMap 1.1 is now staged. It defines 11 ports (7 HS + 4 SS) with highest hardware index 20; this is 11 enabled mappings, below Apple's 15-port active-map limit. HS01-04 pair by index with SS01-04 (1-4 / 17-20). HS07 uses connector type 255. Physical port behavior must still be confirmed on the target board. USBToolBox 1.2.0 removes the broken 400-series RHUB ACPI ports, so do not inject SSDT-RHUB alongside it. SMCProcessor and SMCSuperIO are optional sensor plugins and are deferred.

Use the matching OpenCore 1.0.8 `ocvalidate` after config.plist is assembled.

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

Kernel -> Add order: Lilu, VirtualSMC, WhateverGreen, AppleALC, IntelMausi, NVMeFix.

Do not add Wi-Fi/Bluetooth kexts: this target has no separate Wi-Fi or Bluetooth card. Do not add USBToolBox/UTBMap until physical port mapping is performed. SMCProcessor and SMCSuperIO are optional sensor plugins and are deferred.

Use the matching OpenCore 1.0.8 `ocvalidate` after config.plist is assembled.

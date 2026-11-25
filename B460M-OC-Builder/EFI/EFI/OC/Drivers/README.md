# UEFI driver staging manifest

Use files from the same OpenCorePkg 1.0.8 DEBUG package as the initial bootloader.

Required for this configuration:
- `OpenRuntime.efi`
- `HfsPlus.efi` (from the matching OpenCore auxiliary binary package / HfsPlus source distribution)

Official OpenCore release: https://github.com/acidanthera/OpenCorePkg/releases/tag/1.0.8

Do not add OpenCanopy, AudioDxe, OpenShell or other optional drivers to the first-boot set unless a concrete requirement appears. Keep driver versions aligned with the OpenCore release.

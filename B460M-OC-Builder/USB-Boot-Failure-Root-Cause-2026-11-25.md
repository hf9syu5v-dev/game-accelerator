# B460M Sequoia USB boot failure — root cause and repair

Date: 2026-11-25

## Finding

The failure is not caused by Ventoy. OpenCore itself starts, but its picker cannot accept the USB volume under the configured scan policy.

The native USB builder previously used this DiskPart command:

`create partition primary size=16000`

On a GPT disk, Microsoft's documentation states that `create partition primary` without a type GUID creates a **Microsoft Basic Data** partition. A FAT32 filesystem does not change that GPT partition type.

The OpenCore first-boot policy is intentionally restrictive:

- `ScanPolicy = 0x00200703`
- `0x00000001`: filesystem lock
- `0x00000002`: device lock
- `0x00000100`: APFS
- `0x00000200`: HFS
- `0x00000400`: EFI System Partition filesystem
- `0x00200000`: USB devices

It deliberately excludes internal SATA/NVMe devices. OpenCore defines `0x00000800` as NTFS / Microsoft Basic Data filesystem scanning. That bit is not enabled, so a GPT Basic Data partition is filtered even if its contents are FAT32 and the firmware can launch `EFI/BOOT/BOOTx64.efi` from it.

This explains why BIOS can launch OpenCore but OpenCore's picker does not discover the recovery USB volume. The earlier static check verified GPT + FAT32 but did not verify the GPT partition type GUID; that was an audit gap.

## Correct fix

Do **not** weaken ScanPolicy to expose Basic Data/NTFS partitions or internal disks.

The USB partition must have the standard EFI System Partition GPT type GUID:

`C12A7328-F81F-11D2-BA4B-00A0C93EC93B`

The repair script `Repair-B460M-Sequoia-USB-EspType.ps1`:

1. Matches the USB by exact model, serial, bus type, and size.
2. Confirms the expected single GPT partition, E: FAT32 volume label, and required EFI/Recovery files.
3. If the partition is Basic Data, asks for the exact confirmation phrase.
4. Uses Windows `Set-Partition -GptType` to change only the GPT type GUID.
5. Does not format, repartition, erase, copy, or delete files.
6. Verifies the final ESP GUID and FAT32 volume.

If Windows removes the drive letter after the ESP conversion, that is normal for an EFI System Partition; the files remain on the USB.

## Permanent builder correction

The USB builder now uses:

`create partition efi size=16000`

It also verifies the ESP GUID after formatting. The read-only validator now checks both GPT + FAT32 and the ESP GUID, so this error cannot silently pass the same preflight again.

## ScanPolicy correction record

An intermediate diagnosis incorrectly swapped the NVMe and USB bit values. That change was reverted before it was accepted as the final configuration.

The correct OpenCore values are:

- USB device: `0x00200000`
- NVMe device: `0x00080000`

The intended `0x00200703` policy remains unchanged.

## Scope

The repair is limited to the LITEON USB with serial `000000123ADC`. It does not touch either internal NVMe disk. No macOS installation, internal partitioning, or internal formatting is authorized by this repair.

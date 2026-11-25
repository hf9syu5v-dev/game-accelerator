# BIOS Check 02 — CSM and Fast Boot

Date: 2026-11-25

Source screenshots:
- [CSM 01.png](../blob/main/BIOS%20%E6%A3%80%E6%9F%A5%2002/CSM%2001.png)
- [Fastboot 01.png](../blob/main/BIOS%20%E6%A3%80%E6%9F%A5%2002/Fastboot%2001.png)

## Verified settings

| BIOS page | Setting | Observed value | Assessment |
|---|---|---|---|
| Boot → CSM | Launch CSM | Disabled | Correct for the planned UEFI OpenCore boot path. No change needed. |
| Boot → Fast Boot | Fast Boot | Enabled | Disable before OpenCore installation/testing to avoid firmware fast-start behavior interfering with device initialization and boot troubleshooting. |

## Required action

1. Enter BIOS → Boot → Fast Boot.
2. Set **Fast Boot = Disabled**.
3. Save and exit.

Do not change CSM; it is already Disabled.

## Safety boundary

This is a BIOS-only adjustment. Do not change SATA/Intel RST/AHCI mode, boot order entries for Windows, partitions, or any internal disk contents. The Windows WD SN720 remains excluded from all installation and formatting operations.

## Remaining BIOS checks

- Secure Boot enforcement state: not yet conclusively verified.
- VT-x enable state: not yet conclusively verified.
- Execute Disable Bit: not yet verified.
- SATA mode: inspect only; do not change.

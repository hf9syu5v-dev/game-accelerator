# B460M-PLUS RHUB 补丁核验记录

日期：2026-11-25

## 核验对象

主板：ASUS TUF GAMING B460M-PLUS  
目标控制器：`\\_SB.PCI0.XHC`  
目标 Root Hub：`\\_SB.PCI0.XHC.RHUB`

## 原始 DSDT 证据

用户从仓库原始反编译文件下载：

`B460M-ACPI-Decompile-Output/Disassembled-ASL/DSDT.dsl`

PowerShell 搜索结果确认：

- 第 19071 行附近定义 `Device (XHC)`，位于 `Scope (_SB.PCI0)` 内。
- XHC 的 `_ADR` 为 `0x00140000`。
- 第 19929 行附近定义 `Device (RHUB)`，位于 XHC 设备内。
- RHUB 的 `_ADR` 为 `Zero`。
- 原始 DSDT 在第 20294 行附近另有 `Scope (_SB.PCI0.XHC.RHUB)`，其下定义 USB 端口设备。
- RHUB 本体包含 `_PS0`、`_PS2`、`_PS3`，未发现原有 `_STA`。
- RHUB 下可见 `HS01` 至 `HS10`、`USR1`、`USR2`、`SS01` 等端口设备。

## 自定义 SSDT

文件：`EFI/EFI/OC/ACPI/SSDT-RHUB-B460M-PLUS.dsl`

逻辑：

- External 路径指向 `_SB_.PCI0.XHC_.RHUB`；ACPI NameSeg 的下划线补齐是正常表示。
- 在 `_SB.PCI0.XHC.RHUB` 上增加 `_STA`。
- `_OSI ("Darwin")` 为真时返回 `Zero`，否则返回 `0x0F`。

已编译 AML：

- 文件：`EFI/EFI/OC/ACPI/SSDT-RHUB-B460M-PLUS.aml`
- 编译器：iasl 20250807
- 编译错误：0
- 编译警告：0
- AML 大小：109 bytes
- ACPI 签名：SSDT
- SHA256：`D207319C650F37F6430440A8259D61E0ECA55331F20D7D8D5DE51C09840880A3`

## 结论与限制

1. 原始 DSDT 证实目标 XHC/RHUB 路径正确。
2. 原始 RHUB 未定义 `_STA`，未发现新增 `_STA` 与原有同名方法冲突；`_PS0/_PS2/_PS3` 是不同方法名。
3. 该补丁在 Darwin 下隐藏 RHUB，预期让 macOS 重新枚举 USB 端口；在非 Darwin 系统下返回设备可用状态。
4. Dortania 的 Fixing USB 文档说明，400 系列主板存在 OEM RHUB ACPI 实现问题时，可通过禁用 RHUB 让 macOS 重建端口；Dortania Comet Lake 配置说明将 ASUS 400 系列列为需要 RHUB 补丁的平台。
5. AML 编译成功和静态路径核验不等于已完成 macOS 实机验证。首次启动后仍须检查 USB 控制器枚举，并逐口实测 USB 2.0/3.x 端口，之后制作最终 USB 映射。
6. 在完成启动配置和后续检查前，不将该 AML 视为已经过实机验证的最终 USB 映射。

参考：
- https://dortania.github.io/Getting-Started-With-ACPI/Universal/rhub.html
- https://dortania.github.io/OpenCore-Install-Guide/config.plist/comet-lake.html

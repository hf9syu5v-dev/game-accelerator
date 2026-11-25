# ASUS TUF GAMING B460M-PLUS — EFI 深度复盘与递归修正报告

日期：2026-11-25  
目标：Intel Core i5-10500ES / XFX Radeon RX 570 4GB / macOS Sequoia 15  
基线：OpenCore 1.0.8 DEBUG  
报告状态：静态复盘与本地修正版完成；最终复修版 CI Run #46 尚处于 GitHub pending 队列，不能把它写成已通过。

## 1. 最终结论

**没有发现 EFI 目录缺文件、已启用路径断链、kext 架构错误或 config.plist 语法损坏。** Run #42 基线构建已由 CI 成功验证，包含匹配版本的 ocvalidate、kext 元数据与 x86_64 检查、ACPI AML 反编译、UTBMap 结构断言及 24 个 EFI 文件的 SHA-256 manifest。

深度复盘后发现并修正了三个可以提前处理的问题：

1. Picker 自动启动风险：Timeout 改为 0，必须手动选择。
2. 首次测试误选内部系统的风险：ScanPolicy 改为 USB-only，排除 SATA/NVMe 启动项扫描。
3. DEBUG 诊断信息不足：打开 ApplePanic、关闭 UEFI Watchdog，并增加 DEBUG_INFO 日志级别。
4. 新增更可靠的音频首测配置：基于**同型号非 Wi-Fi B460M-PLUS** 的参考 EFI，将 ALC S1200A layout 1 注入 HDEF。

**最重要的未解决风险是 USB 物理端口映射。** 当前 UTBMap 结构有效，但与同型号公开 EFI 的端口映射存在差异，不能声称所有后置/前置 USB 口都已映射正确。没有凭猜测替换用户原始 map。

## 2. 本次实际复核的文件

- Run #42 CI 原始 artifact：ID `15009119500`
- Run #42 workflow：<https://github.com/hf9syu5v-dev/game-accelerator/actions/runs/45589898536>
- Run #42 commit：`5f5ac304cf703a61f81eacda8e7e1b5c2f5e150d`
- 原始 CI artifact SHA-256：`c0f03f13ce2ebf2f49c6b5bc7db4399a3f6f79cc0c652d19a01841402e873b3e`
- 独立解压并审计的 EFI 文件数：24
- 原始 manifest：24/24 文件 SHA-256 匹配
- ZIP 完整性：通过
- 所有已启用的 ACPI、kext、UEFI driver 路径：存在
- 8 个 kext 的 Bundle ID、版本、可执行文件路径及 x86_64 架构：通过
- 3 张 ACPI AML：CI 中均成功反编译并产生非空 DefinitionBlock
- OpenCore 1.0.8 matching ocvalidate：Run #42 通过

## 3. 递归修正记录

### 3.1 Picker 自动启动保护

- `Misc -> Boot -> ShowPicker = true`
- `Misc -> Boot -> Timeout = 0`

效果：OpenCore 显示启动选择器并等待手动选择，不会倒计时后自动启动默认启动项。Timeout=0 的定义是禁用自动启动倒计时。参考：<https://dreamwhite.dev/OpenCorePkg-Documentation/docs/Misc/boot.html>

### 3.2 首次 USB 测试限制扫描范围

新增：

- `Misc -> Security -> ScanPolicy = 0x200703`（十进制 2098947）
- 组成：文件系统锁 0x1 + 设备类型锁 0x2 + APFS 0x100 + HFS 0x200 + EFI System Partition 0x400 + USB 设备 0x200000。

效果：首次测试时，OpenCore 只扫描 USB 设备上的 APFS/HFS/EFI 文件系统，不主动扫描内部 SATA/NVMe 启动项。这是减少误选 WD SN720 或 HP EX900 Plus 的保护措施，不是绝对安全边界；某些 USB 桥接设备可能被固件识别成其他设备类型。

**重要：这是 USB 首启测试配置，不是最终日常启动配置。** 它会隐藏内部 NVMe 上的 macOS 启动项。完成 USB picker 测试后，如果要从 HP EX900 Plus 启动已安装系统，需要另行生成允许 NVMe/APFS 扫描的安装/日常启动配置。ScanPolicy 只限制 OpenCore 启动项扫描，不会在 macOS 安装器运行后屏蔽磁盘控制器；但本项目仍未授权执行安装、格式化或分区。

参考：<https://dortania.github.io/OpenCore-Post-Install/universal/security/scanpolicy.html>

### 3.3 DEBUG 日志增强

新增/调整：

- `Misc -> Debug -> AppleDebug = true`
- `Misc -> Debug -> ApplePanic = true`
- `Misc -> Debug -> DisableWatchDog = true`
- `Misc -> Debug -> DisplayLevel = 0x80000042`（十进制 2147483714）
- `Misc -> Debug -> Target = 67`

效果：增加 INFO/WARN/ERROR 诊断信息，允许保存 panic 日志，关闭可能在 DEBUG 启动期间过早触发的 UEFI Watchdog。日志写入 OpenCore 所在启动卷；因此首次测试必须从独立 U 盘启动，不能从内部 EFI 启动。SysReport 保持关闭，避免无必要地导出硬件识别信息。

参考：<https://dortania.github.io/OpenCore-Install-Guide/troubleshooting/debug.html>

### 3.4 ALC S1200A 音频布局

先前版本没有注入 layout-id，是因为此前只有 Wi-Fi 变体和其他 B460 板的间接证据。复盘时找到更强证据：

- 参考项目：<https://github.com/Stick-Study/ASUS-TUF-GAMING-B460M-PLUS-HACKINTOSH>
- 该项目目标是同型号 **ASUS TUF GAMING B460M-PLUS 非 Wi-Fi** 主板。
- 其 config.plist 使用 HDEF 路径 `PciRoot(0x0)/Pci(0x1F,0x3)`，layout-id=1。
- 项目包含 ALCS1200A codec dump 与音频接口说明，并报告音频/麦克风可用。

因此修正版加入：

- HDEF：`PciRoot(0x0)/Pci(0x1F,0x3)`
- `layout-id = Data 01 00 00 00`（layout 1）

这是目前最有同型号证据支持的首测布局，但仍不是这台 ES CPU / BIOS 1601 机器的实测结果。首启后仍需测试后置 Line Out、前置耳机、前后麦克风、Line In、插孔检测与睡眠唤醒。

## 4. 修正版 EFI 独立检查

修正版由 Run #42 的 CI artifact 提取，修改 config.plist 后重新封装。对比原始 Run #42：

- EFI 文件路径集合完全相同：24 个文件。
- 只有 `EFI/OC/config.plist` 发生变化。
- 其余 23 个 EFI 文件与 Run #42 artifact 逐字节相同。
- config.plist 可由 Python plistlib 正常解析。
- 所有已启用 ACPI、kext、driver 的文件路径存在。
- 新增 HDEF layout-id 为正确的 4 字节 Data。
- ScanPolicy、Timeout、DEBUG 开关均为正确的数据类型和值。
- 所有 kext 可执行文件经本地 `file` 检查均包含 x86_64 Mach-O 架构；UTBMap 为预期 codeless kext。
- EFI bootloader / OpenCore / OpenRuntime / HfsPlus 均为 PE32+ x64 EFI 文件。

修正版本地 ZIP：

- 文件：`B460M-PLUS-Sequoia-OpenCore-1.0.8-DEBUG-EFI-REVIEWED.zip`
- SHA-256：`50df7e047287279081f0a931957abd646d923d1b170260eca97e7622cd6ef1a4`
- config.plist SHA-256：`54ea057e9ceb915c6118944d54461d9d9ccafe4a8896db207c4c6a0fea050702`

**CI 说明：** Run #42 的原始配置已通过 ocvalidate。修正版所新增的 ScanPolicy、DEBUG 布尔值/整数和 HDEF Data 属性均通过本地静态检查；对应最终 workflow Run #46（<https://github.com/hf9syu5v-dev/game-accelerator/actions/runs/45591588708>）在本报告生成时仍是 pending，尚未执行 ocvalidate。故不能声称修正版已经通过新的 CI ocvalidate。工作流中的断言已加入这些新值。

## 5. 各硬件模块复核结论

| 模块 | 当前配置 | 复核结论 |
|---|---|---|
| CPU i5-10500ES | 原生 CPUID，不注入 Cpuid1Data/Mask；iMac20,1 | 方向合理。WMI/CPU-Z 给出的 0xA0650 仍不是直接 CPUID 指令采集 |
| CFG Lock | AppleXcpmCfgLock=true | BIOS 中未找到 CFG Lock 项时的保守首测方案；实际 MSR 0xE2 锁定状态仍未知 |
| RX 570 Polaris | WhateverGreen；不加 agdpmod=pikera，不加 -wegnoegpu | 正确方向；QE/CI、DP 输出、硬解仍待实机验证 |
| UHD 630 | Headless platform-id Data 0300C89B | 与 Comet Lake 桌面 headless 配置相符；核显枚举/Quick Sync 待验证 |
| ALC S1200A | AppleALC 1.9.8 + HDEF layout 1 | 同型号参考支持，待实际音频接口测试 |
| Intel I219-V | IntelMausi 1.0.8 | kext 与网卡匹配；DHCP/吞吐/唤醒待测 |
| HP EX900 Plus NVMe | NVMeFix 1.1.3；不强制 ASPM | 保守；实际控制器 PCI ID 尚未只读确认 |
| USB | USBToolBox 1.2.0 + 用户 UTBMap 1.1 | 结构有效，但物理映射存在明显待核对项 |
| Wi-Fi / BT | 不加载无线 kext | 当前机器没有独立无线/蓝牙卡，正确地不加入无用驱动 |

## 6. USB 映射：本次发现的最高优先级风险

当前用户提供的 UTBMap：

| 逻辑名 | 硬件 index | Connector |
|---|---:|---:|
| HS01–HS04 | 1–4 | 3（USB 3 Type-A） |
| HS05 | 9 | 0（USB 2 Type-A） |
| HS06 | 10 | 0（USB 2 Type-A） |
| HS07 | 11 | 255（Internal） |
| SS01–SS04 | 17–20 | 3（USB 3 Type-A） |

共 11 项，index 唯一，port-count=20，结构断言通过。

但同型号非 Wi-Fi B460M-PLUS 的公开参考 USBPorts.kext 使用了更多 HS/SS 项（15 项），另一个 Wi-Fi 变体又采用不同映射。ASUS 官方手册列出：

- 后置：4 个 USB 3.2 Gen 1 Type-A + 2 个 USB 2.0 Type-A。
- 前置：1 个 USB 3.2 Gen 1 header（2 个端口）+ 2 个 USB 2.0 header（4 个端口）。

当前 11 项 map 看起来主要覆盖后置 4 个 USB 3.x 口、后置 2 个 USB 2.0 口及一个内部端口；前置 USB 3.x / USB 2.0 header 端口可能未全部纳入。这个判断是依据官方物理接口数量和同型号参考映射得出的风险提示，不等于已证明哪一个 index 对应哪一个插座。

**没有把用户 map 擅自替换为第三方 map。** 第三方 EFI 的 BIOS、主板批次、实际接线与测试范围不同，直接替换可能造成更严重的 USB 失效。此项必须在实机按每个后置/前置插座进行 USB 2/3 插拔验证后才能定案。

参考：
- 同型号非 Wi-Fi：<https://github.com/Stick-Study/ASUS-TUF-GAMING-B460M-PLUS-HACKINTOSH>
- B460M-PLUS Wi-Fi：<https://github.com/truedaz/OpenCore_ASUS-TUF-Gaming-B460M-Plus_i9-10850K_EFI>
- ASUS 官方手册：<https://dlcdnets.asus.com/pub/ASUS/mb/LGA1200/TUF_GAMING_B460M-PLUS/E17227_TUF_GAMING_B460M-PLUS_UM_V3_WEB.pdf>

## 7. 可能出现的问题与预期表现

| 测试阶段 | 可能问题 | 预期实现 / 判断方式 |
|---|---|---|
| BIOS 选 U 盘 | 固件不显示 USB UEFI 项 | 确认 UEFI 模式、CSM Disabled、Fast Boot Disabled；不要改 SATA/AHCI 或清 Secure Boot keys |
| OpenCore picker | 黑屏、分辨率异常、键盘无响应 | DEBUG OpenCore 应输出诊断信息；Picker 默认显示且不自动启动 |
| Picker 启动项 | 看不到内部 HP NVMe | 当前 ScanPolicy 有意屏蔽 NVMe；这是首测保护，不是 NVMe 故障 |
| macOS 内核早期启动 | EXITBS、内存映射或 MMIO 错误 | 保存 DEBUG log；按日志定位 DevirtualiseMmio / RebuildAppleMemoryMap，不要盲目同时切换多个 Quirk |
| CPU 初始化 | XCPM/CFG Lock panic | AppleXcpmCfgLock 当前为 true；若日志仍显示 MSR 0xE2 问题，再实测锁状态 |
| 显卡 | RX 570 黑屏或加速缺失 | 确认显示器接 RX 570 DP；检查 WhateverGreen 与设备枚举，不添加 Navi 参数 |
| UHD 630 | 核显未枚举或 Quick Sync 不可用 | 检查 BIOS iGPU Multi-Monitor 与 0300C89B；headless 不负责显示输出 |
| USB | 部分前置/后置端口失效 | 当前 map 可能不完整；按插座逐一验证 HS/SS 伴随关系 |
| 音频 | 有设备但无声音/麦克风 | 先测 layout 1，再按 codec dump 检查 jack；不能只凭 AppleALC 支持列表宣称完成 |
| Ethernet | 无链路或 DHCP 失败 | 检查 IntelMausi、I219-V 设备枚举、网线/路由器 |
| NVMe | 检测、APST 或唤醒异常 | 先只读确认控制器；保留 NVMeFix，不强制 nvmefaspm |
| 睡眠唤醒 | 睡眠后 USB/音频/网络失效 | 先完成 USB map，再逐项验证；当前未声称支持 |

## 8. 仍需保留的设置与后续注意

1. BIOS 1601 保持不刷写；VT-d Disabled、Above 4G Enabled、CSM Disabled、Fast Boot Disabled、SATA AHCI 保持现状。
2. 不清除 Secure Boot PK/KEK/DB/DBX，不加载默认密钥，不改变 Secure Boot Key Management。
3. `SecureBootModel=Default` 对 Sequoia 首次 USB 安装可用；若后续需要 macOS 14.4 及以上的 OTA 更新，按 Dortania 当前指南评估改为 `Disabled`。
4. SMBIOS 使用用户明确批准的临时测试身份。当前 GitHub 仓库是公开仓库，构建脚本/CI 断言中的临时 SMBIOS 值会公开可见；这不是登录凭据，但不应当作永久身份或长期 Apple 服务身份。用户计划在稳定后本地更换，后续不要把新的永久身份提交到公开仓库。
5. 当前 USB-only ScanPolicy 不适合作为最终从 HP EX900 Plus 启动 macOS 的日常配置；安装/日常启动阶段需要单独放开内部 NVMe/APFS 扫描。
6. 当前没有 Wi-Fi/BT 卡，不需要无线 kext；CPU/主板传感器插件是可选项，不影响首启。

## 9. 预期启动链路

1. BIOS 以 UEFI 模式从独立 USB 启动 `EFI/BOOT/BOOTx64.efi`。
2. OpenCore 1.0.8 DEBUG 读取 `EFI/OC/config.plist`，加载 OpenRuntime 与 HfsPlus。
3. 内置 Picker 显示并等待人工选择；当前 ScanPolicy 限制为 USB 启动项扫描。
4. 若后续接入 Sequoia 安装 USB，OpenCore 通过 APFS Jumpstart/HFS driver 识别安装环境。
5. ACPI 注入 PLUG、EC-USBX-DESKTOP、AWAC；USBToolBox + UTBMap 处理 XHC/RHUB 与端口属性。
6. Kernel 加载 Lilu、VirtualSMC、WhateverGreen、AppleALC、IntelMausi、NVMeFix、USBToolBox、UTBMap。
7. RX 570 负责显示；UHD 630 以 headless 模式供计算/视频功能；HDEF 使用 ALC S1200A layout 1。
8. 首次验证只停留在 Picker；本报告不授权安装、格式化、分区或修改内部 EFI。

## 10. 安全边界

- 本次只下载、解压、读取、校验并重新封装文件。
- 未写入 WD SN720。
- 未写入 HP EX900 Plus。
- 未写入任何 U 盘或内部 EFI 分区。
- 不包含 macOS 安装器，不执行安装、分区、格式化。
- 所有首次测试都应从单独的可移动 USB 启动。

## 11. 参考资料

- OpenCore 1.0.8 release：<https://github.com/acidanthera/OpenCorePkg/releases/tag/1.0.8>
- Comet Lake desktop quirks / SMBIOS：<https://dortania.github.io/OpenCore-Install-Guide/config.plist/comet-lake.html>
- Apple Secure Boot / OTA：<https://dortania.github.io/OpenCore-Install-Guide/config.plist/security.html>
- OpenCore DEBUG：<https://dortania.github.io/OpenCore-Install-Guide/troubleshooting/debug.html>
- ScanPolicy：<https://dortania.github.io/OpenCore-Post-Install/universal/security/scanpolicy.html>
- USBToolBox RHUB bypass：<https://github.com/USBToolBox/kext>
- AppleALC codecs：<https://github.com/acidanthera/AppleALC/wiki/Supported-codecs>

---

**最终判断：EFI 目录完整、静态配置合理，已完成可由软件证据支持的递归修正；但在 Run #46 新配置 CI 通过及实机 Picker/USB/硬件验证前，不应称为已硬件验证的最终生产 EFI。**

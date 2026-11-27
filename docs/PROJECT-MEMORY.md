# 黑苹果01项目记忆摘要

更新时间：2026-11-28

> 本文件是新窗口恢复入口。开始工作前先读本文件、核对仓库当前状态和项目历史，再继续。不得把本摘要当作完整35个窗口的逐字备份。

## 资料完整性声明
用户要求整理前35个窗口。当前会话只获得项目长期指令、部分项目历史摘要/近期对话、可检索的Library文件和GitHub仓库文档，并未获得35个窗口的全部逐字记录。因此本摘要是基于可见资料的可靠浓缩版，不声称已逐字读取全部35个窗口。缺失信息不得猜测；以后若有完整导出，应继续补充并标明来源。

## 1. 项目目标与工作方式
- 项目：黑苹果01。
- 目标：ASUS B460M平台安装macOS Sequoia，OpenCore 1.0.8 RELEASE。
- 简体中文，直接推进、少废话，不重复询问已知信息。
- 每次新任务先检查项目历史、项目文件、GitHub仓库和已确认决策。
- 不虚构脚本、文件、构建/测试结果、下载链接或设备识别结果。
- 用户要求继续时直接推进；只有缺少关键输入或需要用户操作/确认时才暂停。
- 不擅自推翻已确认的技术决策。

## 2. PowerShell交付规范（强制）
所有PowerShell脚本必须严格两步法：
1. 提供完整、真实存在且经过检查的.ps1文件下载链接。
2. 单独提供执行该.ps1文件的命令。
禁止把完整脚本作为大段命令让用户复制；禁止将下载和执行合并为一条命令。默认兼容Windows PowerShell 5.1。交付前检查语法、路径、依赖、执行逻辑和安全边界。没有实际创建并验证文件时，不得声称可下载。

## 3. 硬件基准（未经用户确认不得更改）
- 主板：ASUS TUF GAMING B460M-PLUS（非Wi-Fi版）
- CPU：i5-10500ES Comet Lake-S G0，6核12线程，CPUID 0x000A0650；不要擅自spoof。
- 独显：XFX RX570 4GB，Polaris/Ellesmere，PCI 1002:67DF，DP输出。
- 核显：Intel UHD630，设备ID 8086:9BC8，按既定方案headless。
- 网卡：Intel I219-V。
- 声卡：Realtek ALC S1200A，codec 0x0B00。
- 内存：32GB DDR4。
- USB：已完成11端口映射，使用UTBMap.kext；不得要求重新映射或替换通用映射。
- 引导：OpenCore 1.0.8 RELEASE；目标系统macOS Sequoia。

## 4. 已确认BIOS设置
- VT-d Disabled；Above 4G Decoding Enabled；iGPU Multi-Monitor Enabled；DVMT 512MB。
- CSM Disabled；Fast Boot Disabled；VT-x Enabled；SATA AHCI；Secure Boot设为Other OS。
- BIOS中未找到CFG Lock菜单；不得声称已关闭CFG Lock。
- 后续调整前核对实际设置，不重复要求用户查找已确认不存在的菜单。

## 5. 当前磁盘规划（2026-11-28最新）
- 256GB移动磁盘：已用分区大师删除所有分区，计划作为OpenCore + macOS Sequoia Recovery启动/安装介质。
- HP 250GB NVMe：之前安装Windows 10，资料已备份，用户明确允许整盘清空，作为Sequoia系统目标盘。
- Samsung 860 EVO 250GB：原系统盘；安装期间物理断开SATA数据线，避免安装器误写入。
- 旧方案中的8GB U盘和128GB SATA硬盘已被新方案取代，不再作为当前方案。
- 256GB移动盘和HP NVMe的型号、序列号、Windows磁盘编号尚未由用户贴出命令输出确认。禁止猜测编号或执行清盘/分区脚本。
- 下一步先让用户在Windows PowerShell运行以下只读识别命令并回传输出：
  Get-Disk | Format-Table Number,FriendlyName,SerialNumber,BusType,PartitionStyle,Size,IsBoot,IsSystem -AutoSize
  Get-CimInstance Win32_DiskDrive | Format-Table Model,Size,InterfaceType,SerialNumber -AutoSize
- 确认身份后再规划256GB移动盘GPT/EFI/FAT32布局及文件部署。
- HP NVMe应在macOS Recovery磁盘工具中选择“显示所有设备”，确认物理设备后整盘抹掉为GUID Partition Map + APFS，卷名Sequoia；不建议Windows预先格式化。
- 任何格式化、分区、清盘或写EFI操作前，必须确认型号、容量、序列号/设备身份及磁盘编号；破坏性脚本必须有明确目标盘二次确认。
- 用户明确保护Samsung 860 EVO、E:、F:、F:\com.apple.recovery.boot、F:\com.apple.recovery.boot-SEQUOIA-STAGING，不得触碰。

## 6. EFI与GitHub构建记录
仓库：https://github.com/hf9syu5v-dev/game-accelerator
相关分支：main、opencore-1.0.5-sequoia-rx570。

必须区分两份EFI：
1. EFI01：README链接的“华硕B460黑苹果基准EFI01”，是VESA显示诊断基准。文档docs/华硕B460黑苹果基准EFI01.md位于main分支。它包含-radvesa与-wegnoigpu，用于键盘输入A/B测试；不能据此认定RX570/UHD630完整图形加速已启用。用户反馈此基准实机测试通过。
2. EFI02：用户后来选定的OpenCore 1.0.8 RELEASE基准EFI包。Actions run 45859349639，artifact ID 15138240431，名称B460M-Baseline-EFI-02-OpenCore-1.0.8，分支opencore-1.0.5-sequoia-rx570，构建提交5f728f133f4583fd46c8068a798f77d68dae505b。曾通过GitHub连接器下载到临时文件引用，但必须重新检查当前ZIP、config.plist和EFI结构后才能部署。不得把EFI01 VESA诊断版误当成EFI02。
- EFI02早期分析曾提示SMBIOS占位值/ROM为零；必须检查当前artifact实际内容，不可仅凭旧摘要断言。
- 不把CI构建成功说成实机启动成功。真实硬件启动、图形加速、睡眠、电源管理需分别实测。
- 修改EFI前先检查原始文件和config.plist；保留原始版本、备份和变更记录。
- 保留UTBMap.kext的11端口映射。
- 优先沿用已确认EFI02，不擅自改成诊断EFI01或另建替代方案。
- 用户曾报告Update-B460M-Baseline-EFI02.ps1停在“Expected exactly one physical Intel I219-V adapter; found 0.”；用户明确不希望再次运行此脚本，不要再建议重复运行。
- 之前出现过同一artifact哈希陈述不一致/未经实际复核的情况。不得引用未在当前会话真实计算的SHA256。
- 用户提供过临时测试SMBIOS/MAC/ROM值。不要把序列号、MLB、ROM、UUID、MAC等设备标识写入公开GitHub记忆文件或公开日志；正式三码由用户自行生成替换。

## 7. Windows环境
- 默认兼容Windows PowerShell 5.1。
- 用户目录：C:\Users\客厅电脑
- Python路径曾确认：C:\Program Files\PyManager\python.exe
- 用户要求脚本必须提供可下载文件，不让其复制长代码。
- Build-B460M-OC108.ps1曾生成staging目录；脚本说明明确表示不是可启动EFI（缺最终config.plist/ACPI/USB配置等），不得把该staging包说成可启动。

## 8. 近期GitHub Actions历史
- 用户曾要求在hf9syu5v-dev/game-accelerator上继续多轮Actions构建。
- 可见历史包含run 45564108710、45564516446、45565073894，以及基准构建run 45859349639。各run当前状态和具体结果必须重新打开Actions核实，不能根据旧聊天猜测。
- EFI01文档还记录键盘移植测试的多个Actions run，详见main分支docs/华硕B460黑苹果基准EFI01.md。
- 后续批量运行Actions前先确认workflow、分支、输入参数和前一轮结果，避免无意义重复构建。

## 9. 当前待办与恢复点
优先顺序：
1. 获取并核实256GB移动盘与HP 250GB NVMe实际型号、容量、序列号、BusType和Windows磁盘编号（只读识别）。
2. 检查artifact 15138240431真实内容：EFI目录、OpenCore版本、config.plist、ACPI、Kext、Drivers、UTBMap、SMBIOS占位项、ROM设置；形成检查报告。
3. 根据实际EFI检查结果，确定256GB移动盘启动/Recovery布局和文件来源。
4. 制作严格两步法PowerShell脚本：先提供下载文件，再给独立执行命令。脚本先做只读识别/验证；破坏性操作须显式确认，且不得触碰保护盘。
5. 制作启动盘后，物理断开Samsung 860 EVO，使用HP NVMe安装Sequoia。
6. 首次安装重启仍从OpenCore启动，直到进入桌面；之后再处理引导安装、正式三码和硬件验收。

## 10. 新窗口快捷恢复指令
“读取并遵循黑苹果01项目记忆：先读取GitHub仓库docs/PROJECT-MEMORY.md，检查仓库当前状态及相关文件；结合当前项目历史继续执行，不重复询问已知信息。所有PowerShell脚本严格下载/执行两步法；磁盘操作先识别设备身份并设置二次确认。先处理本文件‘当前待办与恢复点’中的最高优先级事项，并在完成实质变更后更新本记忆文件。”

## 11. 历史完整性
用户提出读取前35个聊天窗口。当前环境未向本次对话提供这35个窗口的全部逐字记录；已综合可见项目长期规范、项目摘要、近期对话片段、Library中可检索脚本和GitHub文档。以后如提供历史窗口完整导出，应补充本摘要并注明证据来源和日期。


## 12. 2026-11-28 EFI02 artifact实物检查结果
已重新下载并检查Actions artifact 15138240431（名称B460M-Baseline-EFI-02-OpenCore-1.0.8.zip）：
- 外层ZIP SHA-256：e28d7fc6aa3096d01266b94db15255de62aad9c7e3ff39bc7b44f07cff409bcc
- 内层EFI ZIP SHA-256：baab37149a72b7a373adb92c6b575523bb97d57780cefb04f7ac9e7e2ad08271
- 内层包含107个ZIP条目；EFI-SHA256SUMS.txt列出的60项逐项核对通过，无缺失、无哈希不匹配。
- BUILD-REPORT.txt确认OpenCore 1.0.8 RELEASE、Sequoia目标；参考配置来源为Stick-Study/ASUS-TUF-GAMING-B460M-HACKINTOSH，固定提交f038b267ba00b862ea5c5cc289239286bbf9df66。
- 报告明确声明：此包配置校验/构建完成，但没有在目标PC实机启动测试。
- SMBIOS仍是公开占位符：SystemProductName iMac20,1，SystemSerialNumber和MLB为REPLACE_LOCALLY，SystemUUID全零，ROM六字节全零。未将任何用户真实/临时三码写入本记忆。
- Kernel/Add中Lilu、VirtualSMC、SMCProcessor、SMCSuperIO、WhateverGreen、AppleALC、IntelMausi、NVMeFix、RestrictEvents、USBToolBox、UTBMap、XHCI-unsupported均Enabled；USBInjectAll和USBPorts均Disabled。UTBMap已保留。
- ACPI启用SSDT-EC-USBX、SSDT-PLUG、SSDT-AWAC、SSDT-PMCR、SSDT-RHUB；DMAR删除项当前Disabled。
- UEFI Drivers启用HfsPlus、OpenRuntime、ResetNvramEntry、ToggleSipEntry；OpenCanopy Disabled。
- 当前boot-args为-v keepsyms=1 debug=0x100。
- UHD630属性为AAPL,ig-platform-id 0300913E（headless配置）；音频layout-id 1；没有看到RX570独显注入属性，需结合完整config和实机显示输出验证，不应据此宣称GPU加速。
- 发现Kernel Quirks中的XhciPortLimit为True。此项需在最终部署前结合Sequoia兼容性及已完成UTBMap的配置审查，不要未经验证直接改动。
- 当前结论：EFI02是完整的配置基准包，但不能原样直接写盘作为最终可用EFI；至少必须先填入有效的本机SMBIOS标识，并审查上述配置项。部署前仍需校验config.plist与OpenCore 1.0.8 ocvalidate。


## 13. 2026-11-28本轮续接复核与待办更新
### EFI02当前artifact和CI日志复核
- 再次读取GitHub Actions run 45859349639：status=completed，conclusion=success；head branch为opencore-1.0.5-sequoia-rx570，head SHA为5f728f133f4583fd46c8068a798f77d68dae505b。
- Artifact 15138240431仍存在且未过期；GitHub API digest为sha256:e28d7fc6aa3096d01266b94db15255de62aad9c7e3ff39bc7b44f07cff409bcc，与本轮实际下载的外层ZIP哈希一致。
- 本轮重新解析外层ZIP和内层EFI ZIP，内层107个条目；OpenCore config位于EFI/OC/config.plist；EFI-SHA256SUMS.txt在外层artifact根目录，列出60个文件。内层EFI ZIP哈希仍为baab37149a72b7a373adb92c6b575523bb97d57780cefb04f7ac9e7e2ad08271。
- 读取该run的完整job日志：明确执行OpenCore 1.0.8 RELEASE包内的ocvalidate；日志输出“Completed validating staging/EFI/OC/config.plist in 1 ms. No issues found.” 因此应更正第12节中“部署前仍需校验config.plist与OpenCore 1.0.8 ocvalidate”的未完成表述：CI的ocvalidate验证已成功；本地部署前仍应针对任何后续修改再次运行对应版本校验。
- job各步骤均completed/success，包括参考EFI下载、官方OpenCore/kext下载、EFI组装、ocvalidate、严格文件检查、artifact上传和release发布。该结果只代表CI构建与静态配置验证，不代表目标电脑实机启动。
- Workflow源文件：.github/workflows/build-b460m-baseline-efi02-latest.yml。其固定下载OpenCore 1.0.8 RELEASE，并调用oc-release/Utilities/ocvalidate/ocvalidate staging/EFI/OC/config.plist。
- 当前EFI02 config再次确认：Kernel Quirks XhciPortLimit=True；ACPI/SSDT-DMAR.aml文件存在但配置项未启用；UTBMap.kext Enabled且USBToolBox.kext Enabled；USBInjectAll.kext和USBPorts.kext Disabled；UTBMap内映射数量在CI严格检查中断言为11。
- Kext版本从本轮实际bundle Info.plist读取：Lilu 1.7.2、VirtualSMC 1.3.8、WhateverGreen 1.7.1、AppleALC 1.9.8、IntelMausi 1.0.8、NVMeFix 1.1.3、RestrictEvents 1.1.6、USBToolBox 1.2.0、UTBMap 1.1、XHCI-unsupported 0.9.2。SMCProcessor与SMCSuperIO随VirtualSMC release更新。
- DeviceProperties当前有UHD630 headless平台ID 0300913E、板载音频layout-id 1；config没有为RX570单独添加DeviceProperties。RX570为Polaris原生支持路线，是否实际驱动加速必须在目标机进入macOS后用系统信息/IORegistry/Metal等核验，不能用“没有显卡注入”简单推断失败。
- 当前必须优先审查XhciPortLimit=True与Sequoia、已完成11端口UTBMap的兼容性；尚未修改该值，避免在没有记录和回退点的情况下擅改EFI。
- SMBIOS仍为占位符：iMac20,1，序列号/MLB为REPLACE_LOCALLY，UUID全零，ROM六个零字节。EFI02不能原样作为正式EFI部署。

### 只读磁盘识别脚本交付
- 已在本轮真实创建 /mnt/data/B460M-ReadOnly-Disk-Inventory.ps1，约3.3KB，UTF-8 BOM，PowerShell 5.1目标。
- 脚本只执行Get-Disk与Get-CimInstance Win32_DiskDrive查询并打印物理磁盘信息；静态检查确认文件存在、括号平衡、查询命令存在、不包含Format-Volume/Clear-Disk/Initialize-Disk/New-Partition/Remove-Partition/Set-Disk等写入/破坏命令。
- 已向用户提供下载链接sandbox:/mnt/data/B460M-ReadOnly-Disk-Inventory.ps1及独立执行命令；当前等待用户运行并回传输出。Windows PowerShell真实运行测试尚未完成。
- 当前磁盘设备身份仍未确认；256GB移动盘和HP NVMe的型号、序列号、BusType、Windows磁盘编号继续列为第一优先待办。未执行任何磁盘写入操作。


## 13. 2026-11-28 Windows磁盘只读识别结果
用户运行B460M-ReadOnly-Disk-Inventory.ps1并回传Get-Disk与Win32_DiskDrive输出：
- Disk 0：Samsung SSD 860 EVO 250GB，约232.89GB，SATA/ATA，MBR，IsBoot=True、IsSystem=True，当前Windows系统盘。必须保护，不得写入。
- Disk 1：Samsung SSD 860 EVO USB Device，约232.89GB，USB，GPT，非启动/系统盘。它是否为计划中的256GB移动安装介质尚未确认；其报告型号为Samsung 860 EVO USB，不应擅自将其认定为其他型号。
- HP 250GB NVMe未出现在Get-Disk或Win32_DiskDrive结果中，尚未被Windows识别。
- 本次识别只读，没有进行磁盘更改。禁止根据旧计划假定HP NVMe已出现，也禁止对Disk 1写入，直到用户确认其物理身份和用途。
- 下一步：查明Disk 1是否就是用户所说的移动安装盘；同时让HP NVMe在Windows中可见并重新运行只读识别。Disk 0始终作为当前系统盘保护。磁盘编号可能变化，后续每次操作前都要重新核验。


## 14. 2026-11-28 设备识别结果适用范围更正
用户明确说明：刚才运行B460M-ReadOnly-Disk-Inventory.ps1并回传输出的电脑是“辅助电脑”，不是ASUS TUF GAMING B460M-PLUS黑苹果目标本机。
因此第13节中的Disk 0和Disk 1只代表辅助电脑的磁盘，不能用来识别、判断或排除黑苹果本机的256GB移动盘和HP NVMe。尤其不能据“辅助电脑未发现HP NVMe”推断目标本机未发现HP NVMe。
- 辅助电脑Disk 0为其Windows系统盘Samsung 860 EVO；必须保护辅助电脑系统盘。
- 辅助电脑Disk 1为其USB连接的Samsung 860 EVO设备；其用途与目标安装介质身份尚未确认，不对其进行写入。
- 目标本机的磁盘身份仍完全待核实。下一步应在ASUS TUF GAMING B460M-PLUS那台电脑上运行同一个只读识别脚本，并回传完整输出；若该机器当前不是Windows或无法运行脚本，再根据实际系统调整识别方式。

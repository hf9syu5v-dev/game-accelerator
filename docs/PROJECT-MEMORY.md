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


## 15. 2026-11-28 工作电脑与目标机职责最终澄清
用户进一步明确：磁盘识别脚本本来就应在辅助电脑运行；ASUS TUF GAMING B460M-PLUS黑苹果目标机目前没有操作系统，无法运行Windows PowerShell。辅助电脑负责下载EFI/Recovery资源、准备移动安装介质和执行只读/制作工具。
- 因此辅助电脑的Disk 0/Disk 1识别结果正是准备启动介质时应参考的工作电脑结果，而不是要求用户把脚本转移到目标机。
- Disk 0是辅助电脑当前Windows系统盘，严禁触碰。
- Disk 1是USB连接的Samsung SSD 860 EVO，约232.89GB；可能对应用户计划的256GB移动安装盘，但仍需用户确认其物理身份。确认前不对Disk 1写入。
- HP 250GB NVMe安装目标盘留在无系统的黑苹果目标机内部，不会自然出现在辅助电脑的Get-Disk结果中；不应要求用户为了识别它而在目标机运行Windows。后续可在macOS Recovery磁盘工具中识别并抹盘，届时仍须先核对物理型号/容量再执行。
- 目前唯一必要的用户确认：辅助电脑Disk 1（USB Samsung SSD 860 EVO，232.89GB）是否就是那块计划用作OpenCore + Sequoia Recovery安装介质的256GB移动盘。


## 16. 2026-11-28 安装介质身份确认与新构建方案
用户已明确确认：辅助电脑 Disk 1（USB接口 Samsung SSD 860 EVO，约232.89GiB/标称250GB）就是原规划的256GB移动安装盘，作用相当于之前的8GB U盘。该盘用于OpenCore + macOS Sequoia Recovery；辅助电脑Disk 0仍为Windows系统盘，永久保护。HP 250GB NVMe位于无系统的黑苹果目标机内部，不应要求它出现在辅助电脑磁盘列表中。
### 现有旧构建脚本不可用于当前安装盘
- 检查分支opencore-1.0.5-sequoia-rx570中的Build-B460M-Sequoia-Native-Recovery-USB.ps1、Start-B460M-Sequoia-USB-Build.ps1、Repair-B460M-Sequoia-USB-EspType.ps1。
- 这些旧脚本把目标硬盘硬编码为LITEON I T LCS-128L9S、115–125GB，尽管串号字符串与当前USB设备相同，但当前设备报告型号为Samsung SSD 860 EVO、容量约232.89GiB。旧脚本的型号和容量条件不匹配，严禁让用户运行旧脚本或修改后猜测执行。
### EFI02与Sequoia配置复核
- 重新下载并检查artifact 15138240431，外层ZIP SHA-256仍为e28d7fc6aa3096d01266b94db15255de62aad9c7e3ff39bc7b44f07cff409bcc；内层EFI ZIP SHA-256为baab37149a72b7a373adb92c6b575523bb97d57780cefb04f7ac9e7e2ad08271。
- EFI02源配置当前Kernel.Quirks.XhciPortLimit=True、Misc.Boot.Timeout=5、Misc.Security.ScanPolicy=0，与Sequoia+已完成UTBMap的首启安全配置不合适。首启介质本地构建时需改为XhciPortLimit=False、Timeout=0、ScanPolicy=0x200703（仅USB/APFS/HFS/ESP扫描），并保持Picker显示、UTBMap 11端口映射不变。
- OpenCore官方1.0.8 RELEASE包asset digest已通过GitHub API读取：2011e8b7216ecb2645d97ea710df965947edd406846e92050b9bc4190be6d27b。
- 当前Dortania OpenCore Install Guide的Sequoia下载指引使用Board-ID Mac-7BA5B2D9E42DDD94；macrecovery会校验Apple chunklist并校验DMG分块哈希。指南同时警告macOS 11.3+的XhciPortLimit不可用，已映射USB应关闭该Quirk。参考：Dortania Windows install guide / recovery guide。
### 本轮本地交付文件（未提交公开仓库）
- 已真实生成/mnt/data/B460M-Baseline-EFI-02.zip，从已下载的EFI02 workflow artifact内部原始ZIP字节提取，大小4,647,868 bytes，SHA-256 baab37149a72b7a373adb92c6b575523bb97d57780cefb04f7ac9e7e2ad08271。该包供本地构建脚本校验，不把公开release资产的不同digest混用。
- 已真实生成/mnt/data/Build-B460M-Sequoia-USB-Samsung-256GB.ps1，约21.6KB，PowerShell 5.1目标，SHA-256 9b400a0a10159dec0f5ff63e915a314ba5f674dd2965ceb4c175d9ceaa922fed。
- 新脚本仅匹配辅助电脑USB设备的准确型号、串号、USB总线和225–240GiB容量范围，不硬编码磁盘编号；并通过Win32_DiskDrive交叉核对。要求目标盘当前无分区，且IsBoot/IsSystem均为False。
- 新脚本明确不使用/不分配E:或F:；从G:–Z:动态选择空闲盘符。
- 新脚本在任何写盘前先下载并校验EFI02包与OpenCore 1.0.8 RELEASE工具包，下载Sequoia Recovery并由macrecovery验证Apple chunklist；检查EFI文件、启用kext/ACPI/driver路径和UTBMap 11端口。
- 新脚本在本地config.plist中应用此前用户批准的临时测试SMBIOS集（不将其值写入本记忆或公开仓库），并设置XhciPortLimit=False、Picker Timeout=0、ScanPolicy=0x200703；保持EFI02 OpenCore 1.0.8 RELEASE基线。
- 新脚本格式化前再次按身份重新匹配目标盘，并要求精确输入包含USB设备串号的确认短语。只创建16GB GPT EFI System Partition/FAT32，其余容量保持未分配。格式化后核验ESP GUID、FAT32卷标和逐文件SHA-256；不触碰Disk 0、HP NVMe、E:、F:或Samsung SATA系统盘。
- 对嵌入Python配置补丁已在实际EFI02副本上执行，返回EFI02_LOCAL_PATCH_AND_STRUCTURAL_CHECK=PASS，并验证11端口UTBMap、XhciPortLimit=False、Timeout=0、ScanPolicy=0x200703及ROM Data类型。
- 静态检查确认PowerShell脚本文件存在、PS 5.1/Admin要求、目标身份匹配、确认机制、E/F排除、哈希检查、括号平衡和Python补丁块结构。当前执行环境没有Windows PowerShell运行时，因此尚未在真实Windows PowerShell 5.1中做解析/运行测试；必须如实说明，不得宣称已实机执行成功。
### 当前待办
1. 用户下载上述PS1和EFI02 ZIP到辅助电脑Downloads同一目录。
2. 以管理员身份运行PS1；先让脚本下载Recovery、做校验，确认目标设备身份后，再由用户在脚本内输入精确确认短语才会格式化USB。
3. 构建成功后，将USB接入ASUS TUF GAMING B460M-PLUS，首次只测试能否显示OpenCore Picker；不要在本轮自动抹除HP NVMe。
4. 目标机从Recovery启动后，先在磁盘工具“显示所有设备”中识别HP NVMe的实际型号和容量，再确认物理设备后抹为GUID/APFS/Sequoia；Samsung 860 EVO SATA系统盘安装期间物理断开。
5. 每次关键变更继续更新本文件；不把临时SMBIOS值写入公开GitHub。


## 17. 2026-11-28 新构建脚本最终文件校验更正
- 最终版脚本已在本轮再次修正并重新静态检查；以此节为准，覆盖第16节最初记录的脚本SHA。
- 最终文件：/mnt/data/Build-B460M-Sequoia-USB-Samsung-256GB.ps1；大小21,442 bytes；SHA-256 0dd4f9d379719f43687ec2275316958f2588a8da510ebd3fe7fdeb5e03cc5ba6。
- EFI02本地包：/mnt/data/B460M-Baseline-EFI-02.zip；大小4,647,868 bytes；SHA-256 baab37149a72b7a373adb92c6b575523bb97d57780cefb04f7ac9e7e2ad08271。
- 最终脚本内嵌Python补丁已在实际EFI02包的临时解压副本上再次执行成功，返回EFI02_LOCAL_PATCH_AND_STRUCTURAL_CHECK=PASS；验证ROM为6字节Data、UTBMap=11、XhciPortLimit=False、Picker Timeout=0、ScanPolicy=0x200703。
- 最终静态检查：PowerShell 5.1/Admin要求、型号/串号/USB总线/容量匹配、CIM交叉核对、启动/系统盘排除、目标无分区前置条件、动态G:–Z:盘符（排除E:/F:）、精确确认短语、EFI与OpenCore包SHA校验、Sequoia Board-ID、括号平衡均通过。
- 当前执行环境无Windows PowerShell运行时，不能宣称PowerShell解析或实机执行已通过。用户在辅助电脑以管理员身份运行后，先观察只读识别/下载校验阶段；只有所有检查通过并输入精确确认短语后才会格式化USB。



## 18. 2026-11-28 USB构建脚本空盘检测故障与修复
- 用户在辅助电脑以管理员Windows PowerShell 5.1运行Build-B460M-Sequoia-USB-Samsung-256GB.ps1，脚本在开头目标盘分区状态检查处停止，错误为：找不到任何“DiskNumber”属性等于“1”的MSFT_Partition对象。
- 该错误来自对空磁盘调用Get-Partition -DiskNumber并设置ErrorAction Stop。目标USB先前已删除全部分区；在部分Windows Storage模块版本中，无分区时Get-Partition抛出“找不到MSFT_Partition对象”，而不是返回空集合。
- 根据执行顺序，该异常发生在任何DiskPart/clean/format/partition命令之前；本次没有执行清盘或分区写入。用户回传日志未显示后续步骤启动。
- 已在本地修订脚本：新增Get-TargetPartitions函数，直接查询root/Microsoft/Windows/Storage中的MSFT_Partition CIM类；空结果作为正常零分区状态，CIM提供程序/访问错误仍会终止脚本。将初始检查、下载准备后的复核、最终写盘前复核三处Get-Partition查询全部替换为该函数。
- 修订文件路径：/mnt/data/Build-B460M-Sequoia-USB-Samsung-256GB.ps1；SHA-256：f137d3ad339f4daf87203c55870eaf67004be3a76db3636b28bd62f0430b86b2。
- 本地静态检查通过：三处调用均已替换；不再含旧Get-Partition -DiskNumber查询；目标USB型号/序列号/USB总线/容量校验、Win32_DiskDrive交叉校验、IsBoot/IsSystem保护、E:/F:排除、精确破坏性确认、DiskPart clean仍位于用户确认之后，均保留。
- 验证限制：当前工作容器没有Windows PowerShell 5.1、PowerShell 7、Windows VM或可用的GitHub Actions workflow-dispatch工具；因此修订版尚未完成真实PowerShell 5.1解析/运行、Windows VM测试或GitHub Actions测试。不得声称修订版已经通过这些测试，也不得让用户将其视为已完成验证的正式构建脚本。
- 下一步：先取得Windows PowerShell 5.1解析与模拟空/非空MSFT_Partition查询的验证，再执行GitHub Actions验证；两项通过后才发布修订脚本下载链接和独立执行命令。验证完成前不得对目标USB运行修订脚本。



## 19. 2026-11-28 空盘检测修复的Windows PowerShell 5.1 / GitHub Actions回归验证
- 为避免将临时测试SMBIOS、真实设备序列号等内容提交到公开仓库，没有上传完整本地USB制作脚本；在仓库新增了隔离回归测试文件tests/powershell/Get-TargetPartitions.Tests.ps1，其中测试的Get-TargetPartitions函数与本地修订脚本实现一致。
- 新增workflow：.github/workflows/test-empty-disk-partition-query.yml，运行环境Windows Server 2022 / Windows PowerShell 5.1，触发事件push和workflow_dispatch。
- Workflow run：46063517821；提交：590e7a3ec6333fcf24cf9c4a2d0f8829570dc700；最终job powershell-51-regression completed/success。
- 日志实际证明：POWERSHELL_51_PARSE=PASS；EMPTY_DISK_RETURNS_ZERO_PARTITIONS=PASS；NONEMPTY_DISK_RETURNS_ALL_PARTITIONS=PASS；CIM_PROVIDER_FAILURE_STOPS_BUILD=PASS；GET_TARGET_PARTITIONS_REGRESSION_TEST=PASS。
- 测试使用模拟Get-CimInstance，不读取、不更改任何runner物理磁盘；覆盖空分区结果、非空分区结果及CIM提供程序异常传播。
- 本次CI只验证了回归测试脚本自身的PowerShell 5.1语法，以及Get-TargetPartitions函数的模拟行为；没有解析或运行/mnt/data中的完整USB构建脚本，也没有进行完整Windows VM端到端构建测试。不得把该CI PASS描述为完整构建脚本已通过PowerShell解析或USB写盘测试。
- 本地修订脚本仍为/mnt/data/Build-B460M-Sequoia-USB-Samsung-256GB.ps1，SHA-256 f137d3ad339f4daf87203c55870eaf67004be3a76db3636b28bd62f0430b86b2；尚未向用户重新发布为可执行交付。
- 当前决定：空盘检测修复逻辑的Windows PowerShell 5.1回归测试和GitHub Actions测试通过；完整脚本的解析/端到端安全测试仍待完成。在完整验证前，用户不要执行修订脚本，不对Disk 1进行任何手动格式化或分区操作。


## 20. 2026-11-28 新窗口恢复核查与“继续黑苹果项目分析 (37)”资料边界
- 本轮开始时重新读取GitHub main分支docs/PROJECT-MEMORY.md；读取时文件blob SHA为3e2bba7dc562321770c10114823c4830d1fde5ec，内容已包含第1–19节及空盘检测修复记录。
- 重新核对main分支HEAD：4fe163a82e5907d5b68891a38fa7bcdbd9d8b2e6（提交信息docs: record PowerShell 5.1 empty-disk regression CI result）。此前对话中出现的802f7aed并非本次读取到的main HEAD，不再作为当前仓库版本依据。
- 用户要求总结“继续黑苹果项目分析 (37)”。本次可用上下文未包含该标题窗口的聊天正文或完整导出；项目文件检索也未找到该窗口记录。因此本节不伪造其内容。后续取得该窗口导出/内容后再补充摘要，并注明来源。当前只可总结本窗口用户新提供的错误输出、可见项目历史摘要及本次GitHub实际核查结果。
- 复核GitHub Actions run 46063517821：status=completed、conclusion=success，workflow为Test empty-disk partition query (Windows PowerShell 5.1)，head SHA 590e7a3ec6333fcf24cf9c4a2d0f8829570dc700。Job在Windows Server 2022执行独立tests/powershell/Get-TargetPartitions.Tests.ps1；步骤为解析该测试文件并运行模拟空盘/非空盘/CIM provider故障测试。
- 该workflow没有解析或运行本地完整Build-B460M-Sequoia-USB-Samsung-256GB.ps1，也没有真实Windows VM端到端构建、目标USB识别/写入测试。故只能认定Get-TargetPartitions回归逻辑通过Windows PowerShell 5.1模拟测试，不能认定完整制作脚本通过。
- 当前运行容器中未发现/mnt/data/Build-B460M-Sequoia-USB-Samsung-256GB.ps1和/mnt/data/B460M-Baseline-EFI-02.zip；此前会话提及的本地sandbox文件不能直接视为本轮仍存在。重新交付前必须重新生成文件并核验SHA及实际内容。
- 最新用户提供的PowerShell错误为：在Disk 1空分区状态查询时，Get-Partition抛出“找不到任何DiskNumber属性等于1的MSFT_Partition对象”；脚本随即BUILD_STOPPED。依据日志顺序，失败发生在写盘前，未执行DiskPart clean/格式化/分区操作。Disk 1仍是辅助电脑上用户确认的USB Samsung SSD 860 EVO（约232.89GiB/标称250GB）安装介质；Disk 0辅助电脑Windows系统盘永久保护；E:/F:及其保护目录不触碰。
- 本轮下一步：重新取得EFI02 artifact并重新构建可审计的本地脚本；将完整脚本纳入Windows PowerShell 5.1 Parser测试和隔离模拟测试（不得提交真实SMBIOS、真实设备序列号或私有标识）；检查所有路径/依赖/异常分支和写盘前后保护机制；尽可能在GitHub Actions Windows runner执行完整脚本的非破坏性测试。完整脚本未通过前不向用户发布可执行脚本、不要求用户运行、不对USB做任何写入。


## 21. 2026-11-28 USB制作脚本重建与Windows虚拟磁盘测试进展
- 本轮重新从Actions artifact 15138240431下载EFI02外层artifact；实际SHA-256为e28d7fc6aa3096d01266b94db15255de62aad9c7e3ff39bc7b44f07cff409bcc，与此前记录一致。并下载Run42 artifact 15009119500，确认其中包含用户此前批准的临时测试SMBIOS配置；实际值不写入本记忆和公开仓库。
- 重新生成本地专用EFI包/mnt/data/B460M-Baseline-EFI-02-Sequoia-USB.zip，SHA-256 e5d84d73bf5f8392fdbf0a5b954081b930098f357e3615a445cdc84d6e629680，包含60个EFI文件。仅在本地把Run42中用户批准的临时测试SMBIOS字段复制到EFI02 config.plist；ROM为6字节Data；XhciPortLimit=False、Misc.Boot.Timeout=0、Misc.Security.ScanPolicy=0x200703；UTBMap.kext Enabled且保留11端口映射。结构检查通过。此ZIP含临时SMBIOS，不得提交到公开GitHub。
- 重建本地PowerShell 5.1制作脚本/mnt/data/Build-B460M-Sequoia-USB-Samsung-256GB.ps1；当前本地文件SHA-256为379187decf5a196709e62baef04cdb289cb42efbdecc89b8c9f0841f96bc15c5。脚本不硬编码磁盘编号或设备序列号；按Samsung SSD 860 EVO型号前缀、USB BusType、225–240GiB容量筛选候选盘，再要求用户输入精确序列号并以Win32_DiskDrive交叉验证；IsBoot/IsSystem、Offline/ReadOnly保护；空盘检查使用MSFT_Partition CIM查询；E:/F:排除；盘符仅从G:–Z:动态选择；DiskPart clean在包含序列号的精确确认语句之后；下载Recovery、ocvalidate、chunklist及复制后SHA校验均有检查。
- 本地静态检查通过：脚本存在、括号/引号结构平衡、CIM空盘检测、设备型号/序列号输入、系统盘保护、E/F保护、确认语句、ocvalidate调用、Apple chunklist验证和逐文件哈希检查；EFI ZIP完整性、60文件结构、关键路径、SMBIOS非占位、ROM Data长度、Quirks/ScanPolicy/Timeout及UTBMap均通过Python结构检查。
- 为测试完整脚本，公开仓库新增了Windows Server 2022 / Windows PowerShell 5.1 workflow：.github/workflows/test-b460m-sequoia-usb-builder.yml，并保存本地脚本压缩fixture（不含真实磁盘序列号和SMBIOS值）。Run 46064574122成功，证明还原后的完整脚本通过Windows PowerShell 5.1 Parser，Get-TargetPartitions空/非空/CIM异常隔离测试通过。Run 46064508493为workflow中$LASTEXITCODE判定错误导致的测试失败，后续已修复为检查$?。
- 随后增加了临时VHDX测试，目的是在GitHub Windows runner虚拟机中实际执行DiskPart的GPT + EFI System Partition + FAT32/OC-SEQUOIA创建流程，不接触runner系统盘或用户磁盘。Run 46064773954、46064930280、46065104824、46065181758、46065295406、46065500493均未通过最终VHD分区验证；日志显示DiskPart成功创建/附加VHD、clean、convert gpt、create partition efi、format FAT32和assign drive letter，但Get-Partition -DriveLetter对EFI分区未返回对象。改用MSFT_Partition CIM和Win32_LogicalDisk后，当前日志显示分区查询返回4条记录但没有匹配到目标盘符；虚拟磁盘编号/查询范围仍需进一步核实，不能将此测试标为PASS。
- 因此目前可以确认：完整脚本在Windows PowerShell 5.1 Parser测试通过；Get-TargetPartitions模拟回归通过；DiskPart在CI临时VHD上执行GPT/EFI/FAT32命令成功，但VHD分区身份/ESP类型复核尚未通过。完整脚本端到端虚拟磁盘验证仍未通过，禁止向用户发布该脚本作为可执行正式版本，禁止用户再次运行，也不得对辅助电脑Disk 1进行任何手动写盘操作。
- 本地脚本和EFI ZIP仅在当前容器路径存在；正式交付前须重新核验文件存在、哈希、PowerShell 5.1 Parser、VHDX ESP验证和GitHub Actions全绿。不得声称目标USB已制作或目标电脑已启动。
- 关于“继续黑苹果项目分析 (37)”：当前环境仍未获得该窗口正文/导出；本轮仅追加本窗口和可验证GitHub/CI记录，不编造第37窗口内容。


## 22. 2026-11-28 EFI分区核验根因修复与CI虚拟磁盘通过
- 根因已通过Windows Server 2022真实DiskPart + VHDX测试查明：DiskPart在GPT空盘执行`create partition efi size=...`时，自动创建MSR（GPT type `e3c9e316-0b5c-4db8-817d-f92df00215ae`）及EFI System Partition（GPT type `c12a7328-f81f-11d2-ba4b-00a0c93ec93b`）两个分区。MSR为隐藏保留分区；EFI分区虽通过DiskPart分配盘符并能从Win32_LogicalDisk读取FAT32卷，但MSFT_Partition/Get-Partition对象的DriveLetter字段仍为空。因此不能用Get-Partition -DriveLetter筛选ESP，也不能把DiskPart建盘结果错误地断言为只有一个分区。
- 正确布局核验：要求该目标盘总计2个分区，按GptType分别找到且仅找到1个ESP和1个MSR；通过Win32_LogicalDisk按盘符核验文件系统FAT32、卷标OC-SEQUOIA。该验证不依赖ESP的DriveLetter字段。
- 已修订本地脚本：/mnt/data/Build-B460M-Sequoia-USB-Samsung-256GB.ps1；SHA-256 `6e82387cad40be715bbad79f316aded0f39093f1eea48b8f33022808028482aa`。已修正VHD自测逻辑和写盘后的实际USB布局验证逻辑，检查ESP+MSR两个GPT分区及FAT32卷；保留目标设备型号/USB总线/容量/序列号二次核验、IsBoot/IsSystem保护、E:/F:排除、精确确认语句、写盘前复核及文件哈希校验。该脚本不包含真实磁盘序列号或SMBIOS值。
- Windows PowerShell 5.1 / GitHub Actions workflow `.github/workflows/test-b460m-sequoia-usb-builder.yml`最新通过记录：Run `46067207584`，commit `c353cfcd6eccdb79b6f76dc401a47886255aaeba`，结论success。Job各步骤均success：Windows PowerShell 5.1完整脚本fixture解析、空盘/非空盘/CIM provider异常模拟自测、DiskPart在新建临时VHDX上创建GPT/EFI/FAT32布局并核验ESP+MSR+卷标。VHD在GitHub runner上创建，未操作runner物理系统盘或用户实体磁盘。
- 该CI通过的是fixture恢复后应用同一ESP/MSR核验修复的脚本测试，以及独立VHD端到端DiskPart测试；并非对用户辅助电脑的Samsung USB实盘写入测试。不得声称用户USB已经制作完成或黑苹果实机启动成功。
- 当前本地EFI包：/mnt/data/B460M-Baseline-EFI-02-Sequoia-USB.zip，SHA-256 `e5d84d73bf5f8392fdbf0a5b954081b930098f357e3615a445cdc84d6e629680`。包含此前确认的EFI02配置及用户批准的临时测试SMBIOS；严禁提交到公开GitHub或把实际三码写入项目记忆。
- 下一步：重新核验两个本地交付文件的存在及哈希，发布PS1与EFI ZIP下载；用户下载到辅助电脑Downloads目录后，才可按两步法运行。运行时先观察设备型号、容量、USB总线、序列号及分区识别输出，确认目标为已批准的Samsung USB后再键入脚本要求的精确确认语句。Disk 0、E:/F:、HP NVMe和目标机SATA原系统盘保护规则不变。


## 23. 2026-11-28 本地交付文件核验
- 已在当前运行容器中确认交付文件真实存在：`/mnt/data/Build-B460M-Sequoia-USB-Samsung-256GB.ps1`（23,245 bytes，SHA-256 `6e82387cad40be715bbad79f316aded0f39093f1eea48b8f33022808028482aa`）；`/mnt/data/B460M-Baseline-EFI-02-Sequoia-USB.zip`（4,637,288 bytes，SHA-256 `e5d84d73bf5f8392fdbf0a5b954081b930098f357e3615a445cdc84d6e629680`）。
- EFI ZIP完整性检查PASS，60个条目，EFI/BOOT/BOOTx64.efi、EFI/OC/OpenCore.efi、EFI/OC/config.plist三个关键路径存在。
- GitHub Actions Run `46067207584` 已通过Windows Server 2022 / Windows PowerShell 5.1脚本解析、模拟空盘/非空盘/CIM异常测试及独立VHD GPT/ESP+MSR/FAT32布局验证。该验证不等于辅助电脑真实Samsung USB已写入。
- 当前已准备向用户交付两个本地文件；用户必须将二者放在辅助电脑Downloads同一目录，管理员Windows PowerShell 5.1中单独执行脚本。执行时首先核对实际设备型号、容量、USB BusType和序列号，未出现精确目标身份及用户确认之前不会执行DiskPart clean。


## 24. 2026-11-28 用户实际运行USB脚本后的再次故障与根因
- 用户在辅助电脑管理员Windows PowerShell 5.1运行此前交付的Build-B460M-Sequoia-USB-Samsung-256GB.ps1，脚本在开头目标盘分区预检查处停止：`找不到任何“DiskNumber”属性等于“1”的 MSFT_Partition 对象`。
- 失败发生在目标盘识别之后、任何DiskPart命令之前；没有运行clean、convert、create partition、format或assign。根据完整输出，脚本没有对USB执行清盘/格式化/分区写入；辅助电脑Disk 0系统盘未被选中。
- 复核此前所谓CIM修复实现，发现它仍通过`Get-CimInstance -Filter 'DiskNumber = N'`调用MSFT_Partition。该Storage provider在空盘查询时仍可能抛出对象不存在异常，因此前一轮修复并未解决用户实际遇到的环境差异。
- 本轮本地最终修正：Get-TargetPartitions不再使用WQL Filter；改为不带Filter枚举MSFT_Partition类，再在PowerShell端按DiskNumber筛选。零匹配结果作为正常空盘；CIM类枚举/提供程序异常仍包装为PARTITION_QUERY_FAILED并停止，保持fail-closed。
- 本地新脚本：`/mnt/data/Build-B460M-Sequoia-USB-Samsung-256GB.ps1`，大小23,854 bytes，SHA-256 `7d7fdc1bfdaccac035dcd3795a09779964121ec953290d36ec9818637b442b52`。静态检查确认不再含`-Filter $filter`或旧`Get-Partition -DiskNumber`调用，且仍保留Samsung型号前缀、USB BusType、容量范围、序列号交叉验证、IsBoot/IsSystem保护、E:/F:排除和破坏性确认门槛。
- 本地EFI包仍为`/mnt/data/B460M-Baseline-EFI-02-Sequoia-USB.zip`，大小4,637,288 bytes，SHA-256 `e5d84d73bf5f8392fdbf0a5b954081b930098f357e3615a445cdc84d6e629680`；ZIP完整性PASS，60个条目，关键EFI启动路径存在。EFI包含用户批准的临时测试SMBIOS，禁止公开上传或写入本记忆具体值。
- GitHub Actions新回归测试：Run `46067974097`，commit `7b7beba9449592e85abe0cb1d0e9f5e8047e276b`，Windows Server 2022 / Windows PowerShell 5.1，结论success。日志：POWERSHELL_51_PARSE=PASS；EMPTY_DISK_RETURNS_ZERO_PARTITIONS=PASS；NONEMPTY_DISK_RETURNS_ONLY_MATCHING_PARTITIONS=PASS；CIM_PROVIDER_FAILURE_STOPS_BUILD=PASS；GET_TARGET_PARTITIONS_REGRESSION_TEST=PASS。
- 新增实际VHD集成测试：`tests/powershell/Get-TargetPartitions.Vhd.Tests.ps1`；Workflow `.github/workflows/test-empty-disk-partition-query.yml`在Windows runner中创建一次性256MB VHDX，DiskPart实际执行GPT、EFI、FAT32和OC-SEQUOIA卷标，然后用与本地脚本相同的无Filter CIM枚举逻辑核验ESP+MSR两分区。Run `46068070613`，commit `a38a4b7f278fab38f97fadd38c0026e9f0be0737`，结论success；日志确认VHD_CIM_ENUMERATION_RETURNS_ESP_AND_MSR=PASS，VHD_PARTITION_COUNT=2，测试磁盘号2、测试盘符Z。该VHD为GitHub runner临时磁盘，不是用户实体USB。
- 两次早期回归Run `46067815355`、`46067873739`失败原因是测试mock将未传入的[string] Filter参数自动转换为空字符串，却错误地按$null判断；不是生产函数测试结果。修正测试为[string]::IsNullOrEmpty后Run 46067974097通过。
- 验证边界：本轮Windows PowerShell 5.1 parser和空盘/非空盘/provider错误测试针对与本地脚本相同的Get-TargetPartitions实现；VHD集成测试在真实Windows runner上验证同一查询逻辑与DiskPart布局。上一版完整builder fixture解析/VHD workflow Run 46067207584仍为success。不得声称本轮新SHA的完整本地PS1文件已逐字节在Windows runner解析，也不得声称辅助电脑实体USB已写入或实机OpenCore启动成功。
- 当前决定：不要再运行旧版本脚本；新版本可在确认所有安全检查、文件校验和设备身份后再交付。交付前应再次核验本地PS1和EFI ZIP存在及SHA，并保留Windows PowerShell 5.1测试范围的准确说明。


## 25. 2026-11-28 最终版空盘查询逻辑的完整构建Fixture回归通过
- 为进一步验证新修复逻辑，更新 .github/workflows/test-b460m-sequoia-usb-builder.yml：Windows Server 2022 runner恢复仓库中保存的完整builder fixture后，按函数边界将旧Get-TargetPartitions替换为本轮最终无WQL Filter版本，然后对完整恢复脚本执行Windows PowerShell 5.1 Parser、运行builder的隔离SelfTest，并在新建临时VHD上运行DiskPart GPT/EFI/FAT32布局验证。
- 最新完整builder CI Run 46068462799，commit dc4ff599915483d70de8ecac633c55511e217c78，结论success。步骤均success：Restore exact builder fixture、Parse complete builder with Windows PowerShell 5.1、Run isolated builder self-tests、Exercise DiskPart EFI layout on a newly attached disposable VHD。
- 同一轮独立VHD查询测试Run 46068070613也已success，实际Windows runner VHD验证无Filter CIM枚举可返回ESP+MSR两条记录；独立空/非空/provider异常测试Run 46067974097 success。
- 验证边界说明：完整builder fixture在CI中恢复后，测试workflow明确用最终Get-TargetPartitions函数替换旧实现，再解析/自测；不是对/mnt/data本地PS1逐字节原样解析。最终函数代码与本地文件一致。CI VHD是runner新建临时VHD，不是辅助电脑Samsung USB实盘写入。
- 最终本地交付文件重新核验：PS1 /mnt/data/Build-B460M-Sequoia-USB-Samsung-256GB.ps1，23,854 bytes，SHA-256 7d7fdc1bfdaccac035dcd3795a09779964121ec953290d36ec9818637b442b52；EFI ZIP /mnt/data/B460M-Baseline-EFI-02-Sequoia-USB.zip，4,637,288 bytes，SHA-256 e5d84d73bf5f8392fdbf0a5b954081b930098f357e3615a445cdc84d6e629680。EFI ZIP完整性PASS，60条目，关键启动路径存在。
- 本地静态安全检查PASS：不再使用MSFT_Partition WQL Filter；不再使用Get-Partition -DiskNumber；动态识别Samsung SSD 860 EVO USB、按序列号交叉核对、排除IsBoot/IsSystem、保护E:/F:、精确确认后才调用DiskPart clean等逻辑保留。
- 当前允许重新交付该修复版PS1，但用户必须先下载新文件覆盖旧版本，且将EFI ZIP与PS1放在Downloads同一目录；运行时仍先只读识别、确认USB型号/容量/序列号，未输入精确确认语句前不写盘。不得声称实体USB已经制作成功。


## 26. 2026-11-28 USB脚本第三次安全停止：检测到3个分区
- 用户再次运行本地修复版Build-B460M-Sequoia-USB-Samsung-256GB.ps1，输出：`SAFETY_STOP: target USB currently has 3 partition(s). The confirmed preparation state was an empty GPT disk; no changes made.`
- 此停止发生在正式写盘确认之前，脚本检测到目标USB存在3个MSFT_Partition对象后立即停止；未执行DiskPart clean、convert、create partition、format或assign。当前不能据此推断三个分区的类型/内容，必须先读取实际分区号、GPT类型GUID、大小、偏移、盘符、卷标、文件系统及隐藏属性。
- 本轮确认用户实际上传并运行的PS1与本地修复版相同：23,854 bytes，SHA-256 `7d7fdc1bfdaccac035dcd3795a09779964121ec953290d36ec9818637b442b52`。脚本第221行逻辑明确要求目标盘当前分区数为0，否则停止；这是预期fail-closed行为。
- 当前不能假定目标USB是空盘。历史记忆中曾记载用户使用分区工具删除分区，但本次实测报告3个分区，说明之前“空盘”状态没有得到当前设备事实确认，或者后来分区表状态不同。不要建议用户手动删除分区、运行diskpart clean或修改分区。
- 已生成只读诊断脚本 `/mnt/data/Diagnose-B460M-Samsung-USB-Partitions.ps1`，大小5,592 bytes，SHA-256 `7c3ea6ae40fa1ced4a06d75d5e430f9882b63678a215c82b0cbe85a2ed8addb4`。它按已确认Samsung SSD 860 EVO USB型号前缀、序列号000000123ADC、USB BusType和225–240GiB范围识别目标盘，并输出Get-Disk/Win32_DiskDrive交叉信息、无Filter枚举MSFT_Partition结果、Get-Partition交叉结果及卷信息；无任何清盘、分区、格式化、分配盘符或文件写入命令。仅做静态括号/语法结构粗检，当前环境无Windows PowerShell 5.1解释器，不能声称已在Windows执行Parser测试。
- 下一步：用户下载该只读诊断PS1至辅助电脑Downloads目录，以管理员Windows PowerShell 5.1单独运行并回传完整输出。根据3个分区的GPT GUID/大小/偏移/卷信息判断是否为残留ESP/MSR/恢复分区或其他数据。只有完成设备身份和分区内容核验后，才决定是否更新builder允许安全地清除已确认目标USB的既有分区；仍需型号、容量、序列号核验及精确二次确认。Disk 0系统盘、E:/F:、HP NVMe及目标机SATA原系统盘保护规则不变。


## 27. 2026-11-28 USB现有分区识别完成与E:目标卷安全放行逻辑
- 用户回传只读诊断完整输出，确认目标盘仍为辅助电脑上的Samsung SSD 860 EVO USB Device，Get-Disk FriendlyName为Samsung SSD 860 EVO，序列号000000123ADC，USB BusType，容量250056737280字节（232.89GiB），IsBoot=False、IsSystem=False、在线且健康；Win32_DiskDrive型号和序列号交叉一致。
- 当前目标USB为GPT，确切有3个分区：Partition 1为ESP（GPT GUID c12a7328-f81f-11d2-ba4b-00a0c93ec93b，约300MiB）；Partition 2为MSR（GPT GUID e3c9e316-0b5c-4db8-817d-f92df00215ae，16MiB）；Partition 3为Basic Data（GPT GUID ebd0a0a2-b9e5-4433-87c0-68b6b72699c7，约232.576GiB，挂载E:，NTFS）。只读诊断没有修改磁盘。
- 用户明确确认：E:就是这块已核实的Samsung USB，且刚刚在该USB上重新分区；授权继续制作脚本。故原先“保护E:”规则对本次已确认目标盘上的E:卷作明确例外：只允许在Get-Disk/Win32_DiskDrive型号、USB总线、容量、用户输入序列号交叉核验一致，且Get-Partition -DriveLetter E确认E:唯一归属于该目标DiskNumber后，清除该USB。任何其他磁盘上的E:不得触碰；F:仍受保护；辅助电脑Disk 0、HP NVMe、目标机SATA原系统盘保护规则不变。
- 已修订本地制作脚本 /mnt/data/Build-B460M-Sequoia-USB-Samsung-256GB.ps1，新SHA-256 415ce293bcc536a1bef3742460b62e5f73bde56564b336b1fc18ddd807277fd6，27,889 bytes。它不再要求目标盘零分区，而是只接受精确的三分区布局：一个ESP、一个MSR、一个Basic NTFS分区E:；要求Get-Partition -DriveLetter E唯一映射到已按序列号确认的目标DiskNumber；目标盘上除E:外不得存在其他已挂载分区；E:文件系统必须是NTFS。任何分区数量、GUID、盘符归属或文件系统不符都fail-closed停止。
- 写盘前在下载/校验Recovery和EFI完成后，再次核验目标盘型号/序列号/USB总线/容量/启动系统盘标记、完整三分区布局及E:归属。最终确认提示明确说明三分区及E: NTFS全部会被擦除，用户必须输入包含完整序列号的精确语句：ERASE ALL PARTITIONS ON SAMSUNG USB <serial>；确认前不调用DiskPart clean。DiskPart仍动态选目标DiskNumber，不硬编码编号；新ESP卷盘符只从G:–Z:动态选择。报告字段明确标记目标USB E:卷已擦除、F:及其他磁盘未触碰。
- 新增SelfTest覆盖ESP+MSR+Basic/E:预期布局、E:映射到错误DiskNumber时拒绝、E:非NTFS时拒绝。GitHub Actions Run 46070199107（run #26，提交1ba328b04d56108d53ba126685a44855ec21daa7）已完成success。Windows Server 2022 / Windows PowerShell 5.1日志确认：完整builder fixture恢复成功；FULL_BUILDER_POWERSHELL_51_PARSE=PASS；EMPTY_DISK_RETURNS_ZERO_PARTITIONS=PASS；NONEMPTY_DISK_RETURNS_ALL_PARTITIONS=PASS；CIM_PROVIDER_FAILURE_STOPS_BUILD=PASS；EXISTING_TARGET_LAYOUT_AND_E_OWNERSHIP_GUARDS=PASS；BUILDER_SELFTEST=PASS；临时VHD的DiskPart GPT/ESP+MSR/FAT32布局验证VHD_ESP_LAYOUT_PASS。临时VHD是CI runner新建测试盘，不是用户实体USB。
- 验证边界：CI恢复的是与本地文件逐字节相同的builder fixture，然后workflow对Get-TargetPartitions函数应用已验证的无WQL Filter版本替换，再运行Windows PowerShell 5.1 Parser、自测和独立临时VHD集成测试；因此不能描述为对本地脚本未经修改逐字节解析。CI通过不代表用户实体USB已写入，也不代表目标机OpenCore实机启动成功。
- 当前状态：新脚本通过Windows PowerShell 5.1 CI Parser、自测及临时VHD布局测试；EFI02 ZIP保持原SHA-256 e5d84d73bf5f8392fdbf0a5b954081b930098f357e3615a445cdc84d6e629680。下一步重新核验本地PS1/EFI ZIP文件、哈希和ZIP结构后再向用户交付；用户下载到辅助电脑Downloads目录并覆盖旧PS1后，按“两步法”独立运行。不要让用户运行旧版本脚本。


## 28. 2026-11-28 用户再次运行构建器仍触发旧空盘检查：交付文件版本核验
- 用户报告运行 `Build-B460M-Sequoia-USB-Samsung-256GB.ps1` 后仍输出旧版横幅“Drive letters E: and F: are never assigned or modified.”以及 `target USB currently has 3 partition(s). The confirmed preparation state was an empty GPT disk`。该输出表明用户Downloads目录实际执行的脚本不是已修订的三分区布局版本；没有进入格式化步骤，输出明确报告no changes made。
- 当前会话可访问的 `/mnt/data/Build-B460M-Sequoia-USB-Samsung-256GB.ps1` 经实际读取，SHA-256为415ce293bcc536a1bef3742460b62e5f73bde56564b336b1fc18ddd807277fd6，27,889 bytes；内容确实包含 `Assert-ExistingTargetLayout`、ESP+MSR+Basic/E:三分区检查、E:唯一归属核验和序列号精确确认语句 `ERASE ALL PARTITIONS ON SAMSUNG USB <serial>`，并无旧空盘保护错误字符串。故本次差异是用户本地实际执行的Downloads文件与已交付修订文件不一致；可能存在旧文件未覆盖或浏览器另存副本，具体文件名尚未确认。
- 已生成只读版本检查脚本 `/mnt/data/Check-B460M-Builder-Version.ps1`，SHA-256 `b3e3a0d4d763fcaef408964b4562131afb74e47a8d848e48ea5de719555fe7b7`，1,941 bytes。该脚本只扫描用户Downloads目录中匹配的builder脚本，列出文件名、完整路径、长度、修改时间、SHA256，并判断是否包含新版三分区保护逻辑或旧空盘检查文字；不读取磁盘分区、不改文件、不写磁盘。
- 已将版本检查脚本提交到 `tools/Check-B460M-Builder-Version.ps1`（提交 `3180f58b1a82fc343d5a354b932c1b2edbfe8252`），并将其PowerShell 5.1 Parser步骤加入 `.github/workflows/test-b460m-sequoia-usb-builder.yml`（提交 `0c3597d9aa7bc35c7a24bb3ffa9fc8c99d79f18c`）。GitHub Actions Run `46070639797` 已成功，链接 https://github.com/hf9syu5v-dev/game-accelerator/actions/runs/46070639797；该次新增 `VERSION_CHECKER_POWERSHELL_51_PARSE=PASS`。
- 当前下一步：先交付只读版本检查PS1并让用户运行，检查Downloads目录中所有同名前缀文件的SHA256和标记。期望正确构建器SHA256为 `415ce293bcc536a1bef3742460b62e5f73bde56564b336b1fc18ddd807277fd6`。若没有任何文件匹配该哈希，要求用户重新下载正确PS1并确保实际执行的路径/文件名；在确认匹配前禁止再次运行任何构建或清盘脚本。USB现有三个分区状态维持不变。


## 29. 2026-11-28 用户决定恢复空GPT盘并新增清盘脚本
- 用户明确改变操作方案：先由用户侧脚本将已确认的Samsung SSD 860 EVO USB安装盘恢复为“空GPT盘”，再继续原构建流程。该决定取代上一节优先接受ESP+MSR+Basic/E:三分区布局的方案。
- 目标设备仍是辅助电脑上此前已交叉确认的Samsung SSD 860 EVO USB，标称250GB、约232.89GiB；型号、USB BusType、容量和序列号必须在脚本每次运行时重新核验，动态发现磁盘号，不硬编码编号。辅助电脑Windows系统盘、任何其他磁盘及F:均保护。目标USB上的E:数据在本次授权范围内会被清除。
- 新增脚本 tools/Reset-B460M-Samsung-USB-EmptyGPT.ps1，本地交付文件路径 /mnt/data/Reset-B460M-Samsung-USB-EmptyGPT.ps1。脚本执行前展示设备身份与当前分区数，必须输入精确确认语句才进行DiskPart clean；之后用Initialize-Disk创建GPT。Windows初始化GPT会自动建立隐藏MSR分区，因此脚本再明确删除该Windows自动创建的MSR，最终要求Get-Disk显示GPT且MSFT_Partition对该盘返回0个分区，才输出RESET_VERIFIED=PASS。若设备识别、CIM交叉核验、保护条件或最终状态不符，则停止。
- 技术验证发现：仅DiskPart clean + convert gpt，以及仅Initialize-Disk -PartitionStyle GPT，在Windows Server 2022上都会留下一个隐藏MSR分区（GPT type e3c9e316-0b5c-4db8-817d-f92df00215ae，约16MiB）；因此不能把“只剩MSR”误报成严格零分区状态。最终方案是在初始化后识别并移除该隐藏MSR，再验证GPT零分区。
- GitHub Actions workflow .github/workflows/test-b460m-usb-empty-gpt-reset.yml 最新Run 46071794970，提交 6e8cd5691b239222b44a5edcd15cf196ef147389，结论success。Windows Server 2022 / Windows PowerShell 5.1日志确认脚本Parser及安全静态检查通过，并在runner新建的一次性VHD上完成clean、Initialize-Disk GPT、识别/删除Windows创建的隐藏MSR，最终验证GPT且分区数为0。测试只操作runner临时VHD，不是用户实体USB。
- 本地PS1当前SHA-256：d18e6072245e1b5ff1a60ce7cf2e5b0775a7558e102e9d4c13e2410a2881d994，Git blob SHA与仓库文件一致（2a47dbedffc5358e3cd9ed73d980da3dc96302c9）。本地环境没有Windows PowerShell解释器；Windows PowerShell 5.1 Parser与VHD端到端测试由上述GitHub Actions完成。尚未对辅助电脑实体USB执行清盘，不能声称实体盘已变更。
- 重要后续：当前既有USB builder历史版本的空盘检查逻辑曾以“零分区”作为前置条件；本次Reset脚本最终状态满足该条件，但交付前仍须确认builder当前下载版本、SHA及其目标盘识别条件与本次Reset脚本一致。用户运行Reset脚本前，必须先下载新PS1，再独立执行；不要要求复制代码。Reset完成后回传完整输出，再继续构建器流程。


## 30. 2026-11-28 USB清盘脚本在Win32_DiskDrive交叉核验处安全停止
- 用户实际执行Reset-B460M-Samsung-USB-EmptyGPT.ps1，输出脚本SHA-256与已交付版本一致：d18e6072245e1b5ff1a60ce7cf2e5b0775a7558e102e9d4c13e2410a2881d994。执行在Win32_DiskDrive cross-check failed处停止，明确No changes made；停止点早于用户确认提示和DiskPart clean，故本次没有清盘或分区变更。
- 当前已确认失败发生在Get-Disk已筛选到目标设备后，Win32_DiskDrive的Model/SerialNumber/Size严格交叉匹配未得到唯一结果。具体字段尚未确定；不得猜测，也不得放宽身份校验后直接清盘。
- 新增只读诊断脚本 tools/Diagnose-B460M-USB-CIM-Match.ps1，本地路径 /mnt/data/Diagnose-B460M-USB-CIM-Match.ps1，SHA-256 e372670a96b773879aa536934152df7d540dc07fff13b936c263c93e13d7c3e3。输出Get-Disk和Win32_DiskDrive候选设备的原始/Trim后型号、序列号、字符串长度、容量、PNPDeviceID、接口类型，以及逐字段布尔匹配结果；无清盘、分区、初始化或写入磁盘命令。
- 已提交只读诊断脚本和Windows Server 2022 workflow：Run 46072232673，提交57d1d2ebbdddf144ab2baa56d5919dacce374cc2，结论success。日志步骤确认Windows PowerShell 5.1 Parser通过，且静态只读检查通过。此CI只验证脚本语法和无写盘命令，不验证用户电脑设备属性。
- 当前下一步：用户下载该诊断PS1至辅助电脑Downloads目录，以管理员Windows PowerShell 5.1运行并回传完整输出。根据CIM字段匹配结果修订清盘脚本；在原因确定前，不要再次运行清盘脚本或USB构建器。

## 31. 2026-11-28 USB CIM身份核验根因查明与Reset脚本r2验证
- 用户回传只读诊断结果，确认辅助电脑目标USB为Get-Disk Disk 1：FriendlyName Samsung SSD 860 EVO、BusType USB、序列号000000123ADC、容量250059350016字节、非启动/系统盘。
- 对应Win32_DiskDrive记录为Index=1、DeviceID `\\.\PHYSICALDRIVE1`、Model Samsung SSD 860 EVO USB Device、SerialNumber 000000123ADC、InterfaceType USB、PNPDeviceID以USBSTOR开头、Size 250056737280字节。Get-Disk与CIM容量差2,612,736字节（约2.49MiB），不是同一容量字段的精确值。
- 辅助电脑Disk 0是SATA/IDE Windows系统盘，序列号S3YLNX0K912272X、IsBoot=True、IsSystem=True；诊断结果中它的CIM型号也满足Samsung型号前缀，但序列号、Index/DeviceID、接口和PNP均与目标USB不符。必须保护Disk 0。
- 原Reset脚本失败根因已明确：它把CIM Model、SerialNumber、Size做严格比较，却没有使用Win32_DiskDrive.Index/DeviceID关联Get-Disk.Number；同时要求CIM Size与Get-Disk.Size逐字节相等。实际USB身份完全匹配，但容量提供程序之间有约2.49MiB差异，因此错误地安全停止。
- 新脚本 `tools/Reset-B460M-Samsung-USB-EmptyGPT-r2.ps1` 已提交main。身份核验同时要求：Get-Disk USB总线、Samsung型号前缀、序列号精确匹配、225–240GB容量范围、非Boot/System/Offline/ReadOnly；CIM必须同时满足Index=Get-Disk.Number、DeviceID精确为对应PHYSICALDRIVE路径、Model前缀、SerialNumber精确、InterfaceType=USB、PNPDeviceID以USBSTOR开头、CIM容量位于同一容量范围，并且两接口容量差不超过16MiB。执行破坏性操作前重新核验两套API及F盘保护，并要求输入完整精确确认语句。保留DiskPart clean后初始化GPT、移除Windows自动创建的隐藏MSR、最终验证GPT零分区的流程。
- 新脚本SelfTest覆盖真实报告中的2.5MiB容量差应通过、错误物理盘Index拒绝、错误DeviceID拒绝、错误序列号拒绝、非USB接口拒绝、超过16MiB容量差拒绝。
- GitHub Actions Windows Server 2022 / Windows PowerShell 5.1：
  - Run 46072752393（commit 99952e1b07187de8ffbd8ac32fd0ed51c49169d4）success：完整脚本Parser通过，身份匹配SelfTest全部通过。
  - 首个VHD集成测试Run 46072756613失败，原因仅为workflow中DiskPart select vdisk参数引用格式错误，未进入测试磁盘clean阶段；随后修复测试workflow。
  - Run 46072844033（commit 8f172c714a6233b697ea2a232fd3260a94bf3269）success：Windows PowerShell 5.1 Parser、全部身份SelfTest通过；在GitHub runner一次性VHD上实际DiskPart clean、Initialize-Disk GPT、识别并移除隐藏MSR，最终验证GPT且零分区，日志标记DISPOSABLE_VHD_GPT_ZERO_PARTITIONS=PASS。VHD为runner临时测试盘，不是用户实体Samsung USB。
- 本地交付文件 `/mnt/data/Reset-B460M-Samsung-USB-EmptyGPT-r2.ps1` 已从GitHub main文件内容逐字节恢复核对，Git blob SHA与仓库一致：`9cdb9d0abbd109199c2757755e948153da84fa89`；本地文件SHA-256：`432b7327f00594a1c6c843dae5d4b75ae15b4d8854b4c57e242cd5518f337929`。Windows PowerShell 5.1 Parser与身份SelfTest由Run 46072752393及46072844033验证；空GPT流程由Run 46072844033临时VHD验证。
- 当前状态：r2脚本已通过Windows PowerShell 5.1 Parser、身份单元测试和临时VHD空GPT端到端测试，可以交付给用户；此前旧版Reset脚本SHA d18e607...已被证实因比较逻辑错误而安全停止，用户不得再次运行旧版。用户辅助电脑实体USB尚未清盘，未输入确认前不应执行任何写盘操作。
- 下一步：按PowerShell两步法提供r2脚本本地下载文件，再给独立执行命令。用户运行后回传完整输出；只有看到 `RESET_VERIFIED=PASS` 和 `TARGET_STATE=GPT with zero partitions` 后，才继续检查/运行USB builder。不要把CI/VHD测试描述成实体USB清盘或目标机实机启动成功。

B460M-PLUS ACPI 深度反编译结果

输入：
- 来自 GitHub 的 B460M-ACPI-Report.zip
- DSDT.aml + 6 张 SSDT.aml

工具：
- ACPICA 官方 iASL 20260408
- 安装包 SHA256：121F5E4F30B1DF63D09052294E4A605D4DEE2DFB9599FA24AF4AC6015DF02B70

反编译方式：
- iasl -da -dl -l [DSDT + all SSDTs]
- stdout / stderr are captured separately; stderr notices are not treated as PowerShell exceptions
- 若联合反编译有表未生成 DSL，则逐表执行 iasl -dl -l

请将本 ZIP 原样上传到 GitHub 仓库，不要编辑、删除或重命名其中的 DSL/LST/log 文件。
此工具只做反编译，不会生成或修改 EFI。

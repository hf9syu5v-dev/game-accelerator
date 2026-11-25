[CmdletBinding()]
param(
    [string]$IaslPath = ""
)

$ErrorActionPreference = "Stop"
$DslPath = Join-Path $PSScriptRoot "EFI\EFI\OC\ACPI\SSDT-RHUB-B460M-PLUS.dsl"
$OutputPath = Join-Path $PSScriptRoot "EFI\EFI\OC\ACPI\SSDT-RHUB-B460M-PLUS.aml"

if (-not (Test-Path -LiteralPath $DslPath)) {
    throw "找不到 DSL 文件：$DslPath"
}

if ([string]::IsNullOrWhiteSpace($IaslPath)) {
    $cmd = Get-Command "iasl.exe" -ErrorAction SilentlyContinue
    if ($cmd) { $IaslPath = $cmd.Source }
}

$candidates = @(
    (Join-Path $PSScriptRoot "iasl.exe"),
    (Join-Path $env:USERPROFILE "Downloads\iasl.exe"),
    "C:\ASL\iasl.exe"
)

if ([string]::IsNullOrWhiteSpace($IaslPath)) {
    foreach ($candidate in $candidates) {
        if (Test-Path -LiteralPath $candidate) {
            $IaslPath = $candidate
            break
        }
    }
}

if ([string]::IsNullOrWhiteSpace($IaslPath) -or -not (Test-Path -LiteralPath $IaslPath)) {
    Write-Host "没有找到 iasl.exe。"
    Write-Host "请安装/解压 ACPICA iASL Windows 工具，然后重新运行。"
    Write-Host "官方说明：https://open-acpica.github.io/acpica_download.html"
    Write-Host "注意：ACPICA 自 2026-09-30 起不再发布新的 Windows 二进制包；旧版 Windows 工具仍可从历史发行版获取。"
    exit 2
}

Write-Host "使用 iASL：$IaslPath"
& $IaslPath -v
if ($LASTEXITCODE -ne 0) {
    throw "无法读取 iasl 版本信息。"
}

$workDir = Split-Path -Parent $DslPath
Push-Location $workDir
try {
    if (Test-Path -LiteralPath $OutputPath) {
        Remove-Item -LiteralPath $OutputPath -Force
    }

    & $IaslPath -ve -tc $DslPath
    if ($LASTEXITCODE -ne 0) {
        throw "iASL 编译失败，退出代码：$LASTEXITCODE"
    }

    if (-not (Test-Path -LiteralPath $OutputPath)) {
        throw "iASL 未生成预期 AML：$OutputPath"
    }

    $bytes = [System.IO.File]::ReadAllBytes($OutputPath)
    if ($bytes.Length -lt 36 -or [System.Text.Encoding]::ASCII.GetString($bytes, 0, 4) -ne "SSDT") {
        throw "输出文件不是有效的 SSDT AML 表头。"
    }

    $hash = (Get-FileHash -LiteralPath $OutputPath -Algorithm SHA256).Hash
    Write-Host ""
    Write-Host "编译成功。"
    Write-Host "AML：$OutputPath"
    Write-Host "大小：$($bytes.Length) bytes"
    Write-Host "SHA256：$hash"
    Write-Host "此脚本只生成 AML，不会修改 config.plist 或其他 EFI 文件。"
}
finally {
    Pop-Location
}

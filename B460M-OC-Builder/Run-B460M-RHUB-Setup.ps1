[CmdletBinding()]
param()

$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$RepoRaw = "https://raw.githubusercontent.com/hf9syu5v-dev/game-accelerator/main"
$ProjectRoot = Join-Path ([Environment]::GetFolderPath("UserProfile")) "Downloads\B460M-OC-Builder"
if (-not (Test-Path -LiteralPath (Split-Path -Parent $ProjectRoot))) {
    $ProjectRoot = Join-Path ([Environment]::GetFolderPath("UserProfile")) "下载\B460M-OC-Builder"
}
$AcpiDir = Join-Path $ProjectRoot "EFI\EFI\OC\ACPI"
$ToolsDir = Join-Path $ProjectRoot "Tools"
$DslName = "SSDT-RHUB-B460M-PLUS.dsl"
$CompileName = "Compile-B460M-RHUB.ps1"
$AmlName = "SSDT-RHUB-B460M-PLUS.aml"
$LogPath = Join-Path $ProjectRoot "OneClick-Setup.log"

New-Item -ItemType Directory -Force -Path $AcpiDir, $ToolsDir | Out-Null
Start-Transcript -Path $LogPath -Append | Out-Null

function Write-Step([string]$Message) {
    Write-Host ""
    Write-Host ("=" * 68) -ForegroundColor DarkGray
    Write-Host $Message -ForegroundColor Cyan
    Write-Host ("=" * 68) -ForegroundColor DarkGray
}

function Get-VerifiedDownload([string]$Url, [string]$Destination, [scriptblock]$Check) {
    $temp = "$Destination.download"
    for ($attempt = 1; $attempt -le 3; $attempt++) {
        try {
            if (Test-Path -LiteralPath $temp) { Remove-Item -LiteralPath $temp -Force }
            Write-Host "下载：$Url"
            Invoke-WebRequest -Uri $Url -OutFile $temp -UseBasicParsing -TimeoutSec 90
            if (-not (Test-Path -LiteralPath $temp) -or (Get-Item -LiteralPath $temp).Length -lt 1) {
                throw "下载结果为空。"
            }
            if ($Check -and -not (& $Check $temp)) {
                throw "下载文件内容校验未通过。"
            }
            Move-Item -LiteralPath $temp -Destination $Destination -Force
            return
        }
        catch {
            Write-Warning "第 $attempt/3 次下载失败：$($_.Exception.Message)"
            if ($attempt -eq 3) { throw }
            Start-Sleep -Seconds (2 * $attempt)
        }
    }
}

try {
    Write-Step "B460M-PLUS RHUB SSDT 一键准备与编译"
    Write-Host "输出目录：$ProjectRoot"
    Write-Host "本脚本只下载文件并生成 AML，不写入 EFI 分区、不修改 BIOS 或磁盘分区。"

    Write-Step "[1/6] 建立项目目录"
    New-Item -ItemType Directory -Force -Path $AcpiDir, $ToolsDir | Out-Null
    Write-Host "目录已就绪。"

    Write-Step "[2/6] 下载并验证 RHUB DSL"
    $dslPath = Join-Path $AcpiDir $DslName
    Get-VerifiedDownload "$RepoRaw/B460M-OC-Builder/EFI/EFI/OC/ACPI/$DslName" $dslPath {
        param($p)
        $s = [IO.File]::ReadAllText($p)
        return ($s.Contains("DefinitionBlock") -and $s.Contains("_SB.PCI0.XHC.RHUB") -and $s.Contains("Method (_STA"))
    }
    Write-Host "DSL 已下载并通过内容检查。"

    Write-Step "[3/6] 下载并验证仓库编译脚本"
    $compilePath = Join-Path $ProjectRoot $CompileName
    Get-VerifiedDownload "$RepoRaw/B460M-OC-Builder/$CompileName" $compilePath {
        param($p)
        $s = [IO.File]::ReadAllText($p)
        return ($s.Contains("SSDT-RHUB-B460M-PLUS.dsl") -and $s.Contains("iasl.exe") -and $s.Contains("Get-FileHash"))
    }
    Write-Host "PowerShell 编译脚本已下载并通过内容检查。"

    # Windows PowerShell 5.1 may misread UTF-8 scripts without a BOM.
    # Rewrite the downloaded child script as UTF-8 with BOM before invoking it.
    $compileBytes = [IO.File]::ReadAllBytes($compilePath)
    $compileText = [Text.Encoding]::UTF8.GetString($compileBytes)
    $utf8Bom = New-Object System.Text.UTF8Encoding($true)
    [IO.File]::WriteAllText($compilePath, $compileText, $utf8Bom)
    Write-Host "编译脚本已转换为带 BOM 的 UTF-8，兼容 Windows PowerShell 5.1。"

    Write-Step "[4/6] 下载 ACPICA 官方 Windows iASL 工具"
    $zipPath = Join-Path $ToolsDir "iasl-win-20250807.zip"
    $extractDir = Join-Path $ToolsDir "iasl-win-20250807"
    $iaslPath = Join-Path $ToolsDir "iasl.exe"
    $iaslUrl = "https://github.com/open-acpica/acpica/releases/download/20250807/iasl-win-20250807.zip"
    Get-VerifiedDownload $iaslUrl $zipPath {
        param($p)
        try {
            Add-Type -AssemblyName System.IO.Compression.FileSystem
            $z = [IO.Compression.ZipFile]::OpenRead($p)
            try { return ($z.Entries | Where-Object { $_.Name -ieq "iasl.exe" } | Measure-Object).Count -gt 0 }
            finally { $z.Dispose() }
        } catch { return $false }
    }
    if (Test-Path -LiteralPath $extractDir) { Remove-Item -LiteralPath $extractDir -Recurse -Force }
    Expand-Archive -LiteralPath $zipPath -DestinationPath $extractDir -Force
    $found = Get-ChildItem -LiteralPath $extractDir -Filter "iasl.exe" -File -Recurse | Select-Object -First 1
    if (-not $found) { throw "官方压缩包中没有找到 iasl.exe。" }
    Copy-Item -LiteralPath $found.FullName -Destination $iaslPath -Force
    $pe = [IO.File]::ReadAllBytes($iaslPath)
    if ($pe.Length -lt 50000 -or [Text.Encoding]::ASCII.GetString($pe,0,2) -ne "MZ") {
        throw "iasl.exe 文件头或文件大小异常，拒绝执行。"
    }
    & $iaslPath -v
    if ($LASTEXITCODE -ne 0) { throw "iASL 版本检查失败。" }
    Write-Host "iASL 已验证：$iaslPath"

    Write-Step "[5/6] 编译 RHUB SSDT"
    $amlPath = Join-Path $AcpiDir $AmlName
    if (Test-Path -LiteralPath $amlPath) {
        $backup = "$amlPath.bak-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
        Copy-Item -LiteralPath $amlPath -Destination $backup
        Write-Host "已备份原 AML：$backup"
    }
    & powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File $compilePath -IaslPath $iaslPath
    if ($LASTEXITCODE -ne 0) { throw "仓库编译脚本失败，退出代码：$LASTEXITCODE" }

    Write-Step "[6/6] 独立检查 AML 文件"
    if (-not (Test-Path -LiteralPath $amlPath)) { throw "没有生成预期 AML：$amlPath" }
    $bytes = [IO.File]::ReadAllBytes($amlPath)
    if ($bytes.Length -lt 36) { throw "AML 文件短于 ACPI 标准表头。" }
    if ([Text.Encoding]::ASCII.GetString($bytes,0,4) -ne "SSDT") { throw "AML 表签名不是 SSDT。" }
    $declaredLength = [BitConverter]::ToUInt32($bytes,4)
    if ($declaredLength -ne $bytes.Length) { throw "ACPI 表头长度与文件实际长度不一致。" }
    $sum = 0
    foreach ($b in $bytes) { $sum = ($sum + [int]$b) -band 0xFF }
    if ($sum -ne 0) { throw "ACPI checksum 不为 0，文件校验失败。" }
    $sha = (Get-FileHash -LiteralPath $amlPath -Algorithm SHA256).Hash

    Write-Host ""
    Write-Host "全部六步完成。" -ForegroundColor Green
    Write-Host "AML 文件：$amlPath"
    Write-Host "文件大小：$($bytes.Length) bytes"
    Write-Host "SHA256：$sha"
    Write-Host "ACPI 表签名：SSDT；长度与 checksum 检查通过。"
    Write-Host ""
    Write-Host "注意：这只证明 AML 文件结构有效，不代表该 RHUB 补丁已在本机 macOS 下验证安全或有效。不要现在将它加入正式 EFI 启动配置。"
    Write-Host "日志：$LogPath"
}
catch {
    Write-Host ""
    Write-Host "执行中止：$($_.Exception.Message)" -ForegroundColor Red
    Write-Host "请保留日志供排查：$LogPath"
    exit 1
}
finally {
    try { Stop-Transcript | Out-Null } catch {}
}

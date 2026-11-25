@echo off
setlocal
chcp 65001 >nul
title B460M-PLUS RHUB SSDT 一键准备与编译

echo ============================================================
echo   B460M-PLUS RHUB SSDT 一键准备与编译
echo ============================================================
echo.
echo 此启动器将从你的 GitHub 仓库下载主脚本，然后自动完成六步。
echo 不会写入 EFI 分区，不会修改 BIOS 或磁盘分区。
echo.

where powershell.exe >nul 2>nul
if errorlevel 1 (
  echo [错误] 未找到 Windows PowerShell。
  pause
  exit /b 1
)

powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "$ErrorActionPreference='Stop'; [Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12; $u='https://raw.githubusercontent.com/hf9syu5v-dev/game-accelerator/main/B460M-OC-Builder/Run-B460M-RHUB-Setup.ps1'; $p=Join-Path $env:TEMP 'Run-B460M-RHUB-Setup.ps1'; Write-Host '正在从 GitHub 获取主脚本...'; Invoke-WebRequest -Uri $u -OutFile $p -UseBasicParsing -TimeoutSec 90; if (!(Test-Path -LiteralPath $p) -or (Get-Item -LiteralPath $p).Length -lt 1000) { throw '主脚本下载异常' }; & powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File $p; exit $LASTEXITCODE"

if errorlevel 1 (
  echo.
  echo [失败] 脚本执行失败。请将屏幕错误信息和 Downloads\B460M-OC-Builder\OneClick-Setup.log 发给我。
) else (
  echo.
  echo [完成] 请查看上方输出与日志。
)
echo.
pause
endlocal

@echo off
setlocal
title B460M RHUB SSDT One-Click Setup

echo ============================================================
echo   B460M-PLUS RHUB SSDT One-Click Setup
echo ============================================================
echo.
echo This launcher downloads the setup script from your GitHub repository.
echo It will prepare the files and compile the SSDT.
echo It will NOT modify BIOS, partitions, or your boot EFI.
echo.

where powershell.exe >nul 2>nul
if errorlevel 1 (
  echo ERROR: Windows PowerShell was not found.
  pause
  exit /b 1
)

powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "$ErrorActionPreference='Stop'; [Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12; $u='https://raw.githubusercontent.com/hf9syu5v-dev/game-accelerator/main/B460M-OC-Builder/Run-B460M-RHUB-Setup.ps1'; $p=Join-Path $env:TEMP 'Run-B460M-RHUB-Setup.ps1'; $t=$p+'.download'; Write-Host 'Downloading setup script...'; Invoke-WebRequest -Uri $u -OutFile $t -UseBasicParsing -TimeoutSec 90; $bytes=[IO.File]::ReadAllBytes($t); if($bytes.Length -lt 1000){throw 'Downloaded script is unexpectedly small.'}; $utf8=New-Object System.Text.UTF8Encoding($true); $content=[Text.Encoding]::UTF8.GetString($bytes); [IO.File]::WriteAllText($p,$content,$utf8); Remove-Item $t -Force; & powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File $p; exit $LASTEXITCODE"

if errorlevel 1 (
  echo.
  echo FAILED. Keep the error message and the setup log for troubleshooting.
) else (
  echo.
  echo Setup script finished. Check the output and log.
)
echo.
pause
endlocal

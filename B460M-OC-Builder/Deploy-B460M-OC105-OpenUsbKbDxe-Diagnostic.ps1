#requires -RunAsAdministrator
$ErrorActionPreference='Stop'
$ProgressPreference='SilentlyContinue'
$py=Join-Path $PSScriptRoot 'Deploy-B460M-OC105-OpenUsbKbDxe-Diagnostic.py'
if (!(Test-Path -LiteralPath $py -PathType Leaf)) { throw "Python core missing: $py" }
$candidates=@(
 (Join-Path $env:ProgramFiles 'PyManager\python.exe'),
 (Join-Path $env:LOCALAPPDATA 'Programs\Python\Python315\python.exe'),
 (Join-Path $env:LOCALAPPDATA 'Programs\Python\Python312\python.exe'),
 (Join-Path $env:LOCALAPPDATA 'Programs\Python\Python311\python.exe')
)
$exe=$candidates | Where-Object { $_ -and (Test-Path -LiteralPath $_ -PathType Leaf) } | Select-Object -First 1
if (!$exe) { $cmd=Get-Command py.exe -ErrorAction SilentlyContinue; if ($cmd) { & $cmd.Source -3 $py; if ($LASTEXITCODE -ne 0) { throw "Deployment failed: $LASTEXITCODE" }; exit 0 }; throw 'Python 3 not found; no disk changes made.' }
& $exe $py
if ($LASTEXITCODE -ne 0) { throw "Deployment failed: $LASTEXITCODE" }

# CI-triggered revision: validation is performed by validate-b460m-oc105-openusbkbd-deploy.yml.

# Re-run CI after EFI root path correction.

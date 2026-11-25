# Validated PowerShell launcher for the OpenUsbKbDxe diagnostic deployment.
#requires -RunAsAdministrator
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

$scriptPath = Join-Path $PSScriptRoot 'Deploy-B460M-OpenUsbKbDxe-Keyboard-Diagnostic.py'
if (!(Test-Path -LiteralPath $scriptPath -PathType Leaf)) {
    throw "Python deployment core missing: $scriptPath"
}

# The previously successful Windows deployment used this PyManager location.
$candidates = @(
    (Join-Path $env:ProgramFiles 'PyManager\python.exe'),
    (Join-Path $env:LOCALAPPDATA 'Programs\Python\Python315\python.exe'),
    (Join-Path $env:LOCALAPPDATA 'Programs\Python\Python312\python.exe'),
    (Join-Path $env:LOCALAPPDATA 'Programs\Python\Python311\python.exe')
)
$pythonExe = $null
foreach ($candidate in $candidates) {
    if ($candidate -and (Test-Path -LiteralPath $candidate -PathType Leaf)) {
        $pythonExe = $candidate
        break
    }
}

# Fall back to the standard Windows Python launcher / PATH discovery.
if (!$pythonExe) {
    $launcher = Get-Command py.exe -ErrorAction SilentlyContinue
    if ($launcher) {
        & $launcher.Source -3 --version *> $null
        if ($LASTEXITCODE -eq 0) {
            & $launcher.Source -3 $scriptPath
            if ($LASTEXITCODE -ne 0) { throw "Python deployment failed with exit code $LASTEXITCODE." }
            exit 0
        }
    }
    $python = Get-Command python.exe -ErrorAction SilentlyContinue
    if ($python) { $pythonExe = $python.Source }
}

if (!$pythonExe) {
    throw 'Python 3 executable not found. Checked the previously verified C:\Program Files\PyManager\python.exe location and standard Windows Python locations. No disk changes were made.'
}

$version = & $pythonExe --version 2>&1
if ($LASTEXITCODE -ne 0 -or ($version -notmatch '^Python 3\.')) {
    throw "A working Python 3 interpreter was not found at '$pythonExe'. Reported version: $version. No disk changes were made."
}
Write-Host "PYTHON_INTERPRETER=$pythonExe ($version)" -ForegroundColor Cyan
& $pythonExe $scriptPath
if ($LASTEXITCODE -ne 0) {
    throw "Python EFI deployment failed with exit code $LASTEXITCODE. Review the ERROR line above."
}

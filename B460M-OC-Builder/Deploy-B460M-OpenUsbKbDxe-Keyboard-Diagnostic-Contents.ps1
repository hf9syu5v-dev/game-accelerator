#requires -RunAsAdministrator
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$scriptPath = Join-Path $PSScriptRoot 'Deploy-B460M-OpenUsbKbDxe-Keyboard-Diagnostic.py'
if (!(Test-Path -LiteralPath $scriptPath -PathType Leaf)) {
    throw "Python deployment core missing: $scriptPath"
}
$python = Get-Command py.exe -ErrorAction SilentlyContinue
if ($python) {
    & $python.Source -3 $scriptPath
} else {
    $python = Get-Command python.exe -ErrorAction SilentlyContinue
    if (!$python) { throw 'Python 3 is required. Install Python 3 for Windows, then rerun this script.' }
    & $python.Source $scriptPath
}
if ($LASTEXITCODE -ne 0) {
    throw "Python EFI deployment failed with exit code $LASTEXITCODE. Existing EFI should remain intact unless rollback was reported."
}

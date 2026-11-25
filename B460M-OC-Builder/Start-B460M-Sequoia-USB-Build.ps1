#requires -RunAsAdministrator
[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

$RepoRaw = 'https://raw.githubusercontent.com/hf9syu5v-dev/game-accelerator/main/B460M-OC-Builder/Build-B460M-Sequoia-Native-Recovery-USB.ps1'
$BuilderPath = Join-Path $env:TEMP 'Build-B460M-Sequoia-Native-Recovery-USB.ps1'
$PythonPackageId = 'Python.Python.3.13'

function Find-Python {
    foreach ($name in @('py.exe','python.exe','python3.exe')) {
        $cmd = Get-Command $name -ErrorAction SilentlyContinue
        if ($cmd -and $cmd.Source -and (Test-Path -LiteralPath $cmd.Source)) {
            if ($name -eq 'py.exe') {
                & $cmd.Source -3 --version *> $null
                if ($LASTEXITCODE -eq 0) { return @{ Exe=$cmd.Source; Args=@('-3') } }
            } else {
                & $cmd.Source --version *> $null
                if ($LASTEXITCODE -eq 0) { return @{ Exe=$cmd.Source; Args=@() } }
            }
        }
    }

    $roots = @(
        (Join-Path $env:LocalAppData 'Programs\Python'),
        (Join-Path $env:ProgramFiles 'Python'),
        (Join-Path ([Environment]::GetFolderPath('ProgramFilesX86')) 'Python')
    ) | Where-Object { $_ -and (Test-Path -LiteralPath $_) }

    foreach ($root in $roots) {
        $found = Get-ChildItem -LiteralPath $root -Filter python.exe -File -Recurse -ErrorAction SilentlyContinue |
            Where-Object { $_.FullName -match '\\Python313\\python\.exe$|\\Python3\d+\\python\.exe$' } |
            Sort-Object FullName -Descending | Select-Object -First 1
        if ($found) {
            & $found.FullName --version *> $null
            if ($LASTEXITCODE -eq 0) { return @{ Exe=$found.FullName; Args=@() } }
        }
    }
    return $null
}

Write-Host 'B460M Sequoia Recovery USB - Python bootstrap launcher' -ForegroundColor Green
Write-Host 'This launcher installs Python if needed, then starts the existing USB builder.'
Write-Host 'The USB builder retains its disk identity checks and destructive confirmation.'
Write-Host 'No disk is modified by this bootstrap stage.'

Write-Host ''
Write-Host 'STEP 1/4 - Check Python 3' -ForegroundColor Cyan
$python = Find-Python

if (!$python) {
    Write-Host ''
    Write-Host 'STEP 2/4 - Install Python 3.13' -ForegroundColor Cyan
    $winget = Get-Command winget.exe -ErrorAction SilentlyContinue
    if (!$winget) {
        throw 'WINGET_NOT_FOUND. Install/update App Installer from Microsoft Store, then rerun. No disk was changed.'
    }

    Write-Host 'Installing Python 3.13 from Windows Package Manager...'
    & $winget.Source install --id $PythonPackageId --exact --silent --accept-package-agreements --accept-source-agreements --scope user
    $installExit = $LASTEXITCODE

    $python = Find-Python
    if (!$python) {
        Write-Host 'Retrying installation without forcing user scope...' -ForegroundColor Yellow
        & $winget.Source install --id $PythonPackageId --exact --silent --accept-package-agreements --accept-source-agreements
        $installExit = $LASTEXITCODE
        $python = Find-Python
    }

    if (!$python) {
        throw "PYTHON_INSTALL_FAILED (winget exit $installExit). Install Python 3.13 from https://www.python.org/downloads/windows/ with Add python.exe to PATH, then rerun. USB was not changed."
    }
} else {
    Write-Host 'A working Python launcher/runtime was found.' -ForegroundColor Green
}

Write-Host ''
Write-Host 'STEP 3/4 - Validate Python runtime' -ForegroundColor Cyan
$version = & $python.Exe @($python.Args) --version 2>&1
if ($LASTEXITCODE -ne 0 -or (($version -join ' ') -notmatch '^Python 3\.')) {
    throw "PYTHON_VALIDATION_FAILED: $($version -join ' ')"
}
Write-Host ("PYTHON_READY: " + ($version -join ' ')) -ForegroundColor Green
$pythonDir = Split-Path -Parent $python.Exe
if ($pythonDir -and (($env:PATH -split ';') -notcontains $pythonDir)) { $env:PATH = $pythonDir + ';' + $env:PATH }

Write-Host ''
Write-Host 'STEP 4/4 - Download and launch the USB builder' -ForegroundColor Cyan
Invoke-WebRequest -Uri $RepoRaw -OutFile $BuilderPath -UseBasicParsing
if (!(Test-Path -LiteralPath $BuilderPath -PathType Leaf)) { throw 'BUILDER_DOWNLOAD_FAILED' }
$builderText = Get-Content -LiteralPath $BuilderPath -Raw
$requiredMarkers = @(
    'LITEON I T LCS-128L9S',
    '000000123ADC',
    'BUILD SEQUOIA USB',
    'APPLE_RECOVERY_DOWNLOAD_AND_CHUNKLIST_VERIFICATION_OK',
    'INTERNAL_DISKS=NOT_MODIFIED'
)
foreach ($marker in $requiredMarkers) {
    if ($builderText -notlike ('*' + $marker + '*')) {
        throw "BUILDER_CONTENT_VALIDATION_FAILED: missing marker $marker"
    }
}

Write-Host 'BUILDER_DOWNLOAD_AND_CONTENT_CHECK=PASS' -ForegroundColor Green
Write-Host 'Launching the builder...' -ForegroundColor Cyan
& powershell.exe -NoProfile -ExecutionPolicy Bypass -File $BuilderPath
$builderExit = $LASTEXITCODE

if ($builderExit -ne 0) {
    throw "USB_BUILDER_EXIT_CODE=$builderExit. Review the error above. No automatic retry or disk operation will be attempted."
}

Write-Host ''
Write-Host 'BOOTSTRAP_AND_BUILDER_COMPLETED' -ForegroundColor Green

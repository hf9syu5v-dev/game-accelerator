#requires -RunAsAdministrator
[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

$RepoRaw = 'https://raw.githubusercontent.com/hf9syu5v-dev/game-accelerator/main/B460M-OC-Builder/Build-B460M-Sequoia-Native-Recovery-USB.ps1'
$BuilderPath = Join-Path $env:TEMP 'Build-B460M-Sequoia-Native-Recovery-USB.ps1'
$PythonVersion = '3.13.17'
$PythonInstallerUrl = 'https://www.python.org/ftp/python/3.13.17/amd64/python-3.13.17-amd64.exe'
$PythonInstallerSha256 = '5da012101ba2e17113a9a1cd901e9ce1441086f2b7ecb5de06ec94163899a190'
$PythonInstallDir = Join-Path $env:LocalAppData 'Programs\Python\Python313'
$PythonExe = Join-Path $PythonInstallDir 'python.exe'

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
            Where-Object { $_.FullName -match '\\Python3\d+\\python\.exe$' } |
            Sort-Object FullName -Descending | Select-Object -First 1
        if ($found) {
            & $found.FullName --version *> $null
            if ($LASTEXITCODE -eq 0) { return @{ Exe=$found.FullName; Args=@() } }
        }
    }
    return $null
}

Write-Host 'B460M Sequoia Recovery USB - Python bootstrap launcher' -ForegroundColor Green
Write-Host 'Python is downloaded only from python.org and SHA-256 verified.'
Write-Host 'The USB builder retains its disk identity checks and destructive confirmation.'
Write-Host 'No disk is modified during Python setup.'

Write-Host ''
Write-Host 'STEP 1/4 - Check Python 3' -ForegroundColor Cyan
$python = Find-Python

if (!$python) {
    if (![Environment]::Is64BitOperatingSystem) {
        throw 'UNSUPPORTED_OS_ARCHITECTURE: this installer is for 64-bit Windows. No disk was changed.'
    }

    Write-Host ''
    Write-Host 'STEP 2/4 - Download and install official Python 3.13.17' -ForegroundColor Cyan
    $installer = Join-Path $env:TEMP 'python-3.13.17-amd64.exe'
    Invoke-WebRequest -Uri $PythonInstallerUrl -OutFile $installer -UseBasicParsing

    $actualHash = (Get-FileHash -LiteralPath $installer -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($actualHash -ne $PythonInstallerSha256) {
        throw "PYTHON_INSTALLER_SHA256_MISMATCH: $actualHash. Installer will not be run; no disk was changed."
    }

    $signature = Get-AuthenticodeSignature -FilePath $installer
    if ($signature.Status -ne 'Valid' -or $signature.SignerCertificate.Subject -notmatch 'Python Software Foundation') {
        throw "PYTHON_INSTALLER_SIGNATURE_INVALID: Status=$($signature.Status); Signer=$($signature.SignerCertificate.Subject). Installer will not be run."
    }
    Write-Host 'PYTHON_INSTALLER_SHA256_AND_SIGNATURE=PASS' -ForegroundColor Green

    New-Item -ItemType Directory -Path $PythonInstallDir -Force | Out-Null
    $arguments = @(
        '/quiet',
        'InstallAllUsers=0',
        ('TargetDir="' + $PythonInstallDir + '"'),
        'Include_launcher=0',
        'Include_pip=1',
        'Include_test=0',
        'PrependPath=0',
        'Shortcuts=0'
    )
    $process = Start-Process -FilePath $installer -ArgumentList $arguments -Wait -PassThru
    if ($process.ExitCode -notin @(0,3010)) {
        throw "PYTHON_INSTALLER_EXIT_CODE=$($process.ExitCode). USB was not changed."
    }

    if (!(Test-Path -LiteralPath $PythonExe -PathType Leaf)) {
        throw "PYTHON_EXECUTABLE_NOT_FOUND_AFTER_INSTALL: $PythonExe"
    }
    & $PythonExe --version
    if ($LASTEXITCODE -ne 0) { throw 'PYTHON_POST_INSTALL_CHECK_FAILED' }
    $python = @{ Exe=$PythonExe; Args=@() }
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
if ($pythonDir -and (($env:PATH -split ';') -notcontains $pythonDir)) {
    $env:PATH = $pythonDir + ';' + $env:PATH
}

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

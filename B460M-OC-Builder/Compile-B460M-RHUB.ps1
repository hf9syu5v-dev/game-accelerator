[CmdletBinding()]
param(
    [string]$IaslPath = ""
)

$ErrorActionPreference = "Stop"
$DslPath = Join-Path $PSScriptRoot "EFI\EFI\OC\ACPI\SSDT-RHUB-B460M-PLUS.dsl"
$OutputPath = Join-Path $PSScriptRoot "EFI\EFI\OC\ACPI\SSDT-RHUB-B460M-PLUS.aml"

if (-not (Test-Path -LiteralPath $DslPath)) {
    throw "DSL file not found: $DslPath"
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
    Write-Host "iasl.exe was not found."
    Write-Host "Install or extract the ACPICA iASL Windows tool, then run this script again."
    Write-Host "Official information: https://open-acpica.github.io/acpica_download.html"
    exit 2
}

Write-Host "Using iASL: $IaslPath"
& $IaslPath -v
if ($LASTEXITCODE -ne 0) {
    throw "Unable to read the iASL version."
}

$workDir = Split-Path -Parent $DslPath
Push-Location $workDir
try {
    if (Test-Path -LiteralPath $OutputPath) {
        Remove-Item -LiteralPath $OutputPath -Force
    }

    & $IaslPath -tc $DslPath
    if ($LASTEXITCODE -ne 0) {
        throw "iASL compilation failed with exit code $LASTEXITCODE"
    }

    if (-not (Test-Path -LiteralPath $OutputPath)) {
        throw "iASL did not create the expected AML file: $OutputPath"
    }

    $bytes = [System.IO.File]::ReadAllBytes($OutputPath)
    if ($bytes.Length -lt 36 -or [System.Text.Encoding]::ASCII.GetString($bytes, 0, 4) -ne "SSDT") {
        throw "The output does not have a valid SSDT AML header."
    }

    $hash = (Get-FileHash -LiteralPath $OutputPath -Algorithm SHA256).Hash
    Write-Host ""
    Write-Host "Compilation successful."
    Write-Host "AML: $OutputPath"
    Write-Host "Size: $($bytes.Length) bytes"
    Write-Host "SHA256: $hash"
    Write-Host "This script only creates the AML file. It does not modify config.plist or other EFI files."
}
finally {
    Pop-Location
}

# B460M-PLUS kext downloader
# ASCII-only source for Windows PowerShell 5.1 compatibility.
# Downloads official RELEASE archives. Does not touch any physical EFI partition.

$ErrorActionPreference = "Stop"

$Root = Join-Path $env:USERPROFILE "Downloads\B460M-OC-Builder"
$DownloadRoot = Join-Path $Root "Tools\Kext-Downloads"
$KextRoot = Join-Path $Root "EFI\EFI\OC\Kexts"

if (-not (Test-Path -LiteralPath $Root -PathType Container)) {
    throw "Project directory not found. Run B460M-RHUB-OneClick.bat first."
}

New-Item -ItemType Directory -Force -Path $DownloadRoot, $KextRoot | Out-Null

# Format: name|version|kext folder|official release URL
$Packages = @(
    "Lilu|1.7.2|Lilu.kext|https://github.com/acidanthera/Lilu/releases/download/1.7.2/Lilu-1.7.2-RELEASE.zip",
    "VirtualSMC|1.3.8|VirtualSMC.kext|https://github.com/acidanthera/VirtualSMC/releases/download/1.3.8/VirtualSMC-1.3.8-RELEASE.zip",
    "WhateverGreen|1.7.1|WhateverGreen.kext|https://github.com/acidanthera/WhateverGreen/releases/download/1.7.1/WhateverGreen-1.7.1-RELEASE.zip",
    "AppleALC|1.9.8|AppleALC.kext|https://github.com/acidanthera/AppleALC/releases/download/1.9.8/AppleALC-1.9.8-RELEASE.zip",
    "IntelMausi|1.0.8|IntelMausi.kext|https://github.com/acidanthera/IntelMausi/releases/download/1.0.8/IntelMausi-1.0.8-RELEASE.zip",
    "NVMeFix|1.1.3|NVMeFix.kext|https://github.com/acidanthera/NVMeFix/releases/download/1.1.3/NVMeFix-1.1.3-RELEASE.zip"
)

$Results = @()

foreach ($Entry in $Packages) {
    $Parts = $Entry.Split("|")
    $Name = $Parts[0]
    $Version = $Parts[1]
    $KextName = $Parts[2]
    $Url = $Parts[3]

    $ZipPath = Join-Path $DownloadRoot ($Name + "-" + $Version + ".zip")
    $ExtractPath = Join-Path $DownloadRoot ($Name + "-" + $Version)

    Write-Host ("Downloading " + $Name + " " + $Version)
    Invoke-WebRequest -Uri $Url -OutFile $ZipPath -UseBasicParsing

    if (-not (Test-Path -LiteralPath $ZipPath -PathType Leaf)) {
        throw ("Download file missing: " + $ZipPath)
    }
    if ((Get-Item -LiteralPath $ZipPath).Length -lt 1024) {
        throw ("Download file is unexpectedly small: " + $ZipPath)
    }

    if (Test-Path -LiteralPath $ExtractPath) {
        Remove-Item -LiteralPath $ExtractPath -Recurse -Force
    }
    New-Item -ItemType Directory -Path $ExtractPath -Force | Out-Null
    Expand-Archive -LiteralPath $ZipPath -DestinationPath $ExtractPath -Force

    $Found = @(Get-ChildItem -LiteralPath $ExtractPath -Directory -Recurse |
        Where-Object { $_.Name -eq $KextName })

    if ($Found.Count -ne 1) {
        throw ("Expected exactly one " + $KextName + " in " + $Name + " archive; found " + $Found.Count)
    }

    $SourceKext = $Found[0].FullName
    $InfoPlist = Join-Path $SourceKext "Contents\Info.plist"
    if (-not (Test-Path -LiteralPath $InfoPlist -PathType Leaf)) {
        throw ("Missing Contents\Info.plist in " + $SourceKext)
    }

    $Destination = Join-Path $KextRoot $KextName
    if (Test-Path -LiteralPath $Destination) {
        Remove-Item -LiteralPath $Destination -Recurse -Force
    }
    Copy-Item -LiteralPath $SourceKext -Destination $Destination -Recurse -Force

    $CopiedInfo = Join-Path $Destination "Contents\Info.plist"
    $Hash = (Get-FileHash -LiteralPath $CopiedInfo -Algorithm SHA256).Hash

    $Results += New-Object PSObject -Property @{
        Kext = $KextName
        Version = $Version
        Status = "OK"
        InfoPlistSHA256 = $Hash
    }

    Write-Host ("OK: " + $KextName) -ForegroundColor Green
}

Write-Host ""
Write-Host "All six kext bundles were downloaded and checked." -ForegroundColor Green
$Results | Format-Table -AutoSize
Write-Host ("Archives: " + $DownloadRoot)
Write-Host ("Kext destination: " + $KextRoot)
Write-Host "No config.plist, BIOS, disk partitions, or physical EFI volumes were modified."

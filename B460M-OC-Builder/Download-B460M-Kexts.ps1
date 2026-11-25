# B460M-OC Builder - Download verified release kexts
# Windows PowerShell 5.1 compatible.
# Downloads official RELEASE archives and copies only the six selected .kext bundles.
# Does not modify config.plist, BIOS, disks, or any existing EFI partition.

$ErrorActionPreference = "Stop"

$Root = Join-Path $env:USERPROFILE "Downloads\B460M-OC-Builder"
$Tools = Join-Path $Root "Tools"
$DownloadRoot = Join-Path $Tools "Kext-Downloads"
$KextRoot = Join-Path $Root "EFI\EFI\OC\Kexts"

if (-not (Test-Path -LiteralPath $Root -PathType Container)) {
    throw "项目目录不存在：$Root。请先运行 B460M-RHUB-OneClick.bat。"
}

New-Item -ItemType Directory -Force -Path $Tools, $DownloadRoot, $KextRoot | Out-Null

$Packages = @(
    @{
        Name = "Lilu"
        Kext = "Lilu.kext"
        Version = "1.7.2"
        Url = "https://github.com/acidanthera/Lilu/releases/download/1.7.2/Lilu-1.7.2-RELEASE.zip"
    },
    @{
        Name = "VirtualSMC"
        Kext = "VirtualSMC.kext"
        Version = "1.3.8"
        Url = "https://github.com/acidanthera/VirtualSMC/releases/download/1.3.8/VirtualSMC-1.3.8-RELEASE.zip"
    },
    @{
        Name = "WhateverGreen"
        Kext = "WhateverGreen.kext"
        Version = "1.7.1"
        Url = "https://github.com/acidanthera/WhateverGreen/releases/download/1.7.1/WhateverGreen-1.7.1-RELEASE.zip"
    },
    @{
        Name = "AppleALC"
        Kext = "AppleALC.kext"
        Version = "1.9.8"
        Url = "https://github.com/acidanthera/AppleALC/releases/download/1.9.8/AppleALC-1.9.8-RELEASE.zip"
    },
    @{
        Name = "IntelMausi"
        Kext = "IntelMausi.kext"
        Version = "1.0.8"
        Url = "https://github.com/acidanthera/IntelMausi/releases/download/1.0.8/IntelMausi-1.0.8-RELEASE.zip"
    },
    @{
        Name = "NVMeFix"
        Kext = "NVMeFix.kext"
        Version = "1.1.3"
        Url = "https://github.com/acidanthera/NVMeFix/releases/download/1.1.3/NVMeFix-1.1.3-RELEASE.zip"
    }
)

Write-Host ""
Write-Host "B460M-PLUS Kext 官方 RELEASE 下载与检查" -ForegroundColor Cyan
Write-Host "目标目录：$KextRoot"
Write-Host ""

$Results = @()

foreach ($Package in $Packages) {
    $ZipPath = Join-Path $DownloadRoot ($Package.Name + "-" + $Package.Version + ".zip")
    $ExtractPath = Join-Path $DownloadRoot ($Package.Name + "-" + $Package.Version)

    Write-Host ("[" + $Package.Name + " " + $Package.Version + "] 下载中...")
    Invoke-WebRequest -Uri $Package.Url -OutFile $ZipPath -UseBasicParsing

    if (-not (Test-Path -LiteralPath $ZipPath -PathType Leaf)) {
        throw "下载文件不存在：$ZipPath"
    }
    if ((Get-Item -LiteralPath $ZipPath).Length -lt 1024) {
        throw "下载文件异常过小，停止处理：$ZipPath"
    }

    if (Test-Path -LiteralPath $ExtractPath) {
        Remove-Item -LiteralPath $ExtractPath -Recurse -Force
    }
    New-Item -ItemType Directory -Path $ExtractPath -Force | Out-Null
    Expand-Archive -LiteralPath $ZipPath -DestinationPath $ExtractPath -Force

    $Matches = @(Get-ChildItem -LiteralPath $ExtractPath -Directory -Recurse |
        Where-Object { $_.Name -eq $Package.Kext })

    if ($Matches.Count -ne 1) {
        throw ("{0} 包内应找到且只找到一个 {1}，实际找到 {2} 个。请停止，不要手动猜路径。" -f $Package.Name, $Package.Kext, $Matches.Count)
    }

    $SourceKext = $Matches[0].FullName
    $InfoPlist = Join-Path $SourceKext "Contents\Info.plist"
    if (-not (Test-Path -LiteralPath $InfoPlist -PathType Leaf)) {
        throw "Kext 缺少 Contents\Info.plist：$SourceKext"
    }

    $Destination = Join-Path $KextRoot $Package.Kext
    if (Test-Path -LiteralPath $Destination) {
        Remove-Item -LiteralPath $Destination -Recurse -Force
    }
    Copy-Item -LiteralPath $SourceKext -Destination $Destination -Recurse -Force

    $CopiedInfo = Join-Path $Destination "Contents\Info.plist"
    $Hash = (Get-FileHash -LiteralPath $CopiedInfo -Algorithm SHA256).Hash
    $Results += [PSCustomObject]@{
        Kext = $Package.Kext
        Version = $Package.Version
        Status = "OK"
        InfoPlistSHA256 = $Hash
    }

    Write-Host ("  完成：{0}" -f $Destination) -ForegroundColor Green
}

Write-Host ""
Write-Host "六个 Kext 均已下载、解压并检查：" -ForegroundColor Green
$Results | Format-Table -AutoSize
Write-Host "下载压缩包保留在：$DownloadRoot"
Write-Host "本脚本没有创建或修改 config.plist，也没有写入任何磁盘 EFI 分区。"

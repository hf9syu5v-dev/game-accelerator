# B460M-PLUS SMBIOS Values Helper
# Windows PowerShell 5.1+
# Collects GenSMBIOS output and derives ROM from the Intel I219-V MAC.
# Does not edit EFI, config.plist, BIOS, or any disk.

$ErrorActionPreference = "Stop"

function Read-Value {
    param([string]$Prompt, [string]$Pattern, [string]$ErrorText, [switch]$Upper)
    while ($true) {
        $v = (Read-Host $Prompt).Trim()
        if ($Upper) { $v = $v.ToUpperInvariant() }
        if ($v -match $Pattern) { return $v }
        Write-Host $ErrorText -ForegroundColor Yellow
    }
}

Write-Host "==================================================" -ForegroundColor Cyan
Write-Host " B460M-PLUS SMBIOS 值生成助手" -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "先运行官方 GenSMBIOS.bat："
Write-Host "  1. 主菜单选 1：Install/Update MacSerial（已安装可跳过）"
Write-Host "  2. 主菜单选 3：Generate SMBIOS"
Write-Host "  3. 输入 iMac20,1，生成 1 组"
Write-Host "  4. 记下同一组输出的 Serial、Board Serial、SmUUID"
Write-Host ""
Write-Host "Type 必须是 iMac20,1。不要混用不同批次的 Serial 和 Board Serial。" -ForegroundColor Yellow
$ready = Read-Host "完成后输入 Y 继续"
if ($ready -notmatch '^(?i)y$') { Write-Host "请先完成 GenSMBIOS 步骤。"; exit 0 }

$serial = Read-Value "Serial（12 位字母/数字）" '^[A-Z0-9]{12}$' "Serial 格式不正确，请复制 GenSMBIOS 的 Serial。" -Upper
$mlb = Read-Value "Board Serial / MLB（通常 17 位字母/数字）" '^[A-Z0-9]{17}$' "MLB 格式不正确，请复制同一组的 Board Serial。" -Upper
$uuidText = Read-Value "SmUUID（标准 UUID）" '^[0-9A-Fa-f]{8}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{12}$' "UUID 格式不正确，请复制同一组的 SmUUID。" -Upper
$guid = [guid]::Empty
if (-not [guid]::TryParse($uuidText, [ref]$guid)) { throw "SmUUID 无法解析。" }
$uuid = $guid.ToString("D").ToUpperInvariant()

Write-Host ""
Write-Host "正在查找 Intel I219-V 网卡……" -ForegroundColor Cyan
$adapters = @()
if (Get-Command Get-NetAdapter -ErrorAction SilentlyContinue) {
    $adapters = @(Get-NetAdapter -Physical -ErrorAction SilentlyContinue | Where-Object {
        ($_.InterfaceDescription -match 'I219[- ]?V' -or $_.Name -match 'I219[- ]?V') -and
        $_.MacAddress -match '^[0-9A-Fa-f]{2}([-:][0-9A-Fa-f]{2}){5}$'
    })
}
$mac = $null
if ($adapters.Count -eq 1) {
    $a = $adapters[0]
    Write-Host ("检测到 {0} / {1} / {2}" -f $a.Name, $a.InterfaceDescription, $a.MacAddress)
    if ((Read-Host "使用此网卡 MAC 作为 ROM？输入 Y 确认") -match '^(?i)y$') { $mac = $a.MacAddress }
} elseif ($adapters.Count -gt 1) {
    for ($i = 0; $i -lt $adapters.Count; $i++) {
        Write-Host ("[{0}] {1} / {2} / {3}" -f ($i+1), $adapters[$i].Name, $adapters[$i].InterfaceDescription, $adapters[$i].MacAddress)
    }
    $choice = Read-Host "输入要使用的网卡编号；回车则手动输入"
    $n = 0
    if ([int]::TryParse($choice, [ref]$n) -and $n -ge 1 -and $n -le $adapters.Count) { $mac = $adapters[$n-1].MacAddress }
}
while (-not $mac) {
    $mac = (Read-Host "请输入 I219-V 物理 MAC（例如 AA-BB-CC-DD-EE-FF）").Trim()
    if ($mac -notmatch '^[0-9A-Fa-f]{2}([-:][0-9A-Fa-f]{2}){5}$') {
        Write-Host "MAC 格式不正确。" -ForegroundColor Yellow
        $mac = $null
    }
}
$rom = ($mac -replace '[-:]','').ToLowerInvariant()
if ($rom -notmatch '^[0-9a-f]{12}$' -or $rom -eq '000000000000' -or $rom -eq 'ffffffffffff') { throw "MAC 无效。" }
$first = [Convert]::ToInt32($rom.Substring(0,2),16)
if (($first -band 1) -ne 0) { throw "这是组播 MAC，不可用作 ROM。请检查 I219-V 物理 MAC。" }

Write-Host ""
Write-Host "请核对以下结果：" -ForegroundColor Cyan
Write-Host "SystemProductName  : iMac20,1"
Write-Host "SystemSerialNumber : $serial"
Write-Host "MLB                : $mlb"
Write-Host "SystemUUID         : $uuid"
Write-Host "I219-V MAC         : $($mac.ToUpperInvariant())"
Write-Host "ROM                : $rom"
Write-Host ""
if ((Read-Host "确认并保存到本机 Documents？输入 YES") -cne "YES") {
    Write-Host "已取消，未保存任何内容。" -ForegroundColor Yellow
    exit 0
}

$docs = [Environment]::GetFolderPath("MyDocuments")
if ([string]::IsNullOrWhiteSpace($docs) -or -not (Test-Path $docs)) { $docs = Join-Path $env:USERPROFILE "Documents" }
New-Item -ItemType Directory -Path $docs -Force | Out-Null
$out = Join-Path $docs "B460M-SMBIOS-Values-LOCAL.txt"
@(
    "B460M-PLUS OpenCore PlatformInfo / Generic"
    "Generated locally: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    ""
    "SystemProductName = iMac20,1"
    "SystemSerialNumber = $serial"
    "MLB = $mlb"
    "ROM = $rom"
    "SystemUUID = $uuid"
    "Source NIC = Intel I219-V"
    "NIC MAC = $($mac.ToUpperInvariant())"
    ""
    "Keep private. Do not upload or commit this file to GitHub."
) | Set-Content -LiteralPath $out -Encoding UTF8

Write-Host ""
Write-Host "保存成功：$out" -ForegroundColor Green
Write-Host "结果只保存在本机。不要公开发布，也不要提交到 GitHub。"
Write-Host "本脚本没有修改 EFI、config.plist、BIOS 或任何磁盘。"

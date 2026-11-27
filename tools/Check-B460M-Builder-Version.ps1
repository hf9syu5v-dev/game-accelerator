[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$downloads = Join-Path $env:USERPROFILE 'Downloads'
$expectedName = 'Build-B460M-Sequoia-USB-Samsung-256GB.ps1'
$expectedHash = '415ce293bcc536a1bef3742460b62e5f73bde56564b336b1fc18ddd807277fd6'

Write-Host ''
Write-Host 'B460M BUILDER VERSION CHECK - READ ONLY' -ForegroundColor Cyan
Write-Host 'No disks, partitions, volumes, or files will be modified.'
Write-Host ('Downloads folder: ' + $downloads)
Write-Host ('Expected SHA256: ' + $expectedHash)
Write-Host ''

$files = @(Get-ChildItem -LiteralPath $downloads -File -Filter 'Build-B460M-Sequoia-USB-Samsung-256GB*.ps1' -ErrorAction Stop |
    Sort-Object LastWriteTime -Descending)

if ($files.Count -eq 0) {
    Write-Host 'RESULT: No matching builder script found in Downloads.' -ForegroundColor Red
    exit 2
}

foreach ($file in $files) {
    $hash = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash.ToLowerInvariant()
    $text = Get-Content -LiteralPath $file.FullName -Raw
    $hasNewGuard = $text.Contains('CONFIRMED_EXISTING_LAYOUT') -and
                   $text.Contains('ERASE ALL PARTITIONS ON SAMSUNG USB ') -and
                   $text.Contains('Assert-ExistingTargetLayout')
    $hasOldGuard = $text.Contains('The confirmed preparation state was an empty GPT disk') -or
                   $text.Contains('target USB currently has') -or
                   $text.Contains('Drive letters E: and F: are never assigned or modified.')

    [pscustomobject]@{
        FileName = $file.Name
        FullPath = $file.FullName
        LengthBytes = $file.Length
        LastWriteTime = $file.LastWriteTime
        SHA256 = $hash
        MatchesExpectedSHA256 = ($hash -eq $expectedHash)
        ContainsNewThreePartitionGuard = $hasNewGuard
        ContainsOldEmptyDiskGuard = $hasOldGuard
    } | Format-List
}

Write-Host 'CHECK_COMPLETE: READ ONLY; NO DISK CHANGES MADE.' -ForegroundColor Green

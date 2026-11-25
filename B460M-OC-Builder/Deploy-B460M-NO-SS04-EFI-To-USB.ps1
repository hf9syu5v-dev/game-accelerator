# Deploy the verified NO-SS04 diagnostic EFI to the existing 128GB LITEON USB.
# Windows PowerShell 5.1; run as Administrator.
$ErrorActionPreference = "Stop"
$ExpectedSerial = "000000123ADC"
$ExpectedDiskSize = 128035676160
$ExpectedEspGuid = "{c12a7328-f81f-11d2-ba4b-00a0c93ec93b}"
$ArtifactZip = Join-Path $env:USERPROFILE "Downloads\B460M-NO-SS04-DIAGNOSTIC-ARTIFACT.zip"
$Work = Join-Path $env:TEMP ("B460M-NO-SS04-" + [guid]::NewGuid().ToString("N"))
$Mounted = $false
$Drive = $null
$Partition = $null
$TargetRoot = $null
$BackupName = "EFI_PRE_NO_SS04_BACKUP"
$OldRenamed = $false
try {
    Write-Host "=== B460M NO-SS04 EFI deployment ===" -ForegroundColor Cyan
    if ($PSVersionTable.PSVersion.Major -ne 5 -or $PSVersionTable.PSVersion.Minor -ne 1) { throw "This deployment script requires Windows PowerShell 5.1." }
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($identity)
    if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) { throw "Please rerun PowerShell as Administrator." }

    $matches = @(Get-Disk | Where-Object { $_.SerialNumber -and ($_.SerialNumber.Trim() -replace '\s','') -eq $ExpectedSerial })
    if ($matches.Count -ne 1) { throw "Expected exactly one USB disk with serial $ExpectedSerial; found $($matches.Count)." }
    $disk = $matches[0]
    if ($disk.IsBoot -or $disk.IsSystem) { throw "Safety stop: target disk is marked Boot or System." }
    if ([math]::Abs([double]$disk.Size - [double]$ExpectedDiskSize) -gt 2000000000) { throw "Safety stop: target disk size mismatch." }
    if ($disk.PartitionStyle -ne "GPT") { throw "Safety stop: target disk is not GPT." }

    $Partition = Get-Partition -DiskNumber $disk.Number -PartitionNumber 2 -ErrorAction Stop
    if ($Partition.GptType.ToLowerInvariant() -ne $ExpectedEspGuid) { throw "Safety stop: partition 2 is not the EFI System Partition type." }
    if ([math]::Abs([double]$Partition.Size - 16777216000) -gt 500000000) { throw "Safety stop: partition 2 is not the expected 16GB partition." }
    $vol = Get-Volume -Partition $Partition -ErrorAction Stop
    if ($vol.FileSystem -ne "FAT32") { throw "Safety stop: partition 2 is not FAT32." }

    Write-Host ("TARGET VERIFIED: Disk {0} / {1} / serial {2}" -f $disk.Number,$disk.FriendlyName,$ExpectedSerial) -ForegroundColor Green
    Write-Host ("PARTITION VERIFIED: #2 / ESP / FAT32 / {0:N2} GB" -f ($Partition.Size / 1GB)) -ForegroundColor Green
    Write-Host "Only the EFI directory will be replaced. BaseSystem.dmg and BaseSystem.chunklist will be preserved."
    $answer = Read-Host "Type exactly DEPLOY NO-SS04 EFI"
    if ($answer -cne "DEPLOY NO-SS04 EFI") { throw "Cancelled by user; no USB files changed." }

    New-Item -ItemType Directory -Path $Work -Force | Out-Null
    $outer = $ArtifactZip
    if (-not (Test-Path -LiteralPath $outer)) { throw "Diagnostic artifact ZIP not found at $outer. Download it from the provided file link into your Downloads folder first." }
    Write-Host "Using the downloaded diagnostic artifact ZIP..."
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $outerDir = Join-Path $Work "outer"
    [System.IO.Compression.ZipFile]::ExtractToDirectory($outer,$outerDir)
    $inner = Get-ChildItem -Path $outerDir -Filter "B460M-no-SS04-Diagnostic-EFI.zip" -Recurse -File | Select-Object -First 1
    if (-not $inner) { throw "Expected EFI archive not found in downloaded artifact." }
    $innerDir = Join-Path $Work "inner"
    [System.IO.Compression.ZipFile]::ExtractToDirectory($inner.FullName,$innerDir)
    $efiSource = Get-ChildItem -Path $innerDir -Directory -Filter "EFI" -Recurse | Select-Object -First 1
    if (-not $efiSource) { throw "EFI directory not found in artifact." }
    foreach ($required in @("BOOT\BOOTx64.efi","OC\OpenCore.efi","OC\config.plist","OC\Kexts\UTBMap.kext\Contents\Info.plist")) {
        if (-not (Test-Path (Join-Path $efiSource.FullName $required))) { throw "EFI artifact missing: $required" }
    }

    $used = @(Get-Volume | Where-Object { $_.DriveLetter } | ForEach-Object { [string]$_.DriveLetter })
    foreach ($candidate in @("Z","Y","X","W","V","U","T","S","R")) { if ($used -notcontains $candidate) { $Drive = $candidate; break } }
    if (-not $Drive) { throw "No free drive letter available for temporary ESP access." }
    Add-PartitionAccessPath -DiskNumber $disk.Number -PartitionNumber 2 -AccessPath "$($Drive):\"
    $Mounted = $true
    $TargetRoot = "$($Drive):\"
    if (-not (Test-Path $TargetRoot)) { throw "Temporary ESP mount failed." }

    $recoveryDmg = Join-Path $TargetRoot "BaseSystem.dmg"
    $recoveryChunk = Join-Path $TargetRoot "BaseSystem.chunklist"
    if (-not (Test-Path $recoveryDmg) -or -not (Test-Path $recoveryChunk)) { throw "Safety stop: Apple Recovery files missing from USB root." }
    $existingEFI = Join-Path $TargetRoot "EFI"
    if (-not (Test-Path $existingEFI)) { throw "Existing EFI directory not found; refusing to initialize USB." }
    if (Test-Path (Join-Path $TargetRoot $BackupName)) { throw "EFI backup already exists; refusing to overwrite it." }

    Write-Host "Recovery files confirmed. Backing up current EFI..."
    Rename-Item -LiteralPath $existingEFI -NewName $BackupName
    $OldRenamed = $true
    try {
        Copy-Item -LiteralPath $efiSource.FullName -Destination $TargetRoot -Recurse
        $destBoot = Join-Path $TargetRoot "EFI\BOOT\BOOTx64.efi"
        $destConfig = Join-Path $TargetRoot "EFI\OC\config.plist"
        if (-not (Test-Path $destBoot) -or -not (Test-Path $destConfig)) { throw "Post-copy verification failed." }
        $mapPath = Join-Path $TargetRoot "EFI\OC\Kexts\UTBMap.kext\Contents\Info.plist"
        $mapText = Get-Content -LiteralPath $mapPath -Raw
        if ($mapText -match 'key>\s*HS04\s*<' -or $mapText -match 'key>\s*SS04\s*<') { throw "HS04 or SS04 remains in UTBMap." }
        if (-not (Test-Path $recoveryDmg) -or -not (Test-Path $recoveryChunk)) { throw "Recovery files changed unexpectedly." }
        Write-Host "DEPLOYMENT_VERIFIED=PASS" -ForegroundColor Green
        Write-Host "EFI_BACKUP=$BackupName"
        Write-Host "APPLE_RECOVERY_FILES=PRESERVED"
        Write-Host "HS04_SS04=ABSENT"
        Write-Host "INTERNAL_DISKS=NOT_TOUCHED"
    }
    catch {
        Write-Warning "Deployment failed; restoring the original EFI."
        if (Test-Path (Join-Path $TargetRoot "EFI")) { Remove-Item -LiteralPath (Join-Path $TargetRoot "EFI") -Recurse -Force }
        if ($OldRenamed -and (Test-Path (Join-Path $TargetRoot $BackupName))) {
            Rename-Item -LiteralPath (Join-Path $TargetRoot $BackupName) -NewName "EFI"
            $OldRenamed = $false
        }
        throw
    }
}
catch {
    Write-Host ("ERROR: " + $_.Exception.Message) -ForegroundColor Red
    exit 1
}
finally {
    if ($Mounted -and $Partition -and $Drive) {
        try { Remove-PartitionAccessPath -DiskNumber $disk.Number -PartitionNumber 2 -AccessPath "$($Drive):\" -ErrorAction Stop } catch { Write-Warning "Could not remove temporary drive letter $Drive; remove it in Disk Management after checking USB." }
    }
    if (Test-Path $Work) { Remove-Item -LiteralPath $Work -Recurse -Force -ErrorAction SilentlyContinue }
}

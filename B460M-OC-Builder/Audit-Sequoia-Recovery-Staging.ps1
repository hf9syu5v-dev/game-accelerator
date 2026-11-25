# Read-only audit of the Sequoia Recovery staging directory.
# Does not create, delete, rename, or modify any files.
[CmdletBinding()]
param()
$ErrorActionPreference='Stop'
$Drive='F'
$ExpectedModel='LITEON I T LCS-128L9S'
$ExpectedSerial='000000123ADC'
$ExpectedDiskBytes=[int64]128035676160
Write-Host '=== SEQUOIA RECOVERY STAGING AUDIT (READ ONLY) ===' -ForegroundColor Cyan
$part=Get-Partition -DriveLetter $Drive -ErrorAction Stop
$disk=Get-Disk -Number $part.DiskNumber -ErrorAction Stop
if($disk.FriendlyName -ne $ExpectedModel -or $disk.SerialNumber.Trim() -ne $ExpectedSerial -or $disk.BusType -ne 'USB' -or [math]::Abs([double]$disk.Size-[double]$ExpectedDiskBytes) -gt 2MB -or $disk.IsBoot -or $disk.IsSystem){
    throw 'SAFETY_STOP: F: is not the authorized USB. No changes made.'
}
Write-Host ("USB VERIFIED: Disk {0}; {1}; Serial {2}" -f $disk.Number,$disk.FriendlyName,$disk.SerialNumber) -ForegroundColor Green
$root='F:\'
$names=@('com.apple.recovery.boot','com.apple.recovery.boot-SEQUOIA-STAGING','com.apple.recovery.boot-PREVIOUS','com.apple.recovery.boot-FAILED')
foreach($name in $names){
    $p=Join-Path $root $name
    if(Test-Path -LiteralPath $p){
        $item=Get-Item -LiteralPath $p -Force
        Write-Host ''
        Write-Host ("DIRECTORY: {0}" -f $name) -ForegroundColor Yellow
        Get-ChildItem -LiteralPath $p -Force -File | ForEach-Object {
            $hash=(Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash.ToLowerInvariant()
            Write-Host ("FILE={0}; SIZE={1}; SHA256={2}" -f $_.Name,$_.Length,$hash)
        }
        Get-ChildItem -LiteralPath $p -Force -Directory | ForEach-Object {
            Write-Host ("SUBDIRECTORY={0}" -f $_.Name)
        }
        if(-not (Get-ChildItem -LiteralPath $p -Force | Select-Object -First 1)){
            Write-Host 'DIRECTORY_EMPTY=True'
        }
    } else {
        Write-Host ("DIRECTORY_NOT_FOUND: {0}" -f $name)
    }
}
Write-Host ''
Write-Host 'AUDIT_COMPLETE; NO_FILES_CHANGED' -ForegroundColor Green

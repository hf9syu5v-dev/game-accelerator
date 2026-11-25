# B460M CPU read-only identity and topology report
# Compatible with Windows PowerShell 5.1+
# Read-only: does not change BIOS, EFI, configuration, or disks.

$ErrorActionPreference = "Stop"
$cpu = @(Get-CimInstance -ClassName Win32_Processor)
$computer = Get-CimInstance -ClassName Win32_ComputerSystem
$os = Get-CimInstance -ClassName Win32_OperatingSystem

$lines = New-Object System.Collections.Generic.List[string]
$lines.Add("B460M CPU READ-ONLY REPORT")
$lines.Add("Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')")
$lines.Add("Computer: $($computer.Manufacturer) $($computer.Model)")
$lines.Add("Windows: $($os.Caption) / $($os.Version)")
$lines.Add("Environment logical processors: $([Environment]::ProcessorCount)")
$lines.Add("ComputerSystem logical processors: $($computer.NumberOfLogicalProcessors)")
$lines.Add("")

foreach ($p in $cpu) {
    $lines.Add("Name: $($p.Name)")
    $lines.Add("Manufacturer: $($p.Manufacturer)")
    $lines.Add("ProcessorId (WMI): $($p.ProcessorId)")
    $lines.Add("NumberOfCores: $($p.NumberOfCores)")
    $lines.Add("NumberOfLogicalProcessors: $($p.NumberOfLogicalProcessors)")
    $lines.Add("MaxClockSpeed MHz: $($p.MaxClockSpeed)")
    $lines.Add("Family: $($p.Family)")
    $lines.Add("Stepping: $($p.Stepping)")
    $lines.Add("Revision: $($p.Revision)")
    $id = [string]$p.ProcessorId
    if ($id -match '^[0-9A-Fa-f]{16}$') {
        $sig = $id.Substring(0, 8).ToUpperInvariant()
        $lines.Add("Candidate CPUID leaf 1 EAX from WMI ProcessorId prefix: 0x$sig")
        $lines.Add("Note: WMI ProcessorId is a firmware/OS-reported identifier; confirm against a direct CPUID utility if available.")
    } else {
        $lines.Add("CPUID signature extraction: unavailable (unexpected WMI ProcessorId format)")
    }
    $lines.Add("")
}

$lines.Add("READ-ONLY: no BIOS, EFI, disk, or configuration changes were made.")
$report = $lines -join [Environment]::NewLine
Write-Host $report

$out = Join-Path $PSScriptRoot "B460M-CPU-ReadOnly-Report.txt"
[System.IO.File]::WriteAllText($out, $report + [Environment]::NewLine, (New-Object System.Text.UTF8Encoding($true)))
Write-Host ""
Write-Host "Report saved to: $out" -ForegroundColor Green
Write-Host "Review it before sharing; it contains hardware identifiers."

<# : batch script
@echo off
powershell -nop "if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) { Start-Process -Verb RunAs 'cmd.exe' -ArgumentList '/c \"%~dpnx0\" %*' } else { Invoke-Expression ([System.IO.File]::ReadAllText('%~f0')) }"
goto :eof
#>

$ClearAV = $true
$ClearQuarantine = $true
$ClearCFA = $true
$RemoveTask = $true

# ClearAV: Clear history of detected viruses and malware
# ClearQuarantine: Clear Quarantined items
# ClearCFA: Clear history of Controlled Folder Access blocks
# RemoveTask: Remove task after running

# If $RemoveTask is set to $false, then you would run this script just once to create a permanent task that clears the protection history every restart. Do not set this option to $false unless you really never want to see the protection history.

$Defender = 'C:\ProgramData\Microsoft\Windows Defender'
$Quarantine = "$Defender\Quarantine"
$Scans = "$Defender\Scans"
$Service = "$Scans\History\Service"
$db = "$Scans\mpenginedb.db*"
$TN = "DWDH"

if ($ClearAV)         { $C1 = "rd /s /q `"$Service`" & " }
if ($ClearQuarantine) { $C2 = "rd /s /q `"$Quarantine`" & " }
if ($ClearCFA)        { $C3 = "del /f `"$db`" & " }
if ($RemoveTask)      { $C4 = "schtasks /delete /f /tn $TN" }

$TD = "Delete Windows Defender History"
$TA = New-ScheduledTaskAction -Execute 'cmd.exe' -Argument "/c $C1$C2$C3$C4"
$TT = New-ScheduledTaskTrigger -AtStartup
$TP = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount
$TS = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries
Register-ScheduledTask -Force -Description $TD -Action $TA -Trigger $TT -Principal $TP -Settings $TS -TaskName $TN >$Null

$choice = (Read-Host "`nA restart is required to clear the Protection history. Enter y to restart now").ToLower()
if ($choice -eq "y") { Restart-Computer }
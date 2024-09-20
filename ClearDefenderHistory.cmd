<# : batch script
@echo off
powershell -nop "if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) { Start-Process -Verb RunAs 'cmd.exe' -ArgumentList '/c %~dpnx0 %*' } else { Invoke-Expression ([System.IO.File]::ReadAllText('%~f0')) }"
goto :eof
#>

$ClearAV = $true
$ClearCFA = $true
$RemoveTask = $true

# ClearAV: Clear history of detected viruses and malware
# ClearCFA: Clear history of Controlled Folder Access blocks
# RemoveTask: Remove task after running

# If $RemoveTask is set to $false, then you would run this script just once to create a permanent task that clears the protection history every restart. Do not set this option to $false unless you really never want to see the protection history.

$Scans = 'C:\ProgramData\Microsoft\Windows Defender\Scans'
$Service = "$Scans\History\Service"
$db = "$Scans\mpenginedb.db*"

if ($ClearAV)    { $C1 = "rd /s /q \`"$Service\`" & " }
if ($ClearCFA)   { $C2 = "del \`"$db\`" & " }
if ($RemoveTask) { $C3 = "schtasks /delete /f /tn DWDH" }

schtasks /create /f /sc onStart /ru 'NT AUTHORITY\SYSTEM' /tn DWDH /tr "cmd.exe /c $C1$C2$C3"

$choice = (Read-Host "`nA restart is required to clear the Protection history. Enter y to restart now").ToLower()
if ($choice -eq "y") { Restart-Computer }

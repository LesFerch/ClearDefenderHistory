<# : batch script
@echo off
powershell -nop "if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) { Start-Process -Verb RunAs 'cmd.exe' -ArgumentList '/c %~dpnx0 %*' } else { Invoke-Expression ([System.IO.File]::ReadAllText('%~f0')) }"
goto :eof
#>

$folder = 'C:\ProgramData\Microsoft\Windows Defender\Scans\History\Service'
$file = "$folder\Detections.log"

if (Test-Path $file) {
  schtasks /create /f /sc onStart /ru 'NT AUTHORITY\SYSTEM' /tn DWDH /tr "cmd.exe /c rd /s /q \`"$folder\`" & schtasks /delete /f /tn DWDH"

  $choice = (Read-Host "`nA restart is required to clear the Protection history. Enter y to restart now").ToLower()
  if ($choice -eq "y") { Restart-Computer }
}

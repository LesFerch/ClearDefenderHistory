::This is an alternative script that does not use PowerShell.

::Please use the other script (ClearDefenderHistory.cmd) unless PowerShell is disabled.

::Due to an schtasks limitation, the task created by this script requires the computer to be plugged in. If your computer is running from battery, it just means that the Protection history won't be cleared until the next restart while plugged in.

::Place this script in a convenient location, such as C:\Tools.

::To run this script directly, right-click it and select "Run as administrator".

::Better yet, create a shortcut. Here's how:
::Right-click this script and select "Create shortcut".
::Right-click the shortcut and select Properties > Advanced > Run as administrator > OK.
::Optionally click "Change icon" and select an icon for the shortcut then click OK.
::Give the shortcut a tidy name such as "Clear Defender History".
::Move the shortcut to a convenient location such as your Desktop.

@echo off
schtasks -create -f -sc onStart -ru "NT AUTHORITY\SYSTEM" -tn DWDH -tr "cmd /c cd /d 'C:\ProgramData\Microsoft\Windows Defender\Scans' & rd /s /q History\Service & del /f mpenginedb.db* & schtasks /delete /f /tn DWDH" >nul 2>nul

schtasks /query /tn DWDH >nul 2>nul
if errorlevel 1 echo. & echo Please Run as adminstrator & echo. & pause & goto end

echo.
choice /m "Restart now to clear Defender history (y/n)?" /c YN /n
if errorlevel 2 (goto end) else (shutdown /r /t 0)
:end
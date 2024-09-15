::If not already elevated, right-click this batch file and select "Run as Administrator"

schtasks /create /f /sc onStart /ru "NT AUTHORITY\SYSTEM" /tn DWDH /tr "cmd.exe /c rd /s /q 'C:\ProgramData\Microsoft\Windows Defender\Scans\History\Service'"

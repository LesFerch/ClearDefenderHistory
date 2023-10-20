<# : batch script
@echo off
powershell -nop "if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) { Start-Process -Verb RunAs 'cmd.exe' -ArgumentList '/c %~dpnx0 %*' } else { Invoke-Expression ([System.IO.File]::ReadAllText('%~f0')) }"
goto :eof
#>

# https://www.tiraniddo.dev/2019/09/the-art-of-becoming-trustedinstaller.html

$ScriptBlock = {
    $MAPS_Status = (Get-MpPreference).MAPSReporting
    Set-MpPreference -DisableRealtimeMonitoring 1
    Set-MpPreference -MAPSReporting Disabled

    Get-ChildItem -File 'C:\ProgramData\Microsoft\Windows Defender\Scans\History\Service' -Recurse | Remove-Item -Force

    Set-MpPreference -DisableRealtimeMonitoring 0
    Set-MpPreference -MAPSReporting $MAPS_Status
}

# Create scheduled task

$TaskName = 'Clear Defender Protection History'
$SchedulerPath = '\Microsoft\Windows\PowerShell\ScheduledJobs'
Register-ScheduledJob -Name $TaskName -ScriptBlock $ScriptBlock | Out-Null

$Principal = New-ScheduledTaskPrincipal -UserId "$env:COMPUTERNAME\Administrator"
Set-ScheduledTask -TaskPath $SchedulerPath -TaskName $TaskName -Principal $Principal | Out-Null

$Service = New-Object -ComObject 'Schedule.Service'
$Service.Connect()

# Invoke task as TI

$User = 'NT SERVICE\TrustedInstaller'
$Folder = $Service.GetFolder($SchedulerPath)
$Task = $Folder.GetTask($TaskName)

$Task.RunEx($null, 0, 0, $User) | Out-Null

# Wait for task completion, or timed out

$Timeout = 60
$Timer =  [Diagnostics.Stopwatch]::StartNew()

while (((Get-ScheduledTask -TaskName $TaskName).State -ne 'Ready') -and ($Timer.Elapsed.TotalSeconds -lt $Timeout)) {
    Start-Sleep -Seconds 1
}

$Timer.Stop()

# Remove scheduled task
Unregister-ScheduledJob $TaskName -Confirm:$false | Out-Null

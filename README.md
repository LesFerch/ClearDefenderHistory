# ClearDefenderHistory

### Written by: [tenforums member: garlin](https://www.tenforums.com/members/garlin.html)
### [Click here to see the original post](https://www.tenforums.com/antivirus-firewalls-system-security/133451-clear-windows-security-center-defender-protection-history-post2561559.html#post2561559)

[![image](https://github.com/LesFerch/WinSetView/assets/79026235/0188480f-ca53-45d5-b9ff-daafff32869e)Download the zip file](https://github.com/LesFerch/ClearDefenderHistory/archive/refs/heads/main.zip)

## Clear Windows Defender History Files

**ClearDefenderHistory.bat** safely stops Defender protections, clears the history files, and then restarts protection. It's a wrapper to a PowerShell script that creates a temporary scheduled task and runs as **TrustedInstaller**.

## Purpose

Some people may want to run this script just to clean things up and not see old detections under **Protection history**.

For others, it fixes an issue where Defender continues to detect a file as a virus even after the Defender team has updated the definitions so that the "detection has been removed".

## How to Download and Run

1. Download the zip file using the link above.
2. Extract **ClearDefenderHistory.bat**.
3. Right-click **ClearDefenderHistory.bat**, select Properties, check **Unblock**, and click **OK**.
4. Double-click  **ClearDefenderHistory.bat** to run it. You will get a UAC prompt, unless you are already running it from an elevated console.
5. If you skipped step 3, then just click **Run** when you get the security warning.

**Note**: Some antivirus software may falsely detect the download as a virus. This can happen any time you download a new script and may require extra steps to whitelist the file.

\
\
[![image](https://github.com/LesFerch/WinSetView/assets/79026235/63b7acbc-36ef-4578-b96a-d0b7ea0cba3a)](https://github.com/LesFerch/ClearDefenderHistory)

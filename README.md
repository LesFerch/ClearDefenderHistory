# ClearDefenderHistory

[![image](https://github.com/LesFerch/WinSetView/assets/79026235/0188480f-ca53-45d5-b9ff-daafff32869e)Download the zip file](https://github.com/LesFerch/ClearDefenderHistory/archive/refs/heads/main.zip)

## Clear Windows Defender History Files

**ClearDefenderHistory.cmd** clears the Windows Defender "Protection history" by creating a scheduled task, configured to run as SYSTEM, that clears the Windows Defender log folder on next restart of the computer.

**Note**: Previous versions of this script were able to clear the history without a restart. A change to Windows Defender security in the Spring of 2024 broke the previous method. Until a better method is found, a restart is now required.

## Purpose

Some people may want to run this script just to clean things up and not see old detections under **Protection history**. For others, it fixes an issue where Defender continues to throw a false positive even after new definitions have been installed that should eliminate the detection.

## How to Download and Run

1. Download the zip file using the link above.
2. Extract **ClearDefenderHistory.cmd**.
3. Right-click **ClearDefenderHistory.cmd**, select Properties, check **Unblock**, and click **OK**.
4. Double-click  **ClearDefenderHistory.cmd** to run it. You will get a UAC prompt, unless you are already running it from an elevated console.
5. If you skipped step 3, then just click **Run** when you get the security warning.

**Note**: Some antivirus software may falsely detect the download as a virus. This can happen any time you download a new script and may require extra steps to whitelist the file.

### Additional options

See the comments in the script for additional options.

\
\
[![image](https://github.com/LesFerch/WinSetView/assets/79026235/63b7acbc-36ef-4578-b96a-d0b7ea0cba3a)](https://github.com/LesFerch/ClearDefenderHistory)

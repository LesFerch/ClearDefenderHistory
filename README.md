# ClearDefenderHistory

[![image](https://user-images.githubusercontent.com/79026235/152910441-59ba653c-5607-4f59-90c0-bc2851bf2688.png)Download the zip file](https://github.com/LesFerch/ClearDefenderHistory/archive/refs/heads/main.zip)

## Clear Windows Defender History Files

**ClearDefenderHistory.bat** safely stops Defender protections, clears the history files, and then restarts protection. It's a wrapper to a PowerShell script that creates a temporary scheduled task and runs as **TrustedInstaller**.

## Purpose

Some people may want to run this script just to clean things up and not see old detections under **Protection history**.

For others, it fixes an issue where Defender continues to detect a file as a virus even after the Defender team has updated the definitions so that the "detection has been removed".

# How to Download and Run

1. Download the zip file using the link above.
2. Extract **ClearDefenderHistory.bat**.
3. Right-click **ClearDefenderHistory.bat**, select Properties, check **Unblock**, and click **OK**.
4. Double-click  **ClearDefenderHistory.bat** to run it. You will get a UAC prompt, unless you are already running it from an elevated console.
5. If you skipped step 3, then just click **Run** when you get the security warning.

**Note**: Some antivirus software may falsely detect the download as a virus. This can happen anytime you download a new script and may require extra steps to whitelist the file.

\
\
[![image](https://user-images.githubusercontent.com/79026235/153264696-8ec747dd-37ec-4fc1-89a1-3d6ea3259a95.png)](https://github.com/LesFerch/ClearDefenderHistory)

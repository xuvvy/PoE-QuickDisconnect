#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#Persistent
#SingleInstance force

/*
-----------------------------------------
Path of Exile - Quick Disconnect v1.0.0
-----------------------------------------
*/

global userHotkey, doublePress, doublePressDuration, cPortsURL

; Check for Admin privilege and re-run as Admin if necessary
if not A_IsAdmin
{
    Run *RunAs "%A_ScriptFullPath%"
    ExitApp
}

Menu, Tray, Tip, QDC v1.0.0

VerifyIniFile()
VerifyCPorts()

Hotkey, ~%userHotkey%, HotkeyLabel
return

; Define hotkey label and call function to handle hotkey press

HotkeyLabel:
    HandleHotkey()
return

; Verify the INI config file, create if doesn't exist
VerifyIniFile()
{
    if !FileExist("config.ini")
    {
        FileAppend,
        (
[Settings]
; The desired hotkey in the AHK format (https://www.autohotkey.com/docs/v1/KeyList.htm)
Hotkey=Escape
; Determines if the hotkey need to be pressed twice to trigger
DoublePress=True
; Time (in seconds) between hotkey presses to register as a double-press
DoublePressDuration=0.1
; The URL for downloading the cports.exe used for the TCP Disconnect function
CPortsURL=https://www.nirsoft.net/utils/cports-x64.zip

        ), config.ini
    }

    IniRead, userHotkey, config.ini, Settings, Hotkey
    IniRead, doublePress, config.ini, Settings, DoublePress
    IniRead, doublePressDuration, config.ini, Settings, DoublePressDuration
    IniRead, cPortsURL, config.ini, Settings, CPortsURL

    doublePress := (doublePress = "True" ? 1 : 0)
}

; Verify the existence of the cports folder and cports.exe, download if missing
VerifyCPorts()
{
    FileCreateDir, .\\cports

    if !FileExist(".\\cports\\cports.exe")
    {
        UrlDownloadToFile, %cPortsURL%, .\\cports\\cports-x64.zip
        RunWait, cmd.exe /c "tar -xf .\\cports\\cports-x64.zip -C .\\cports", , Hide
        FileDelete, .\\cports\\cports-x64.zip

        if !FileExist(".\\cports\\cports.exe")
        {
            MsgBox, Could not extract cports.exe from cports-x64.zip. Please check the zip file.
            ExitApp
        }
    }
}

; Handling the configured hotkey
; Runs cports.exe with parameters to close TCP connections to PoE servers
; Only works while the Path of Exile window is active
HandleHotkey()
{
    If (WinActive("ahk_exe PathOfExile.exe") or WinActive("ahk_exe PathOfExileSteam.exe"))
    {
        WinGet, activeWindow, ProcessName, A
    }
    else
        return

    KeyWait, %userHotkey%
    if (doublePress = 1)
    {
        KeyWait, %userHotkey%, D T%doublePressDuration%
        if !ErrorLevel
            Run, cmd.exe /c ".\\cports\\cports.exe /close * * * * " %activeWindow%, , Hide
    }
    else
    {
        Run, cmd.exe /c ".\\cports\\cports.exe /close * * * * " %activeWindow%, , Hide
    }
}
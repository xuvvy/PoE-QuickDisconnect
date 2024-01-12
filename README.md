# Quick Disconnect for Path of Exile

A simple, lightweight, easy-to-use disconnect tool for Path of Exile written in AutoHotkey. Not affiliated with or endorsed by Grinding Gear Games.

## Main Features

* Near instantaneous disconnect possible via closure of TCP connections to the Path of Exile servers

* Fully customizable features via the config file

* Convenient default keybinding (quick double-press of the Escape key)

* Works with both Steam and non-Steam Path of Exile

* Fully compliant with the Path of Exile Terms of Use

* No extra additions, just a simple disconnect script

## Requirements

* AutoHotkey v1.1+*

* A 64-bit Windows system

* Administrator privileges

  **only if running the the script through qdc.ahk, the qdc.exe file is self-contained and does not require AutoHotkey to be installed*

## Setup & Usage

1. Download the latest Release on GitHub and unzip it (you can place it wherever you wish, preferably in its own folder)

2. Run the script (you will be asked for Administrator privileges)

3. You are good to go! Double-press the Escape key to disconnect (or change the hotkey in the config.ini)

### Expected file structure

* `cports`
  
  * `cports.chm`
  
  * `cports.exe`
  
  * `readme.txt`

* `config.ini`

* `qdc.ahk`

* `qdc.ico`

* `version.txt`

### Configuration

Default config.ini

```ini
[Settings]
; The desired hotkey in the AHK format (https://www.autohotkey.com/docs/v1/KeyList.htm)
Hotkey=Escape
; Determines if the hotkey need to be pressed twice to trigger
DoublePress=True
; Time (in seconds) between hotkey presses to register as a double-press
DoublePressDuration=0.1
; The URL for downloading the cports.exe used for the TCP Disconnect function
CPortsURL=https://www.nirsoft.net/utils/cports-x64.zip
```

* `Hotkey`
  The button which, when pressed, activates the disconnect part of the script
  Can be a keyboard key or a mouse button
  Accepted values are any values which AutoHotkey accepts for hotkeys by default
  List of valid keys and their formatting can be found [here](https://www.autohotkey.com/docs/v1/KeyList.htm)

* `DoublePress`
  Determines whether or not the assigned hotkey needs to be pressed twice
  Accepted values are `True` and `False`

* `DoublePressDuration`
  Determines the duration between hotkey presses in order for them to register as a double-press
  Only used if `DoublePress` is set to `True`
  Any and all numerical values are accepted, unit used is a second (s)

* `CPortsURL`
  URL for the download of the cports-x64.zip file
  Does not ordinarily need to be changed
  Can be customized in case the original URL is changed or taken down
  Any URL that downloads cports-x64.zip is valid

### Hotkey examples

Escape key

* `Hotkey=Escape`

F9 key

- `Hotkey=F9`

Middle mouse button

* `Hotkey=MButton`

U and T key combination

* `Hotkey=U & T`

Control and P key combination

* `Hotkey=^P`

Mouse button 4

* `Hotkey=XButton1`

## FAQ

### There are other disconnect scripts out there, why this one?

Most of the other publicly available tools suffer from some of the following:

* Extra, unnecessary features tied to them, some of which violate Path of Exile Terms of Use

* A significantly slower way of disconnecting by having the script navigate to the "Log out" button or have it type the "/exit" command

* Disabling the connection to the internet entirely, as opposed to just Path of Exile servers

This tool is made specifically to avoid the pitfalls above.

### Why does it need to be run as Administrator?

It is not possible to manipulate connections of other processes without Administrator privileges, so the script needs it to work.

### Will the tool work with AutoHotkey v2?

This script is made to work with AutoHotkey v1 and is not guaranteed to work with AutoHotkey v2. However, you can have both AutoHotkey v1 and v2 installed on the same machine, just make sure to run this script with AutoHotkey v1.

### Can I bind the hotkey to my controller buttons?

For any controllers newer than the Xbox 360 (2013 and newer controllers) and operating systems running Windows 10 or newer OS, this is not possible at the moment. This feature is planned for a future update.

### Will the tool work for future Path of Exile Leagues and Path of Exile 2?

Yes, the tool works with all Path of Exile versions and Leagues and will be updated to work with Path of Exile 2. Theoretically speaking, this tool can work for any game and any executable, but you would need to edit the AHK script itself to make that happen. Custom executable option might be added to the config.ini in the future.

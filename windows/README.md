# Windows

Tools, notes, and shared packages for [Windows](https://www.microsoft.com/en-us/windows/get-windows-10).

## Setup
* Install [chocolatey](https://chocolatey.org/)
* Install [SharpKeys](https://github.com/randyrants/sharpkeys)
  * Rebind Caps Lock to Escape
  * Write to Registry
* Install [Auto Dark Mode](https://github.com/Armin2208/Windows-Auto-Night-Mode)
  * Do NOT disable App Location Access or this will break
* Install [Fliqlo](https://fliqlo.com/)
* Adjust User Access Control level to not dim the screen
* Hide Cortana and other status bar junk
* Lock status bar to top of screen (as god intended)
* Disable Xbox Game Bar
* Set **This PC** as default File Explorer view
  * Open File Explorer
  * View -> Folder Options -> General -> Open File Explorer to: `This PC`
* Enable BitLocker
* Install SSD Drivers/Utilities
* Enable SSD Trim

### Dual Boot Linux
* Disable Hiberation
* Disable Fast Startup
* [Set UTC Clock](https://wiki.archlinux.org/index.php/System_time)
  * Open Command Prompt as Admin
  * `reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\TimeZoneInformation" /v RealTimeIsUniversal /d 1 /t REG_QWORD /f`

### Thinkpad
* Make Middle Mouse Button work for click and scroll
  * Set Middle Mouse Button to `Middle Click`
  * Install [W10Wheel.NET](https://github.com/ykon/w10wheel.net)
    * Set Trigger to `MiddleDrag`
    * Set Accel to `M6`
    * Set `horizontalThreshold` to `0`
    * Enable Horizontal Scroll
    * Enable Reverse Scroll
    * Save Properties
  * Open Task Scheduler
    * Create new task
    * Enable `Run with highest privileges`
    * Add Trigger `At log on of any user`
    * Add Action `Start a program` with `W10Wheel.exe`
* Check Lenovo Vantage settings and drivers
  * Disable Smart Standby
  * Enable Always on USB, BUT disable USB charging when computer is off
  * Enable Battery Threshold 70% - 80%

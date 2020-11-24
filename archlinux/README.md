# Arch Linux

Tools, notes, and shared packages for [Arch Linux](https://www.archlinux.org/).

## Setup
`setup/` contains helpers to bootstrap Arch installations.

## Meta Packages
`packages/` contains meta packages for post-install environments.

## Firmware Updater
```
fwupdmgr get-devices
fwupdmgr refresh
fwupdmgr get-updates
fwupdmgr update
# https://pcsupport.lenovo.com/de/de/products/laptops-and-netbooks/thinkpad-x-series-laptops/thinkpad-x1-carbon-8th-gen-type-20u9-20ua/20u9/parts/display/compatible
# fwupdmgr install xxx.cab # and then restart system
```

## Todo/Notes

* Add user to docker group (fixes `docker` sudo permissions)
* Add instructions for hybrid-sleep based on [this arch wiki page](https://wiki.archlinux.org/index.php/Power_management#Power_management_with_systemd)
* Chrome swipe gestures
* Restore Chrome launch options after wayland regression fixed
  * https://www.reddit.com/r/swaywm/comments/ipkfbx/chromechromium_850418383_regression_workaround/
  * /usr/share/applications/google-chrome.desktop
* Restore pulseaudio settings after 5.9.x kernel is released
  * https://gist.github.com/hamidzr/dd81e429dc86f4327ded7a2030e7d7d9#gistcomment-3345062

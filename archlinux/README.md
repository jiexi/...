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
  * https://www.reddit.com/r/swaywm/comments/imcoo6/chrome_wayland_available_via_feature_flag_in/
  * https://www.reddit.com/r/archlinux/comments/iwv6oo/artifacts_while_scrolling_and_typing_with/g64ai4u/
  * Disable Hardware Acceleration
  * `-enable-features=UseOzonePlatform -ozone-platform=wayland`
  * /usr/share/applications/google-chrome.desktop
* eGPU
  * Add `amdgpu` to modules in /etc/mkinitcpio.conf
  * Add [egpu-power.service](etc/egpu-power.service)
  * Disable TB3 Linux OS support
  * Enable TB3 Preboot Pre-ACL

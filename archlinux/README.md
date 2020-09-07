# Arch Linux

Tools, notes, and shared packages for [Arch Linux](https://www.archlinux.org/).
Nothing here currently, but eventually PKGBUILD files.

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

* Add user to docker group (fixes `docker` sudo permissions)
  * `dockerd` vs `systemctl enable docker`?...
* Add instructions for hybrid-sleep based on [this arch wiki page](https://wiki.archlinux.org/index.php/Power_management#Power_management_with_systemd)
* Chrome swipe gestures: `https://github.com/pawelmatyjasik/chrome-gestures`
* See if this matters `https://wiki.archlinux.org/index.php/REFInd#Installing_the_rEFInd_Boot_Manager#fwupdate`

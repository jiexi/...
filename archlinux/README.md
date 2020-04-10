# Arch

Tools, notes, and shared packages for [Arch Linux](https://www.archlinux.org/).
Nothing here currently, but eventually PKGBUILD files.

## Setup
`setup/` contains helpers to bootstrap Arch installations.

## Init
`init.sh` takes a suffix of the PKGBUILD file to run

For example:
```sh
$ ./init.sh shared
```
will install all dependencies in the `PKGBUILD-shared` file.

## Pacman
```sh
pacman -Rsn <package_name> # removes a package and it's dependencies if now unneeded
pacman -Qt # lists packages that are not dependencies of other packages
pacman -Qtd # lists packages installed as dependencies but no longer depended on
```

## Future instructions/script steps
* Add user to audio and video group (fixes `light` sudo permissions)
* Add instructions for tty caps lock escape rebind based on [this arch wiki page](https://wiki.archlinux.org/index.php/Linux_console/Keyboard_configuration#Keymaps)
* Add instructions for hybrid-sleep based on [this arch wiki page](https://wiki.archlinux.org/index.php/Power_management#Power_management_with_systemd)
* Add instruction for kernel options `options root=/dev/sda2 rw resume=/dev/sda3 acpi_osi=Darwin acpi_mask_gpe=0x06`, resume for hibernate!
* Powertop --auto-tune on startup?

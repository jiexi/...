# Arch Linux Meta Packages

Contains [PKGBUILD](https://wiki.archlinux.org/index.php/PKGBUILD) [meta packages](https://wiki.archlinux.org/index.php/Package_group#Difference_to_a_meta_package)
that group sets of packages with similar concern into a single package that can be installed all at once.

## Init
`init.sh` takes a suffix of the PKGBUILD file to install

For example:
```sh
$ ./init.sh shared
```
will install all dependencies in the `PKGBUILD-shared` file.

If any packages fail to resolve, they likely live in the AUR and will need to resolved with
`aur.sh package-name-here`

## Pacman
```sh
pacman -Rsn <package_name> # removes a package and it's dependencies if now unneeded
pacman -Qt # lists packages that are not dependencies of other packages
pacman -Qtd # lists packages installed as dependencies but no longer depended on
pacman -Qm # lists foreign packages
pacman -Qent # lists native packages not direct or optional dependencies
```
[arch wiki section](https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks#Listing_packages)

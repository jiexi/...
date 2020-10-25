# Fonts

Fonts to be used across the OS.

## Init
`init.sh` creates symlink to `~/.fonts`.

## Clear Cache
`fc-cache -f -v`

## Manual
* Install Bitstream Vera
  * `yay -S ttf-bitstream-vera`
* Install twemoji
  * `yay -S ttf-twemoji`
* Install materialdesignicons.com
  * `yay -S ttf-material-design-icons-git`
* Install noto
  * `yay -S noto-fonts noto-fonts-cjk`

## Debug
* Font resolution for Space character `fc-match -s sans-serif:charset=0020`

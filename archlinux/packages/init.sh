#!/usr/bin/env bash

set -e

makepkg -si -p "PKGBUILD-$1"
rm -rf pkg/ 2> /dev/null
rm -rf src/ 2> /dev/null
rm *.pkg.tar.zst 2> /dev/null

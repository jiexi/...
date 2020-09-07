#!/usr/bin/env bash

set -e

yay -S $1 --asdeps --rebuildtree

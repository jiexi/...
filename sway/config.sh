#!/usr/bin/env sh

if [ "$DRI_PRIME" == "1" ] ;then
  echo "eGPU configured"
  xrandr --output XWAYLAND1 --primary
else
  echo "No eGPU detected"
fi

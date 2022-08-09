#!/usr/bin/env sh

# CARD=$(ls -t /dev/dri/card* | head -n1 | sed 's:.*/::')
EGPU_CARD=card0
IGPU_CARD=card1
DRM_PATH=/sys/class/drm/$EGPU_CARD
DPM_PATH=$DRM_PATH/device/power_dpm_force_performance_level

# Roughly 1.6 seconds to find
# i=0
# while [ $i -lt 30 ]
# do
#   DPM_LEVEL=$(cat $DPM_PATH 2>/dev/null)
#   if [ -n "$DPM_LEVEL" ]; then
#     # echo "breaking"
#     break
#   fi
#   i=$(( $i + 1 ))
#   # echo "$i"
#   sleep 0.1
# done

DPM_LEVEL=$(cat $DPM_PATH 2>/dev/null)

# export WLR_DRM_DEVICES=/dev/dri/$EGPU_CARD:/dev/dri/$IGPU_CARD

# if [ -n "$DPM_LEVEL" ]; then
#   echo "Found eGPU"
#   if [ "$DPM_LEVEL" == "high" ] ;then
#     echo "Please disconnect eGPU"
#     echo "Press any button to continue..."
#     read -n 1
#     export DRI_PRIME=0
#     export WLR_DRM_DEVICES=/dev/dri/$IGPU_CARD
#   else
#     echo "Configuring eGPU..."
#     # sudo bash -c "echo 'high' > $DPM_PATH"
#     export DRI_PRIME=1
#   # export WLR_DRM_DEVICES=/dev/dri/$EGPU_CARD:/dev/dri/$IGPU_CARD
#   fi
# else
#   echo "No eGPU detected"
#   export DRI_PRIME=0
#   # export WLR_DRM_DEVICES=/dev/dri/card0
# fi


if [ -n "$DPM_LEVEL" ]; then
  echo "Found eGPU"
  echo "Press any button now to use iGPU instead"
  read -d'' -s -n 1 -t 3
  if [ "$REPLY" != "" ]; then
    echo "Using iGPU"
    export DRI_PRIME=0
    export WLR_DRM_DEVICES=/dev/dri/$IGPU_CARD
  else
    echo "Using eGPU"
    if [ "$DPM_LEVEL" != "high" ] ;then
      echo "eGPU not configured"
      echo "Configuring..."
      sudo bash -c "echo 'high' > $DPM_PATH"
    fi
    export DRI_PRIME=1
    export WLR_DRM_DEVICES=/dev/dri/$IGPU_CARD:/dev/dri/$EGPU_CARD
  fi
else
  echo "No eGPU detected"
  export DRI_PRIME=0
  export WLR_DRM_DEVICES=/dev/dri/card0
fi


# echo "Press any button to continue to sway..."
# read -n 1

sway

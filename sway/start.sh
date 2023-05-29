#!/usr/bin/env sh

# CARD=$(ls -t /dev/dri/card* | head -n1 | sed 's:.*/::')
# EGPU_CARD=card1
# IGPU_CARD=card0
# DRM_PATH=/sys/class/drm/$EGPU_CARD
# DPM_PATH=$DRM_PATH/device/power_dpm_force_performance_level

function get_dpm_path {
  DPM_LEVEL_0=$(cat /sys/class/drm/card0/device/power_dpm_force_performance_level 2>/dev/null)
  if [ -n "$DPM_LEVEL_0" ]; then
    echo "/sys/class/drm/card0/device/power_dpm_force_performance_level"
    return
  fi
  DPM_LEVEL_1=$(cat /sys/class/drm/card1/device/power_dpm_force_performance_level 2>/dev/null)
  if [ -n "$DPM_LEVEL_1" ]; then
    echo "/sys/class/drm/card1/device/power_dpm_force_performance_level"
    return
  fi
}

function get_igpu_dri {
  DPM_LEVEL_0=$(cat /sys/class/drm/card0/device/power_dpm_force_performance_level 2>/dev/null)
  if [ -n "$DPM_LEVEL_0" ]; then
    echo "/dev/dri/card1"
    return
  fi
  DPM_LEVEL_1=$(cat /sys/class/drm/card1/device/power_dpm_force_performance_level 2>/dev/null)
  if [ -n "$DPM_LEVEL_1" ]; then
    echo "/dev/dri/card0"
    return
  fi
  echo "/dev/dri/card0:/dev/dri/card1"
}

function get_egpu_dri {
  DPM_LEVEL_0=$(cat /sys/class/drm/card0/device/power_dpm_force_performance_level 2>/dev/null)
  if [ -n "$DPM_LEVEL_0" ]; then
    echo "/dev/dri/card0"
    return
  fi
  DPM_LEVEL_1=$(cat /sys/class/drm/card1/device/power_dpm_force_performance_level 2>/dev/null)
  if [ -n "$DPM_LEVEL_1" ]; then
    echo "/dev/dri/card1"
    return
  fi
  echo "/dev/dri/card0:/dev/dri/card1"
}

function get_dpm_level {
  DPM_PATH=$(get_dpm_path)
  if [ -n "$DPM_PATH" ]; then
    echo "$(cat $DPM_PATH 2>/dev/null)"
  fi
}

i=0
while [ $i -lt 30 ] # Roughly 1.6 seconds to find
do
  DPM_LEVEL=$(get_dpm_level)
  if [ -n "$DPM_LEVEL" ]; then
    # echo "breaking"
    break
  fi
  i=$(( $i + 1 ))
  # echo "$i"
  sleep 0.1
done

DPM_PATH=$(get_dpm_path)
DPM_LEVEL=$(get_dpm_level)

if [ -n "$DPM_LEVEL" ]; then
  echo "Found eGPU"
  # if [ "$DPM_LEVEL" == "high" ] && [ "$i" == 0 ] ;then
  if [ "$i" == 0 ] ;then
    echo "Ejecting eGPU"
    export DRI_PRIME=0
    export WLR_DRM_DEVICES=$(get_igpu_dri)
    # sudo all-ways-egpu switch internal
    echo "Please disconnect eGPU"
    echo "Press any button to continue..."
    read -n 1
  else
    echo "Configuring eGPU..."
    export DRI_PRIME=1
      export WLR_DRM_DEVICES=$(get_egpu_dri)
    sudo bash -c "echo 'high' > $DPM_PATH;"
    # sudo all-ways-egpu switch egpu
  fi
else
  echo "No eGPU detected"
  export DRI_PRIME=0
  export WLR_DRM_DEVICES=/dev/dri/card0:/dev/dri/card1
fi

#  Using initramfs preboot amdgpu module
# if [ -n "$DPM_LEVEL" ]; then
#   echo "Found eGPU"
#   echo "Press any button now to use iGPU instead"
#   read -d'' -s -n 1 -t 3
#   if [ "$REPLY" != "" ]; then
#     echo "Using iGPU"
#     export DRI_PRIME=0
#     export WLR_DRM_NO_MODIFIERS=0
#     export WLR_DRM_DEVICES=/dev/dri/$IGPU_CARD
#   else
#     echo "Using eGPU"
#     if [ "$DPM_LEVEL" != "high" ] ;then
#       echo "eGPU not configured"
#       echo "Configuring..."
#       sudo bash -c "echo 'high' > $DPM_PATH"
#     fi
#     export DRI_PRIME=1
#     export WLR_DRM_NO_MODIFIERS=1
#     export WLR_DRM_DEVICES=/dev/dri/$IGPU_CARD:/dev/dri/$EGPU_CARD
#   fi
# else
#   echo "No eGPU detected"
#   export DRI_PRIME=0
#   export WLR_DRM_NO_MODIFIERS=0
#   export WLR_DRM_DEVICES=/dev/dri/card0
# fi


# echo "Press any button to continue to sway..."
# read -n 1

sway

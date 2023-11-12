#!/usr/bin/env bash

DUNST="dunstify -u normal -i"
ICON_MOUNTED_PATH="$HOME/.config/eww/assets/images/hdd-mount.svg"
ICON_UNMOUNTED_PATH="$HOME/.config/eww/assets/images/hdd-unmount.svg"

udisks2_is_mounted() {
    udisksctl info -b /dev/"$1" | grep MountPoints: | awk '{print $2}'
}

mount_nvme() {
    STATE=$(udisks2_is_mounted nvme0n1p3)
    if [ "$STATE" == "" ]; then
        eval "$DUNST $ICON_MOUNTED_PATH 'Mounting...' 'Mounting nvme0n1p3'"
        kitty udisksctl mount -b /dev/nvme0n1p3
    else
        eval "$DUNST $ICON_UNMOUNTED_PATH 'Unmounting...' 'nvme0n1p3 is being un-mounted'"
        udisksctl unmount -b /dev/nvme0n1p3
    fi
}

mount_sda() {
    STATE=$(udisks2_is_mounted sda2)
    if [ "$STATE" == "" ]; then
        eval "$DUNST $ICON_MOUNTED_PATH 'Mounting...' 'sda2 is being mounted'"
        udisksctl mount -b /dev/sda2
    else
        eval "$DUNST $ICON_UNMOUNTED_PATH 'Unmounting...' 'sda2 is being unmounted'"
        udisksctl unmount -b /dev/sda2
    fi
}

icon_nvme() {
    STATE=$(udisks2_is_mounted nvme0n1p3)
    if [ "$STATE" != "" ]; then
        echo ""
    else
        echo ""
    fi
}

icon_sda() {
    STATE=$(udisks2_is_mounted sda2)
    if [ "$STATE" != "" ]; then
        echo "ﯾ"
    else
        echo "ﯿ"
    fi
}

case "$1" in
    --nvme) mount_nvme;;
    --sda) mount_sda;;

    --icon-nvme) icon_nvme;;

    --icon-sda) icon_sda;;

    *) echo Invalid Option!;;
esac

# vim:ft=bash:nowrap

#!/bin/bash
SSH=true
IMG=2020-05-27-raspios-buster-lite-armhf.img

DEVDISK=$(sudo diskutil list | grep external | head -n 1 | awk '{print $1}')
DISK=$(echo $DEVDISK | sed 's/\/dev\///')

if [[ $DEVDISK == "" ]]; then
    echo "[ERROR] Unable to locate external disk"
    exit 1
else
    echo "[INFO] Detected external disk: $DEVDISK"
fi

read -p 'Press Enter to Continue' ENTER
echo
sudo diskutil unmountDisk $DEVDISK
echo "[INFO] Starting $IMG Copy"
sudo dd if=$IMG of=/dev/r$DISK bs=1m

echo "[INFO] Copy completed"
sleep 10
if [[ $IMG == *"raspios"* ]]; then
    if [[ $SSH == "true" ]]; then
        touch /Volumes/boot/ssh
    else
        echo "[WARN] SSH Disabled"
    fi
else
    echo "[WARN] Not a raspios img"
fi
sudo diskutil eject /dev/r$DISK
echo "[INFO] SD Card Ready"

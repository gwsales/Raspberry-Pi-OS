#!/bin/bash

if [ -d /Volumes/pi ]; then
    echo "/Volumes/pi already exists"
else
    sudo mkdir /Volumes/pi
fi
sudo ext4fuse /dev/disk2s2 /Volumes/pi -o allow_other


#!/bin/bash

sudo umount /Volumes/pi
if [ $? -ne 0 ]; then
    echo "FAILED:"
    echo "TRY: sudo diskutil unmountDisk /dev/disk2"
fi

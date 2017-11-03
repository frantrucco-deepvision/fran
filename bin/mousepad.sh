#! /bin/bash

device=$(xinput list | grep Touchpad | sed 's/.*id=\([0-9]*\).*/\1/')
state=`xinput list-props "$device" | grep "Device Enabled" | grep -o "[01]$"`;

if [ $state == '1' ]; then 
    xinput set-prop $device "Device Enabled" 0;
else
    xinput set-prop $device "Device Enabled" 1;
fi

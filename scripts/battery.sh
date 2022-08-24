#!/bin/bash
stat=$(upower -i `upower -e | grep 'BAT'` | grep percentage | awk '{ print $2 }')
supply=$(upower -i /org/freedesktop/UPower/devices/line_power_ADP1 | grep "online" | awk '{ print $2 }')

sym=""

if [ "$supply" = "yes" ]; then
    sym="";
fi

echo " $sym  $stat "


#!/bin/bash
date_inv=$(date +'%Y-%m-%d')
time_home=$(date +'%H:%M:%S')
tz=$(cat ./currtz)
time_local=$(TZ=$tz date +'%H:%M:%S')
if [ "$time_home" = "$time_local" ]; then
    echo "   $date_inv $time "
else
    echo "   $date_inv   $time_home   $time_local "
fi

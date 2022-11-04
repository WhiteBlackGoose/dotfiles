#!/bin/sh
if [[ -z $NO_PICOM ]]; then
    picom -CGb --experimental-backends
    feh --bg-scale /home/goose/Downloads/d975d8f195c7187939587dcc71bf0bba.png
else
    ~/.config/polybar/launch.sh
    feh --bg-scale ~/.config/es2_morning.jpg
fi

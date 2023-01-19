curr=$(~/.config/global_scripts/get-current-theme.sh)
if [ "$curr" = "'prefer-light'" ]; then
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
    feh --bg-scale /home/goose/.config/pics/nixos-wallpaper-light-2880x1800-dark.png
    echo 'Changed to dark'
else
    gsettings set org.gnome.desktop.interface color-scheme prefer-light
    feh --bg-scale /home/goose/.config/pics/nixos-wallpaper-light-2880x1800.png
    echo 'Changed to light'
fi

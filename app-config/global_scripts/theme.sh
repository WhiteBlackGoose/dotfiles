curr=$(~/.config/global_scripts/get-current-theme.sh)
if [ "$curr" = "prefer-light" ]; then
    # gsettings set org.gnome.desktop.interface color-scheme prefer-dark
    dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
    feh --bg-scale /home/goose/.config/pics/nixos-wallpaper-light-2880x1800-dark.png
    echo 'Changed to dark'
    echo 'prefer-dark' > /home/goose/.config/global_scripts/currtheme
else
    # gsettings set org.gnome.desktop.interface color-scheme prefer-light
    dconf write /org/gnome/desktop/interface/color-scheme "'prefer-light'"
    feh --bg-scale /home/goose/.config/pics/nixos-wallpaper-light-2880x1800-dark.png
    feh --bg-scale /home/goose/.config/pics/nixos-wallpaper-light-2880x1800.png
    echo 'Changed to light'
    echo 'prefer-light' > /home/goose/.config/global_scripts/currtheme
fi

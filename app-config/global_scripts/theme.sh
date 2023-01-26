curr=$(~/.config/global_scripts/get-current-theme.sh)
if [ "$curr" = "prefer-light" ]; then
    dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
    # feh --bg-scale /home/goose/.config/pics/nixos-wallpaper-light-2880x1800-dark.png
    feh --bg-scale /home/goose/.config/pics/dark_game_1_2560x1440.png
    echo 'Changed to dark'
    echo 'prefer-dark' > /home/goose/.config/global_scripts/currtheme
else
    dconf write /org/gnome/desktop/interface/color-scheme "'prefer-light'"
    # feh --bg-scale /home/goose/.config/pics/nixos-wallpaper-light-2880x1800-dark.png
    feh --bg-scale /home/goose/.config/pics/light_game_1_2560x1440.png
    echo 'Changed to light'
    echo 'prefer-light' > /home/goose/.config/global_scripts/currtheme
fi

{ config, pkgs, ... }:

rec {
  apply-theme-script = pkgs.writeScript "apply-theme" ''
    curr=$(~/.config/global_scripts/get-current-theme.sh)
    if [ "$curr" = "prefer-light" ]; then
        dconf write /org/gnome/desktop/interface/color-scheme "'prefer-light'"
        feh --bg-scale /home/goose/.config/pics/light_game_1_2560x1440.png
        echo 'Changed to light'
    else
        dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
        feh --bg-scale /home/goose/.config/pics/dark_game_1_2560x1440.png
        echo 'Changed to dark'
    fi
  '';
  desktopEntry = {
    name = "Toggle theme";
    exec = ''${pkgs.writeScript "theme" ''
      if [ "$curr" = "prefer-light" ]; then
        echo 'prefer-dark' > /home/goose/.config/global_scripts/currtheme
      else
        echo 'prefer-light' > /home/goose/.config/global_scripts/currtheme
      fi
      ${apply-theme-script}
    ''}'';
  };
}


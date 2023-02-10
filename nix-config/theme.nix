{ pkgs, ... }:

rec {
  dark-wallpaper = pkgs.fetchurl {
    url = "https://cdn.discordapp.com/attachments/584479703662854156/1073657438982639686/wp5679143.jpg";
    sha256 = "sha256-LzgQK4J0fiXqmCH65woUcWKpuuXs3axu01WhCDALT08=";
  };

  light-wallpaper = "/home/goose/.config/pics/light_game_1_2560x1440.png";

  apply-theme-script = pkgs.writeScript "apply-theme" ''
    curr=$(~/.config/global_scripts/get-current-theme.sh)
    if [ "$curr" = "prefer-light" ]; then
        dconf write /org/gnome/desktop/interface/color-scheme "'prefer-light'"
        feh --bg-scale ${light-wallpaper}
    else
        dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
        feh --bg-scale ${dark-wallpaper}
    fi
  '';

  desktopEntry = {
    name = "Toggle theme";
    exec = ''${pkgs.writeScript "theme" ''
      curr=$(~/.config/global_scripts/get-current-theme.sh)
      if [ "$curr" = "prefer-light" ]; then
        echo 'prefer-dark' > /home/goose/.config/global_scripts/currtheme
      else
        echo 'prefer-light' > /home/goose/.config/global_scripts/currtheme
      fi
      ${apply-theme-script}
    ''}'';
  };
}


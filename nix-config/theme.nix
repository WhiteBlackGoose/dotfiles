{ pkgs, ... }:

rec {
  dark-wallpaper = pkgs.fetchurl {
    url = "https://fedoraproject.org/w/uploads/f/fc/F37-01-night.jpg";
    sha256 = "sha256-eiMZ3xWagyUrI9iTP015cZh4X5x9gz3XXi44IeaOrEM=";
  };

  light-wallpaper = pkgs.fetchurl {
    url = "https://fedoraproject.org/w/uploads/0/02/F37-01-day.jpg";
    sha256 = "sha256-l65ZSBoll80sSzje8qOkQPQtKnNqKQnMCwJGSRhrkvc=";
  };

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


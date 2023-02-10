{ pkgs, ... }:

rec {
  dark-wallpaper = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/Myagko/dotfiles/d31c692f3e28eadf3dcf19cb70e455e2d3e24f1b/home/wallpapers/wallhaven-dgdmj3.jpg";
    sha256 = "sha256-4ydC+FnU4zj5+FDlmjTv5+KeCYxSvVCokTgZ8tV9nsA=";
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


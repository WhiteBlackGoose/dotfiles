{ config, pkgs, ... }:
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "goose";
  home.homeDirectory = "/home/goose";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      userName = "WhiteBlackGoose";
      userEmail = "wbg@angouri.org";
      signing = {
        key = "640BEDDE9734310ABFA3B25752EDAE6A3995AFAB";
      };
      extraConfig = {
        core.eol = "lf";
      };
    };
  };

  home.packages = [
    pkgs.pass
    pkgs.starship
    pkgs.tdesktop
    pkgs.passphrase2pgp
  ];

  services.blueman-applet.enable = true;

  dconf.settings."org/blueman/general" = {
    plugin-list = [ "!ConnectionNotifier" ];
  };

  xdg.desktopEntries = {
    firefox = {
      name = "Firefox";
      genericName = "Web Browser";
      exec = "firefox -P main %U";
    };
    firefoxDiscord = {
      name = "Firefox Discord";
      genericName = "Discord";
      exec = "firefox -P main --new-window https://discord.com/channels/@me %U";
    };
    firefoxSchool = {
      name = "Firefox School";
      genericName = "Web Browser for school";
      exec = "firefox -P school %U";
    };
    xdgFolderLexit = {
      name = "Find and open as XDG";
      exec = ''xfce4-terminal -e "/home/goose/scripts/fzsearches/xdg.sh"'';
    };
    ideFolderLexit = {
      name = "Find and open as IDE";
      exec = ''xfce4-terminal -e "/home/goose/scripts/fzsearches/as-ide.sh"'';
    };
  };

  xdg.mimeApps = {
    enable = true;
    associations.added = { 
      "application/pdf" = ["zathura" ]; 
      "image/png" = ["nsxiv.desktop" ];
      "image/jpeg" = ["nsxiv.desktop" ];
    }; 
    defaultApplications = { 
      "application/pdf" = ["zathura"]; 
      "image/png" = ["nsxiv.desktop"];
      "image/jpeg" = ["nsxiv.desktop"];
    };
  };
}

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
    pkgs.dconf
  ];

  services.blueman-applet.enable = true;

  dconf.settings."org/blueman/general" = {
    plugin-list = [ "!ConnectionNotifier" ];
  };
  dconf.enable = true;


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
      name = "firefox school";
      genericName = "web browser for school";
      exec = "firefox -P school %u";
    };
    firefox3 = {
      name = "firefox 3";
      genericName = "third profile of ff";
      exec = "firefox -P p3 %u";
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

  gtk.enable = true;
}

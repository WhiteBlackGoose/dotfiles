inputs@{ config, lib, pkgs, ... }:
rec {
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
      lfs.enable = true;
      userName = "WhiteBlackGoose";
      userEmail = "wbg@angouri.org";
      signing = {
        key = "640BEDDE9734310ABFA3B25752EDAE6A3995AFAB";
      };
      extraConfig = {
        core.eol = "lf";
        status.submodulesummary = 1;
        push.recurseSubmodules = "check";
      };
      aliases = {
        "unstage" = "reset HEAD --";
        "rbi" = "rebase --interactive";
        "sa" = "status -s --ignored=traditional";
        "ss" = "status -s";
        "a" = "add";
        "c" = "commit -m";
        "logd" = ''log --date=short --pretty=format:"%m %C(yellow)%h %Creset%C(cyan)%C(bold)%ad%Creset %Cred%an%Creset  %C(green)%Creset %s"'';
      };
    };
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting # Disable greeting
        alias ls="lsd"
        alias ll="lsd -la"

        alias cdf='cd $(find . -type d 2>/dev/null | fzf)'
        alias cda='cd / && cdf'
        alias cdh='cd ~ && cdf'
        alias cde='cd /etc/nixos'

        alias xda='cd / && fzf-xdg'
        alias xdh='cd ~ && fzf-xdg'
        alias xdf='fzf-xdg'
        starship init fish | source

        set -a PATH /home/goose/me/scripts
        set -a PATH /home/goose/.config/global_scripts
        fish_ssh_agent
      '';
    };
  };

  home.packages = [
    pkgs.pass
    pkgs.starship
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
    syncthingUI = {
      name = "Syncthing UI";
      exec = "firefox -P main --new-window http://127.0.0.1:8384/ %U";
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
    firefoxLibre = {
      name = "firefox libre";
      genericName = "Libre & Privacy focused profile";
      exec = "firefox -P libre %u";
    };
    neovide = {
      name = "neovide";
      exec = "${pkgs.neovide}/bin/neovide";
      icon = pkgs.fetchurl {
        url = "https://github.com/neovide/neovide/blob/main/website/docs/assets/neovide-128x128.png?raw=true";
        sha256 = "sha256-pVF4G/S743UByC0VbeoozYGgBgrv4P5I4ZsIeg1L4F0=";
      };
    };
    file = {
      name = "Open file";
      exec = 
        let
          progs = [
            { name = "zathura"; pat = "*.pdf"; }
            { name = "firefox"; pat = ""; }
            { name = "libreoffice"; pat = "*.docx"; }
            { name = "neovide"; pat = "*"; }
          ];
          progLine = lib.strings.concatStringsSep
            "\\n"
            (builtins.map (p: p.name) progs);
        in
        ''${pkgs.writeScript "desk-file" ''
          exe=$(printf "${progLine}" | ${pkgs.rofi}/bin/rofi -dmenu -dpi 192)
          ${
          let ifs = builtins.map ({ name, pat }: ''
          if [ "$exe" = '${name}' ]; then
            f=$(find . -name '${pat}' | ${pkgs.rofi}/bin/rofi -dmenu -dpi 192) 
            $exe "$f"
          fi
          '') progs;
          in
          lib.strings.concatStringsSep "\n" ifs}
        ''}'';
    };
    gpt4all = {
      name = "gpt4all";
      exec = "chat";
    };
    telegram = {
      name = "Telegram";
      exec = ''${pkgs.writeScript "tg" "QT_QPA_PLATFORM=xcb ${pkgs.telegram-desktop}/bin/telegram-desktop"}'';
    };
    electrum = {
      name = "Electrum";
      exec = ''${pkgs.writeScript "electrum" "QT_QPA_PLATFORM=xcb ${pkgs.electrum}/bin/electrum"}'';
    };
    theme = (import ../theme.nix inputs).desktopEntry;
  };

  xdg.mimeApps = {
    enable = true;
    associations.added = { 
      "application/pdf" = "zathura.desktop"; 
      "image/png" = "nsxiv.desktop";
      "image/jpeg" = "nsxiv.desktop";
      "text/html" = "firefox.desktop";
    }; 
    defaultApplications = 
      let
        browser = "firefox.desktop";
      in
      { 
        "application/pdf" = "zathura.desktop"; 
        "image/png" = "nsxiv.desktop";
        "image/jpeg" = "nsxiv.desktop";
        "x-scheme-handler/http" = browser;
        "x-scheme-handler/https" = browser;
        "x-scheme-handler/about" = browser;
        "x-scheme-handler/unknown" = browser;
      };
  };

  gtk.enable = true;

  xsession.enable = true;
  # Gallery: https://www.opendesktop.org/browse?cat=107
  # Nice ones:
  # White/Green: https://github.com/yeyushengfan258/ArcAurora-Cursors
  # Bibata regular: https://www.opendesktop.org/p/1914825
  # Fuchsia pink: https://www.opendesktop.org/p/1544830
  # Fuchsia pop: https://www.opendesktop.org/p/1641968
  home.pointerCursor = 
    let 
      getFrom = url: hash: name: {
          gtk.enable = true;
          x11.enable = true;
          name = name;
          # size = 48;
          package = 
            pkgs.runCommand "moveUp" {} ''
              mkdir -p $out/share/icons
              ln -s ${pkgs.fetchzip {
                url = url;
                hash = hash;
              }} $out/share/icons/${name}
          '';
        };
    in
      getFrom 
        "https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.4/Bibata-Modern-Classic.tar.xz"
        "sha256-YEH6nA8A6KWuGQ6MPBCIEc4iTyllKwp/OLubD3m06Js="
        "Bibata-Modern-Classic";

        # "https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.4/Bibata-Modern-Ice.tar.xz"
        # "sha256-1U/HoGO/FG/EI6kUqf9sXVL8rfLIsopQLBbDVyxIuX4="
        # "Bibata-Modern-Ice";

        # "https://github.com/ful1e5/fuchsia-cursor/releases/download/v2.0.0/Fuchsia-Pop.tar.gz"
        # "sha256-BvVE9qupMjw7JRqFUj1J0a4ys6kc9fOLBPx2bGaapTk="
        # "Fuchsia-Pop"; 
}

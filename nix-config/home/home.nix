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
    dictcc = {
      name = "DE: dict.cc";
      exec = "${pkgs.surf}/bin/surf dict.cc -s";
    };
    dictcc-ru = {
      name = "DE: dict.cc from ru";
      exec = "${pkgs.surf}/bin/surf deru.dict.cc -s";
    };
    konjugator = {
      name = "DE: konjugator";
      exec = "${pkgs.surf}/bin/surf konjugator.reverso.net -s";
    };
    fromClipboard = {
      name = "Surf from clipboard";
      exec = ''${pkgs.writeScript "surf-from-cp" "${pkgs.surf}/bin/surf $(${pkgs.xclip}/bin/xclip -sel clip -o)"}'';
    };
    neovide = {
      name = "Neovide";
      exec = ''${pkgs.writeScript "nice" "neovide"}'';
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
    toggleWMMode = {
      name = "Toggle WM mode";
      exec = "${pkgs.writeScript "toggle-wm-mode" ''
        currmode=$(cat ~/.config/i3/currmode)
        rm ~/.config/i3/mode
        ${pkgs.killall}/bin/killall picom 2> /tmp/fff1 > /tmp/fff2
        if [ "$currmode" == "productive" ]; then
          ln -s ~/.config/i3/cute ~/.config/i3/mode
          i3-msg restart
          ${pkgs.picom}/bin/picom --backend glx &
          echo cute > ~/.config/i3/currmode
        else
          ln -s ~/.config/i3/productive ~/.config/i3/mode
          i3-msg restart
          echo productive > ~/.config/i3/currmode
        fi
      ''}";
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
  systemd.user.startServices = true;
  systemd.user.services.keyboard-layout = {
    Unit.Name = "keyboard-layout";
    Unit.Description = "sxhkd service";
    Unit.PartOf = ["graphical-session.target"];
    Install.WantedBy = ["graphical-session.target"];

    # here we will have only two layouts
    # ENG: 🇬🇧+ 🇩🇪
    # RUS: 🇷🇺+ 🇺🇦
    # by using right alt, type letters from the other alphabet
    # 
    # https://wiki.linuxquestions.org/wiki/List_of_Keysyms_Recognised_by_Xmodmap
    Service.ExecStart = 
      ''${pkgs.sxhkd}/bin/sxhkd -c ${pkgs.writeText "config" 
      ''
      super + z
      	${pkgs.writeScript "toggle-kb" 
      ''
      currlayout=$(${pkgs.xkblayout-state}/bin/xkblayout-state print "%n")
      ${pkgs.xorg.setxkbmap}/bin/setxkbmap -option caps:ctrl_modifier
      if [ "$currlayout" == "Russian" ]; then
        ${pkgs.xorg.setxkbmap}/bin/setxkbmap -layout us
        ${pkgs.xorg.xmodmap}/bin/xmodmap ${pkgs.writeText "xkb-layout" ''
          keycode 108 = Mode_switch
          keysym e = e E EuroSign U00A3
          keysym a = a A adiaeresis Adiaeresis
          keysym o = o O odiaeresis Odiaeresis
          keysym u = u U udiaeresis Udiaeresis
          keysym s = s S ssharp U1E9E
        ''}
      else
        ${pkgs.xorg.setxkbmap}/bin/setxkbmap -layout ru
        ${pkgs.xorg.xmodmap}/bin/xmodmap ${pkgs.writeText "xkb-layout" ''
          keycode 108 = Mode_switch
          keysym Cyrillic_i = Cyrillic_i Cyrillic_I idiaeresis Idiaeresis
          keysym Cyrillic_ie = Cyrillic_ie Cyrillic_IE U0454 U0404
          keysym Cyrillic_yeru = Cyrillic_yeru Cyrillic_YERU U0456 U0406
          keysym Cyrillic_ghe = Cyrillic_ghe Cyrillic_GHE U0491 U0490
        ''}
      fi
      ''}
      ''}
      '';
  };

  home.file."/home/goose/.local/share/gnome-background-properties/bg.xml".text = 
    let
      wp = import ../wallpapers.nix pkgs;
    in
  ''<?xml version="1.0"?>
    <!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
    <wallpapers>
      <wallpaper deleted="false">
        <name>My Background</name>
        <filename>${wp.abstract-paint-2-light}</filename>
        <filename-dark>${wp.abstract-paint-dark}</filename-dark>
        <options>zoom</options>
        <shade_type>solid</shade_type>
        <pcolor>#3071AE</pcolor>
        <scolor>#000000</scolor>
      </wallpaper>
    </wallpapers>'';
  
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

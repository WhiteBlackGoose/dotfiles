{ pkgs-goose }:
{ config, pkgs, ... }:

{
  environment.systemPackages =

  let 
    novaPackages = with pkgs-goose.legacyPackages.${pkgs.system}; [
      libreoffice
      (writeScriptBin "neovide" "${neovide}/bin/neovide --multigrid $@")
      firefox

      element-desktop 
      virt-manager
      qemu_kvm
      litemdview

      # konsole
      # xfce.xfce4-terminal
      # terminator
      kitty

      gthumb
      gimp
      pamixer
      pavucontrol
      vlc
      deepin.deepin-camera
    ];

    dtools = pkgs.callPackage ./dotnet-tool.nix {};

    commonPackages = with pkgs; [
      surf
      (dtools.combineTools dotnet-sdk_6 [ 
        dtools.tools.angourimath-terminal 
      ])

      (writeTextFile {
        name = "configure-gtk";
        destination = "/bin/configure-gtk";
        executable = true;
        text = let
          schema = pkgs.gsettings-desktop-schemas;
          datadir = "${schema}/share/gsettings-schemas/${schema.name}";
        in ''
          export XDG_DATA_DIRS=${datadir}:$XDG_DATA_DIRS
          gnome_schema=org.gnome.desktop.interface
          gsettings set $gnome_schema gtk-theme 'Dracula'
          '';
      })

      libotr
      gpgme
      thunderbird

      # attempts to make theme switching
      libadwaita
      arc-theme
      glib
      xdg-desktop-portal-gnome
      xdg-desktop-portal
      xfce.xfconf
      xfce.xfce4-settings
      ############################

      libinput-gestures
      ack
      ascii-image-converter
      bc
      blueman
      bluez
      bluez-tools
      cifs-utils
      electrum
      feh
      fprintd
      fzf
      # imagemagick
      kdeconnect
      lm_sensors
      lsd
      openvpn
      pandoc
      peek
      pinta
      ripgrep
      starship
      texlab
      texlive.combined.scheme-full
      tlp
      tor-browser-bundle-bin
      translate-shell
      unzip
      upower
      wdiff
      wget
      zathura
      zip
    ];
    securityPackages = with pkgs; [
      # to generate SSH keys:
      # ssh-keydgen --as seedphrase -t ed25519 -c 256 -a 100 -at 3 -am 16384 -ap 4 -f ~/.ssh/id_rsa
      # ssh-keydgen
      gnupg
      pinentry
      pinentry-gnome
    ];
    devPackages = with pkgs; [
      (pkgs.python3.withPackages (p: with p; [
        nltk
        openpyxl
        flake8
        jedi-language-server
        jupyter-client
        jupyter_console
        ipython
        scikit-learn
        notebook
        pkgs.neovim
        numpy
        pandas
        pytest
        geopandas
        pillow
        pkgs.pygmentex
        pynvim
        pyperclip
        scipy
        seaborn
        statsmodels
        tqdm
        yfinance
        # catboost
        debugpy
        (word2vec.overridePythonAttrs ( _: { doCheck = false; } ))
        pytorch
        tensorflow
        keras
      ]))
      ueberzug

      git
      lazygit

      gcc
      clang
      clang-tools
      clangStdenv
    ];

    myForks = with pkgs; [
      (
        nsxiv.overrideAttrs (oldAttrs: {
          src = fetchFromGitea {
            domain = "codeberg.org";
            owner = "WhiteBlackGoose";
            repo = "nsxiv";
            rev = "49f079c733";
            hash = "sha256-JpBzVoYOftoqcnbYXFRJeM88SI1ZeDrxHLJwlUQRoss=";
          };

          patches = [ ];
        })
      )
      sumneko-lua-language-server
    ];
  in
    novaPackages
    ++ commonPackages 
    ++ securityPackages
    ++ devPackages 
    ++ myForks;
}

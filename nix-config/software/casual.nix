{ pkgs, sw, ... }: {
  environment.systemPackages = with pkgs; [
    libreoffice
    firefox
    kitty
    gimp
    (let dtools = sw.my-nix.dotnetTool pkgs;
    in  (dtools.combineTools dotnet-sdk_6 [ 
        dtools.tools.angourimath-terminal 
      ]))
    litemdview
    vlc
    gthumb
    pamixer
    pavucontrol
    surf

    libotr
    gpgme
    veracrypt

    thunderbird
    signal-desktop
    element-desktop

    ascii-image-converter
    # (pkgs.writeScript "elect" "QT_QPA_PLATFORM=xcb ${pkgs.electrum}/bin/electrum")
    feh
    fzf
    plasma5Packages.kdeconnect-kde
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
    texlive.bin.pygmentex
    tlp
    tor-browser
    translate-shell
    unzip
    upower
    wdiff
    zathura
    zip
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
    neovide
    # (
    #   neovide.overrideAttrs (old: {
    #     desktopItem = old.desktopItem.override {
    #       exec = "neovide --multigrid %F";
    #     };
    #     postInstall = builtins.replaceStrings [ "${oldAttrs.desktopItem}" ] [ "${desktopItem}" ] oldAttrs.postInstall;
    #   })
    # )
    virt-manager
    qemu_kvm
    sw.tri.default
    sw.amcli.default
    (writeScriptBin "chat" "QT_SCALE_FACTOR=1.0 ${sw.gpt4all.gpt4all-chat}/bin/chat $@")
    remmina
    sw.stablediffusion.invokeai-amd
    freetube
    ffmpeg
    foliate
    airshipper
    gnome.gnome-system-monitor
    nix-index
    timer
    tmux
  ];
}

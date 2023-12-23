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
    deepin.deepin-camera
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
    fprintd
    fzf
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
    texlive.bin.pygmentex
    tlp
    tor-browser-bundle-bin
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
    (writeScriptBin "neovide" "${neovide}/bin/neovide --multigrid \"$@\"")
    virt-manager
    qemu_kvm
    sw.tri.default
    sw.amcli.default
    (writeScriptBin "chat" "QT_SCALE_FACTOR=2.5 ${sw.gpt4all.gpt4all-chat}/bin/chat $@")
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

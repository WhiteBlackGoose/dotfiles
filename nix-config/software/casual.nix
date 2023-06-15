{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    libreoffice
    firefox
    kitty
    gimp
    element-desktop 
    (let dtools = pkgs.callPackage ./dotnet-tool.nix {};
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
    thunderbird
    ascii-image-converter
    electrum
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
    (writeScriptBin "neovide" "${neovide}/bin/neovide --multigrid $@")
    virt-manager
    qemu_kvm
  ];
}

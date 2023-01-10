{ config, pkgs, ... }:

{
  environment.systemPackages =

  let 
    commonPackages = with pkgs; [
      bc
      wget
      firefox
      xclip
      upower
      zip
      unzip
      feh
      lm_sensors
      xfce.xfce4-screenshooter
      xfce.xfce4-terminal
      starship
      ack
      fprintd
      xss-lock
      blueman
      bluez
      bluez-tools
      zathura
      translate-shell
      texlab
      texlive.combined.scheme-full
      openvpn
      cifs-utils
      lsd
      ripgrep
      kdeconnect
      ascii-image-converter
      tlp
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
      (python3.withPackages (p: with p; [
        numpy
        pandas
        neovim
        jedi-language-server
        pynvim
        jupyter-client
        pillow
        flake8
        pygmentex
        pyperclip
      ]))

      ueberzug

      git
      lazygit

      gcc
      clang

      go

      (with dotnetCorePackages; combinePackages [
        dotnet-sdk_7
        dotnet-sdk_6
      ])
      omnisharp-roslyn
      netcoredbg
      msbuild
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
      # neovim
      (
        neovim-unwrapped.overrideAttrs (oldAttrs: {
          src = fetchFromGitHub {
            owner = "WhiteBlackGoose";
            repo = "neovim-goose";
            rev = "5c9bf0ea74aa9297227242f17058a9f0c4c0c115";
            hash = "sha256-s+c745H4D9hTOWTmPKG0emp4TMiJlFhhF9zCeqnIDB4=";
          };
        })
      )
    ];
  in
    commonPackages 
    ++ securityPackages
    ++ devPackages 
    ++ myForks;

}

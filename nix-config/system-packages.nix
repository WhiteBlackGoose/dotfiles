{ config, pkgs, ... }:

{
  environment.systemPackages =

  let 
    commonPackages = with pkgs; [
      ack
      ascii-image-converter
      bc
      blueman
      bluez
      bluez-tools
      cifs-utils
      feh
      firefox
      fprintd
      fzf
      kdeconnect
      libreoffice
      lm_sensors
      lsd
      openvpn
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
      xclip
      xfce.xfce4-screenshooter
      xfce.xfce4-terminal
      xss-lock
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
      (python3.withPackages (p: with p; [
        flake8
        jedi-language-server
        jupyter-client
        jupyter_console
        neovim
        numpy
        pandas
        pillow
        pygmentex
        pynvim
        pyperclip
        scipy
        seaborn
        statsmodels
        tqdm
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

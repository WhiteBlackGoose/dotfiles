{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bc
    wget
    firefox
    xclip
    upower
    alacritty
    (python3.withPackages (p: with p; [
      numpy
      pandas
      neovim
    ]))
    zip
    unzip
    git
    lazygit
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
    feh
    gcc
  ];

}

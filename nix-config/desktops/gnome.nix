let
sys = inputs@{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    xclip
    wl-clipboard
    vulkan-validation-layers
    pinentry-gnome3
    gnome-network-displays
  ];  


  
  nixpkgs.config.allowAliases = false;
  nixpkgs.overlays = [
    # GNOME 46: triple-buffering-v4-46
    (final: prev: {
      gnome = prev.gnome.overrideScope (gnomeFinal: gnomePrev: {
        mutter = gnomePrev.mutter.overrideAttrs (old: {
          src = pkgs.fetchFromGitLab  {
            domain = "gitlab.gnome.org";
            owner = "vanvugt";
            repo = "mutter";
            rev = "triple-buffering-v4-46";
            hash = "sha256-fkPjB/5DPBX06t7yj0Rb3UEuu5b9mu3aS+jhH18+lpI=";
          };
        });
      });
    })
  ];

  services.libinput.enable = true;
  services.xserver = {
    dpi = 192;
    enable = true;

    desktopManager = {
      xterm.enable = false;
      gnome.enable = true;
    };

    displayManager = rec {
      gdm = rec {
        enable = true;
        debug = enable;
        settings = {
          greeter.IncludeAll = true;
        };
      };
      lightdm.enable = !gdm.enable;
    };
  };

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    gedit # text editor
  ]) ++ (with pkgs.gnome; with pkgs; [
    epiphany
    gnome-characters
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);

  environment.variables = {
    CLUTTER_SHOW_FPS="1";
  };
};

home = ocr: inputs@{ pkgs, ... }:
{
  ocr = ocr.gnome;
  home.file."/home/goose/.local/share/gnome-background-properties/bg.xml".text = 
    let
      wp = import ../wallpapers.nix pkgs;
    in
  ''<?xml version="1.0"?>
    <!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
    <wallpapers>
      <wallpaper deleted="false">
        <name>My Background</name>
        <filename>${wp.abstract-paint-dark}</filename>
        <filename-dark>${wp.abstract-paint-dark}</filename-dark>
        <options>zoom</options>
        <shade_type>solid</shade_type>
        <pcolor>#3071AE</pcolor>
        <scolor>#000000</scolor>
      </wallpaper>
    </wallpapers>'';
};

in {
  inherit home sys;
}

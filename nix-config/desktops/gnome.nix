inputs@{ pkgs, ... }:

let
sys =
{
  environment.systemPackages = with pkgs; [
    xclip
    wl-clipboard
    gnome.gnome-tweaks
    vulkan-validation-layers
  ];  


  
  nixpkgs.config.allowAliases = false;
  nixpkgs.overlays = [
    (final: prev: {
      gnome = prev.gnome.overrideScope' (gnomeFinal: gnomePrev: {
        mutter = gnomePrev.mutter.overrideAttrs ( old: {
          src = pkgs.fetchgit {
            url = "https://gitlab.gnome.org/vanvugt/mutter.git";
            # GNOME 45: triple-buffering-v4-45
            rev = "0b896518b2028d9c4d6ea44806d093fd33793689";
            sha256 = "sha256-mzNy5GPlB2qkI2KEAErJQzO//uo8yO0kPQUwvGDwR4w=";
          };
        } );
      });
    })
  ];

  services.xserver = {
    dpi = 192;
    enable = true;
    libinput.enable = true;

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
  ]) ++ (with pkgs.gnome; [
    epiphany # web browser
    geary # email reader
    gnome-characters
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);

  environment.variables = {
    # CLUTTER_SHOW_FPS="1";
  };
};
home = {
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
};
in {
  inherit home sys;
}

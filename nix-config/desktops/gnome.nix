let
sys = inputs@{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    xclip
    wl-clipboard
    vulkan-validation-layers
    pinentry-gnome3
    gnome-network-displays

    # for gnome-network-displays
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
    gst_all_1.gst-vaapi  # only if using VAAPI
    gst_all_1.gst-plugins-base
    openh264
  ];  


  
  nixpkgs.config.allowAliases = false;

  services.libinput.enable = true;
  services = {
    desktopManager = {
      gnome.enable = true;
    };

    displayManager = rec {
      gdm = rec {
        enable = true;
        debug = false;
        settings = {
          greeter.IncludeAll = true;
        };
      };
    };
  };

  environment.gnome.excludePackages = (with pkgs.gnome; with pkgs; [
    gnome-photos
    gnome-tour
    gedit # text editor
    epiphany
    gnome-characters
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
    gnome-console
    geary
    gnome-contacts
    gnome-connections
    gnome-music
    gedit
    gnome-maps
    gnome-calculator
    file-roller
    eog
    evince
    gnome-secrets
    totem
  ]);

  environment.variables = {
  };
};

home = ocr: inputs@{ pkgs, ... }:
  let
    wb-gen = light: dark: ''<?xml version="1.0"?>
    <!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
    <wallpapers>
      <wallpaper deleted="false">
        <name>My Background</name>
        <filename>${light}</filename>
        <filename-dark>${dark}</filename-dark>
        <options>zoom</options>
        <shade_type>solid</shade_type>
        <pcolor>#3071AE</pcolor>
        <scolor>#000000</scolor>
      </wallpaper>
    </wallpapers>'';
    wp = import ../wallpapers.nix pkgs;
  in
{
  ocr = ocr.gnome;
  home.file."/home/goose/.local/share/gnome-background-properties/bg-1.xml".text =
    wb-gen wp.abstract-paint-dark wp.abstract-paint-dark;
  home.file."/home/goose/.local/share/gnome-background-properties/bg-2.xml".text =
    wb-gen wp.fedora-37-light wp.fedora-37-dark;
  home.file."/home/goose/.local/share/gnome-background-properties/bg-3.xml".text =
    wb-gen wp.abstract-paint-light wp.abstract-paint-dark;
  home.file."/home/goose/.local/share/gnome-background-properties/bg-4.xml".text =
    wb-gen wp.splashes-light wp.splashes-dark;
  home.file."/home/goose/.local/share/gnome-background-properties/bg-5.xml".text =
    wb-gen wp.splashes-dark wp.splashes-dark;
};

in {
  inherit home sys;
}

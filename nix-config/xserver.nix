{ pkgs-goose }:
{ config, pkgs, ... }:

{
  services.xserver = {
    dpi = 192;
    enable = true;
    libinput.enable = true;

    desktopManager = {
      xterm.enable = false;
      gnome.enable = true;
    };

    displayManager = {
      # gdm = {
      lightdm = {
        enable = true;
      };
      defaultSession = "none+i3";
    };

    windowManager.i3 = {
      package = pkgs-goose.legacyPackages.${pkgs.system}.i3;
      enable = true;
      extraPackages = with pkgs; [
        rofi
        i3blocks
        i3lock
      ];
    };   

  };

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    gnome-music
    gnome-terminal
    gedit # text editor
    epiphany # web browser
    geary # email reader
    evince # document viewer
    gnome-characters
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);
}

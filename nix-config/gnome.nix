inputs@{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xclip
    wl-clipboard
    gnome.gnome-tweaks
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
  ]) ++ (with pkgs.gnome; [
    gnome-music
    gedit # text editor
    epiphany # web browser
    geary # email reader
    gnome-characters
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);

  environment.variables = {
  };
}

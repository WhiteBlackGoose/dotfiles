{ pkgs-goose }:
inputs@{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
      xdotool
      xss-lock
      xclip
      xfce.xfce4-screenshooter
  ];  

  services.xserver = {
    dpi = 192;
    enable = true;
    libinput.enable = true;

    desktopManager = {
      xterm.enable = false;
      gnome.enable = false;
    };

    displayManager = {
      lightdm = {
        enable = true;
        extraSeatDefaults = ''
          greeter-hide-users=false
        '';
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
    
    displayManager.sessionCommands = ''${(import ./theme.nix inputs).apply-theme-script}'';
  };
}

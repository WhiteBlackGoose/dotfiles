{ nixpkgs, hyprland-input, ... }:
{
  programs.hyprland.package = hyprland-input.packages.${nixpkgs.stdenv.hostPlatform.system}.hyprland;
  programs.hyprland.enable = true;
  environment.systemPackages = with nixpkgs; [
    wl-clipboard
    dunst
    waybar
  ];
# TODO
# clipboard
# keyboard
# screenshot
# status bar
# cursor pointer
# wallpaper
# lock screen
# menu launcher
# X-only software
# shortcut managers
# custom scripts
}

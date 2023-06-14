{ nixpkgs, hyprland-input, ... }:
{
  programs.hyprland.package = hyprland-input.packages.${nixpkgs.stdenv.hostPlatform.system}.hyprland;
  programs.hyprland.enable = true;
  environment.systemPackages = with nixpkgs; [
    wl-clipboard
    dunst
    waybar
  ];
}

let 
sys = { nixpkgs, hyprland-input, ataraxiasjel, ... }: system:
{
  programs.hyprland.package = hyprland-input.packages.${system}.hyprland;
  programs.hyprland.enable = true;
  environment.systemPackages = with nixpkgs.legacyPackages.${system}; [
    wl-clipboard
    waybar
    rofi-wayland # wofi works like shit
    (writeScriptBin "rofi-run" ''
curr=$(/home/goose/.config/global_scripts/get-current-theme.sh)
if [ "$curr" = "prefer-light" ]; then
    theme_arg="-theme Arc"
else
    theme_arg="-theme Arc-Dark"
fi

rofi -dpi 96 -modi drun,run -show drun -show-icons $theme_arg -theme-str "element-icon { size: 2.65ch ; }"
    '')
    hyprpaper
    swaybg
    (writeScriptBin "ci" ''wl-copy "$@"'')
    (writeScriptBin "co" ''wl-paste "$@"'')
    pinentry-gnome3
    
    grim
    slurp
    waydroid
    ataraxiasjel.packages.${system}.waydroid-script
    swaylock
  ] ++ (let
      wp = (import ../wallpapers.nix nixpkgs.legacyPackages.${system});
      in
    [
      (writeScriptBin "hyprpaper-run" "
      hyprpaper --config ${writeText "hyprpaper.conf" "
        preload = ${wp.space-austronaut}
        wallpaper = ,${wp.space-austronaut}
      "}
      ")
      (writeScriptBin "hyprpaper-run-light" "
      hyprpaper --config ${writeText "hyprpaper.conf" "
        preload = ${wp.wake-dark}
        wallpaper = ,${wp.wake-dark}
      "}
      ")
      (writeScriptBin "swaybg-run-light" "swaybg -i ${wp.nixos-light}")
      (writeScriptBin "bg-auto" ''
        #!/usr/bin/env bash
        if [ "$WAYLAND_DISPLAY" == "wayland-1" ]
        then
            hyprpaper-run-light
        else
            swaybg-run-light
        fi
      '')
    ]
    );
  environment.variables = {
    GDK_SCALE = "2";
    GDK_DPI_SCALE = "1";
    _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
    QT_SCALE_FACTOR = "2";
  };
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
  xdg.portal.extraPortals = with nixpkgs.legacyPackages.${system}; [
    xdg-desktop-portal-wlr
    xdg-desktop-portal-gtk
  ];
  services.xserver.xkb.options = "ctrl:swapcaps";
  console.useXkbConfig = true;
  security.pam.services.swaylock = {
    text = ''
    auth include login
  '';
  };
};
home = ocr: {
  ocr = ocr.wayland;
};
in
{
  inherit sys home;
}

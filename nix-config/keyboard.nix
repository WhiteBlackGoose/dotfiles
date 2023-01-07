{ config, pkgs, ... }:

{
    # Configure keymap in X11
  services.xserver.layout = "us,ru";
  services.xserver.xkbOptions = "grp:caps_toggle";
  services.xserver.displayManager.sessionCommands =
    "${pkgs.xorg.xmodmap}/bin/xmodmap ${pkgs.writeText  "xkb-layout" ''
      ! Map umlauts to RIGHT ALT + <key>
        keycode 108 = Mode_switch
        keysym e = e E EuroSign
        keysym a = a A adiaeresis Adiaeresis
        keysym o = o O odiaeresis Odiaeresis
        keysym u = u U udiaeresis Udiaeresis
        keysym s = s S ssharp
    ''}";
}


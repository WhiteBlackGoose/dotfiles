let
sys = system: { pkgs-goose }: inputs@{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    xdotool
    xss-lock
    xclip
    xfce.xfce4-screenshooter
    (writeScriptBin "ci" ''xclip -sel clip "$@"'')
    (writeScriptBin "co" ''xclip -sel clip -o "$@"'')
  ];  

  xdg.portal.configPackages = with pkgs; [
    xdg-desktop-portal-gnome
    xdg-desktop-portal-gtk
  ];

  # If apps take a long time to start up
  # https://github.com/swaywm/sway/issues/5732
  # xdg.portal.enable = true;
  # for portals see the WM-relevant settings

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
    
    displayManager.sessionCommands = ''${(import ../theme.nix inputs).apply-theme-script}'';
  };

  environment.variables = {
    GDK_SCALE = "2";
    GDK_DPI_SCALE = "0.5";
    _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
    QT_SCALE_FACTOR = "2";
  };
};
home = ocr: inputs@{ config, lib, pkgs, ... }:
{
  systemd.user.startServices = true;
  systemd.user.services.keyboard-layout = {
    Unit.Name = "keyboard-layout";
    Unit.Description = "sxhkd service";
    Unit.PartOf = ["graphical-session.target"];
    Install.WantedBy = ["graphical-session.target"];

    # here we will have only two layouts
    # ENG: 🇬🇧+ 🇩🇪
    # RUS: 🇷🇺+ 🇺🇦
    # by using right alt, type letters from the other alphabet
    # 
    # https://wiki.linuxquestions.org/wiki/List_of_Keysyms_Recognised_by_Xmodmap
    Service.ExecStart = 
      ''${pkgs.sxhkd}/bin/sxhkd -c ${pkgs.writeText "config" 
      ''
      super + z
      	${pkgs.writeScript "toggle-kb" 
      ''
      currlayout=$(${pkgs.xkblayout-state}/bin/xkblayout-state print "%n")
      ${pkgs.xorg.setxkbmap}/bin/setxkbmap -option caps:ctrl_modifier
      if [ "$currlayout" == "Russian" ]; then
        ${pkgs.xorg.setxkbmap}/bin/setxkbmap -layout us
        ${pkgs.xorg.xmodmap}/bin/xmodmap ${pkgs.writeText "xkb-layout" ''
          keycode 108 = Mode_switch
          keysym e = e E EuroSign U00A3
          keysym a = a A adiaeresis Adiaeresis
          keysym o = o O odiaeresis Odiaeresis
          keysym u = u U udiaeresis Udiaeresis
          keysym s = s S ssharp U1E9E
        ''}
      else
        ${pkgs.xorg.setxkbmap}/bin/setxkbmap -layout ru
        ${pkgs.xorg.xmodmap}/bin/xmodmap ${pkgs.writeText "xkb-layout" ''
          keycode 108 = Mode_switch
          keysym Cyrillic_i = Cyrillic_i Cyrillic_I idiaeresis Idiaeresis
          keysym Cyrillic_ie = Cyrillic_ie Cyrillic_IE U0454 U0404
          keysym Cyrillic_yeru = Cyrillic_yeru Cyrillic_YERU U0456 U0406
          keysym Cyrillic_ghe = Cyrillic_ghe Cyrillic_GHE U0491 U0490
        ''}
      fi
      ''}
      ''}
      '';
  };
  xdg.desktopEntries = {
    dictcc = {
      name = "DE: dict.cc";
      exec = "${pkgs.surf}/bin/surf dict.cc -s";
    };
    dictcc-ru = {
      name = "DE: dict.cc from ru";
      exec = "${pkgs.surf}/bin/surf deru.dict.cc -s";
    };
    konjugator = {
      name = "DE: konjugator";
      exec = "${pkgs.surf}/bin/surf konjugator.reverso.net -s";
    };
    fromClipboard = {
      name = "Surf from clipboard";
      exec = ''${pkgs.writeScript "surf-from-cp" "${pkgs.surf}/bin/surf $(${pkgs.xclip}/bin/xclip -sel clip -o)"}'';
    };
    toggleWMMode = {
      name = "Toggle WM mode";
      exec = "${pkgs.writeScript "toggle-wm-mode" ''
        currmode=$(cat ~/.config/i3/currmode)
        rm ~/.config/i3/mode
        ${pkgs.killall}/bin/killall picom 2> /tmp/fff1 > /tmp/fff2
        if [ "$currmode" == "productive" ]; then
          ln -s ~/.config/i3/cute ~/.config/i3/mode
          i3-msg restart
          ${pkgs.picom}/bin/picom --backend glx &
          echo cute > ~/.config/i3/currmode
        else
          ln -s ~/.config/i3/productive ~/.config/i3/mode
          i3-msg restart
          echo productive > ~/.config/i3/currmode
        fi
      ''}";
    };
  };
  ocr = ocr.wayland;
};
in
{
  inherit sys home;
}

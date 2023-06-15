{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    libadwaita
    arc-theme
    glib
    xdg-desktop-portal-gnome
    xdg-desktop-portal
    xfce.xfconf
    xfce.xfce4-settings
    libinput-gestures
    ack
    bc
    blueman
    bluez
    bluez-tools
    cifs-utils
    gnupg
    pinentry
    pinentry-gnome
    wget
    # to generate SSH keys:
    # ssh-keydgen --as seedphrase -t ed25519 -c 256 -a 100 -at 3 -am 16384 -ap 4 -f ~/.ssh/id_rsa
    # ssh-keydgen

    (writeTextFile {
      name = "configure-gtk";
      destination = "/bin/configure-gtk";
      executable = true;
      text = let
        schema = pkgs.gsettings-desktop-schemas;
        datadir = "${schema}/share/gsettings-schemas/${schema.name}";
      in ''
        export XDG_DATA_DIRS=${datadir}:$XDG_DATA_DIRS
        gnome_schema=org.gnome.desktop.interface
        gsettings set $gnome_schema gtk-theme 'Dracula'
        '';
    })
  ];
}

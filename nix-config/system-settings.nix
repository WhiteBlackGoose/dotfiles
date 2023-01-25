{ config, pkgs, ... }:

{
  environment.pathsToLink = [ "/libexec" ];

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Istanbul";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  services.upower.enable = true;
  services.logind.extraConfig = ''
     # don’t shutdown when power button is short-pressed
     HandlePowerKey=ignore
   '';

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # finger print
  # services.fprintd.enable = true;
  # services.fprintd.tod.driver = pkgs.libfprint-2-tod1-vfs0090;

  # bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "FiraMono" ]; })
  ];

  # GnuPG
  services.pcscd.enable = true;
  services.dbus.packages = [ pkgs.gcr ];
  programs = {
    gnupg.agent = {
      enable = true;
      pinentryFlavor = "gnome3";
      enableSSHSupport = true;
    };
    kdeconnect.enable = true;
  };
  # Add this to .gnupg/gpg-agent.conf:
  # debug-pinentry
  # debug ipc
  # verbose
  # enable-ssh-support
  # # disable-scdaemon
  # pinentry-program /run/current-system/sw/bin/pinentry
  # # https://discourse.nixos.org/t/cant-get-gnupg-to-work-no-pinentry/15373/7

  services.tlp.enable = true;
  services.power-profiles-daemon.enable = false;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      # xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
    # gtkUsePortal = true;
  };

  # services.xdg-desktop-portal-gnome.enable = true;
  # services.xdg-desktop-portal-gtk.enable = true;
  services.avahi.enable = true;
  # for a WiFi printer
  services.avahi.openFirewall = true;
  # for an USB printer
  services.ipp-usb.enable = true;
  # for HP printer
  services.printing.drivers = [ pkgs.hplip ];
}



{ config, pkgs, lib, ... }:

{
  environment.pathsToLink = [ "/libexec" ];

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_GB.UTF-8";

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

  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.extraPackages = [ pkgs.mesa.drivers ];

  # bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;

  # Enable PulseAudio
  # services.pipewire.enable = false;
  # hardware.pulseaudio.enable = true;
  # hardware.pulseaudio.support32Bit = true;
  # users.extraUsers.goose.extraGroups = [ "audio" ];
  # nixpkgs.config.pulseaudio = true;
  # hardware.pulseaudio.extraConfig = "load-module module-combine-sink";

  # Enable Pipewire
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    # jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  fonts.packages = with pkgs; [
    nerdfonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    iosevka
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
    ssh.askPassword = "";
  };
  # Add this to .gnupg/gpg-agent.conf:
  # debug-pinentry
  # debug ipc
  # verbose
  # enable-ssh-support
  # # disable-scdaemon
  # pinentry-program /run/current-system/sw/bin/pinentry
  # # https://discourse.nixos.org/t/cant-get-gnupg-to-work-no-pinentry/15373/7

  # services.xdg-desktop-portal-gnome.enable = true;
  # services.xdg-desktop-portal-gtk.enable = true;
  services.avahi.enable = true;
  # for a WiFi printer
  services.avahi.openFirewall = true;
  # for an USB printer
  services.ipp-usb.enable = true;
  # for HP printer
  services.printing.drivers = [ pkgs.hplip ];

  programs.dconf.enable = true;
  programs.nix-ld.enable = true;

  # https://nixos.wiki/wiki/Virt-manager
  virtualisation.libvirtd.enable = true;
  virtualisation.waydroid.enable = true;

  environment.systemPackages = [
    (pkgs.writeScriptBin "waydroid-size-vertical" ''
      waydroid prop set persist.waydroid.height 1600
      waydroid prop set persist.waydroid.width 1200
      sudo systemctl restart waydroid-container.service
      echo 'restarted'
      waydroid show-full-ui & disown
    '')
    (pkgs.writeScriptBin "waydroid-size-full" ''
      waydroid prop set persist.waydroid.height ${builtins.toString (1800-64)}
      waydroid prop set persist.waydroid.width ""
      sudo systemctl restart waydroid-container.service
      echo 'restarted'
      waydroid show-full-ui & disown
    '')
  ];

  # https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix
  networking.firewall.allowedTCPPorts = [ 8384 22000 4321 8000 8080 1194 42000 42001 6379 7814 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 1194 51820 6379 ];
  networking.firewall.allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
  networking.firewall.allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];
  # environment.systemPackages = [
  #   pkgs.wireguard-tools
  # ];
  # networking.wireguard.interfaces = {
  #   wg0 = {
  #     ips = [ "10.13.13.2" ];
  #     listenPort = 51820;
  #     privateKeyFile = "/root/wireguard-keys-art/private";
  #     peers = [
  #       {
  #         publicKey = lib.readFile "/root/wireguard-keys-art/public";
  #         presharedKeyFile = "/root/wireguard-keys-art/preshared";
  #         allowedIPs = [ "192.168.1.0/24" ];
  #         endpoint = "artemlab.ru:35051";
  #         persistentKeepalive = 25;
  #       }
  #     ];
  #   };
  # };

  programs.fish.enable = true;
}



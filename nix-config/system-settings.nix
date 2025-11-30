{ config, pkgs, lib, ... }:

{
  environment.pathsToLink = [ "/libexec" ];

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";
  i18n =
    let lll = "de_DE.UTF-8";
  in {
    defaultLocale = lll;
    extraLocaleSettings = {
      LC_ADDRESS = lll;
      LC_IDENTIFICATION = lll;
      LC_MEASUREMENT = lll;
      LC_MONETARY = lll;
      LC_NAME = lll;
      LC_NUMERIC = lll;
      LC_PAPER = lll;
      LC_TELEPHONE = lll;
      LC_TIME = lll;
    };
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

  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = [ pkgs.mesa ];

  # bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;


  # Enable Pipewire
  services.pulseaudio.enable = false;
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

  fonts = {
    packages = with pkgs; [
      nerd-fonts.symbols-only
      nerd-fonts.fantasque-sans-mono
      nerd-fonts.comic-shanns-mono
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      iosevka
      monaspace
     (pkgs.stdenvNoCC.mkDerivation {
        pname = "unifraktur-maguntia";
        version = "local";
        src = ./fonts/UnifrakturMaguntia.ttf;  # your local file next to configuration.nix
        dontUnpack = true;
        installPhase = ''
          install -Dm644 "$src" "$out/share/fonts/truetype/UnifrakturMaguntia.ttf"
        '';
      })
     (pkgs.stdenvNoCC.mkDerivation {
        pname = "unifraktur-maguntia-16"; version = "local";
        src = ./fonts/UnifrakturMaguntia16.ttf;
        dontUnpack = true;
        installPhase = ''
          install -Dm644 "$src" "$out/share/fonts/truetype/UnifrakturMaguntia16.ttf"
        '';
      })
     (pkgs.stdenvNoCC.mkDerivation {
        pname = "unifraktur-maguntia-17"; version = "local";
        src = ./fonts/UnifrakturMaguntia17.ttf;
        dontUnpack = true;
        installPhase = ''
          install -Dm644 "$src" "$out/share/fonts/truetype/UnifrakturMaguntia17.ttf"
        '';
      })
     (pkgs.stdenvNoCC.mkDerivation {
        pname = "unifraktur-maguntia-18"; version = "local";
        src = ./fonts/UnifrakturMaguntia18.ttf;
        dontUnpack = true;
        installPhase = ''
          install -Dm644 "$src" "$out/share/fonts/truetype/UnifrakturMaguntia18.ttf"
        '';
      })
     (pkgs.stdenvNoCC.mkDerivation {
        pname = "unifraktur-maguntia-19"; version = "local";
        src = ./fonts/UnifrakturMaguntia19.ttf;
        dontUnpack = true;
        installPhase = ''
          install -Dm644 "$src" "$out/share/fonts/truetype/UnifrakturMaguntia19.ttf"
        '';
      })
     (pkgs.stdenvNoCC.mkDerivation {
        pname = "unifraktur-maguntia-20"; version = "local";
        src = ./fonts/UnifrakturMaguntia20.ttf;
        dontUnpack = true;
        installPhase = ''
          install -Dm644 "$src" "$out/share/fonts/truetype/UnifrakturMaguntia20.ttf"
        '';
      })
     (pkgs.stdenvNoCC.mkDerivation {
        pname = "unifraktur-maguntia-21"; version = "local";
        src = ./fonts/UnifrakturMaguntia21.ttf;
        dontUnpack = true;
        installPhase = ''
          install -Dm644 "$src" "$out/share/fonts/truetype/UnifrakturMaguntia21.ttf"
        '';
      })
    ];
  };

  # GnuPG
  services.pcscd.enable = true;
  services.dbus.packages = [ pkgs.gcr ];
  programs = {
    gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-gnome3;
      enableSSHSupport = true;
    };
    kdeconnect.enable = true;
    ssh.askPassword = "";
    captive-browser = {
      enable = true;
      interface = "wlo1";
    };
  };
  # Add this to .gnupg/gpg-agent.conf:
  # debug-pinentry
  # debug ipc
  # verbose
  # enable-ssh-support
  # # disable-scdaemon
  # pinentry-program /run/current-system/sw/bin/pinentry
  # # https://discourse.nixos.org/t/cant-get-gnupg-to-work-no-pinentry/15373/7

  services.avahi.enable = false;
#  services.avahi = {
#    enable = true;
#    nssmdns4 = true;
#    openFirewall = true;
#  };
  # for a WiFi printer
  # services.avahi.openFirewall = true;
  # for an USB printer
  # services.ipp-usb.enable = true;
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

  services.tailscale = {
    enable = false;
  };

  # https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/networking/syncthing.nix

  networking.firewall = {
    enable = true;
    logRefusedPackets = true;
    logRefusedConnections = true;
  };
  networking.nftables.enable = true;

  networking.firewall.allowedTCPPorts =
    [ 8384 22000 4321 8000 8080 1194 42000 42001 6379 7814 27017 ]
      ++ [ 7236 ]           # Miracast
      ++ [ 13000 ]          # DAP
     ++ [ 5535 ]            # LLMNR for some fucking reason?
      ;
  networking.firewall.allowedUDPPorts =
    [ 22000 21027 1194 51820 6379 ]
     ++ [ 7000 4001 3000 ]  # X-Ray
     ++ [ 27017 ]
     ++ [ 5353 1900 ]       # Miracast
     ++ [ 51820 ]           # wireguard
     ;
  networking.firewall.allowedTCPPortRanges =
    [
      { from = 1714; to = 1764; }  # KDE Connect
      { from = 55000; to = 55010; }  # random stuff
    ];
  networking.firewall.allowedUDPPortRanges =
    [
      { from = 1714; to = 1764; }  # KDE Connect
      { from = 55000; to = 55010; }  # random stuff
    ];

  programs.fish.enable = true;
}



{ config, pkgs, ... }:

{
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.device = "nodev";

  # needed for 12th Intel CPU graphics
  boot.kernelParams = [ "i915.force_probe=46a8" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Setup keyfile
  # boot.initrd.secrets = {
  #   "/crypto_keyfile.bin" = null;
  # };

  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  # Enable grub cryptodisk
  networking.hostName = "zenbook-ux3402z-nixos"; # Define your hostname.
    hardware.video.hidpi.enable = true;

    systemd.services.asus-touchpad-numpad = {
    description = "Activate Numpad inside the touchpad with top right corner switch";
    documentation = ["https://github.com/mohamed-badaoui/asus-touchpad-numpad-driver"];
    path = [ pkgs.i2c-tools ];
    script = ''
      cd ${pkgs.fetchFromGitHub {
        owner = "mohamed-badaoui";
        repo = "asus-touchpad-numpad-driver";
        # These needs to be updated from time to time
        rev = "d80980af6ef776ee6acf42c193689f207caa7968";
        sha256 = "sha256-JM2wrHqJTqCIOhD/yvfbjLZEqdPRRbENv+N9uQHiipc=";
      }}
      # In the last argument here you choose your layout.
      ${pkgs.python3.withPackages(ps: [ ps.libevdev ])}/bin/python asus_touchpad.py ux433fa
    '';
    # Probably needed because it fails on boot seemingly because the driver
    # is not ready yet. Alternativly, you can use `sleep 3` or similar in the
    # `script`.
    serviceConfig = {
      RestartSec = "1s";
      Restart = "on-failure";
    };
    wantedBy = [ "multi-user.target" ];
  };

  networking.nameservers = [ "1.1.1.1" "9.9.9.9" ];
}

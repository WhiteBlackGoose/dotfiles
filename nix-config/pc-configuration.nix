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
}

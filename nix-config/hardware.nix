{ config, lib, pkgs, modulesPath, ... }:

rec {
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.loader.systemd-boot = {
    enable = true;
  };

  boot.loader.efi.canTouchEfiVariables = false;

  boot.supportedFilesystems = [ "ntfs" ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "vmd" "nvme" "usb_storage" "sd_mod" "sdhci_pci" ];
  boot.initrd.kernelModules = [ "dm-snapshot" "binder" ];
  boot.kernelModules = [
    "kvm-intel"
  ];
  hardware.nvidiaOptimus.disable = false;
  hardware.tuxedo-drivers.enable = true;

  boot.kernelParams = [ "mem_sleep_default=s2idle" ];
  # boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.initrd.luks.devices.root = {
    device = "/dev/disk/by-uuid/7e836240-4ca8-4f26-8adf-ee509b96a0c4";
    preLVM = true;
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/0c2fae85-8684-4c1f-adf4-b401efa13138";
      fsType = "btrfs";
      options = [ "subvol=@" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/0c2fae85-8684-4c1f-adf4-b401efa13138";
      fsType = "btrfs";
      options = [ "subvol=@home" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/0c2fae85-8684-4c1f-adf4-b401efa13138";
      fsType = "btrfs";
      options = [ "subvol=@nix" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/0980-78F1";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  swapDevices = [
    {
      device = "/swap";
      size = 96 * 1024;
    }
  ];

  nixpkgs.config.packageOverrides = pkgs: {
    intel-vaapi-driver = pkgs.intel-vaapi-driver.override { enableHybridCodec = true; };
  };
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      libvdpau-va-gl
    ];
  };

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.latest;
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
    };
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];
  # Not load them lol
  services.thermald.enable = lib.mkDefault true;

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  services.power-profiles-daemon.enable = true;
  services.tlp = {
    enable = false;
    settings = {
      START_CHARGE_THRESH_BAT0=80;
      STOP_CHARGE_THRESH_BAT0=100;

      # https://linrunner.de/tlp/settings/processor.html#cpu-scaling-governor-on-ac-bat

      # Energy perf: power, performance
      # Scaling: powersave, performance

      # Battery
      CPU_SCALING_GOVERNOR_ON_BAT="powersave";
      CPU_ENERGY_PERF_POLICY_ON_BAT="power";

      CPU_SCALING_GOVERNOR_ON_AC="powersave";
      CPU_ENERGY_PERF_POLICY_ON_AC="power";
    };
  };
  hardware.i2c.enable = true;

  hardware.tuxedo-rs.enable = true;
  hardware.tuxedo-rs.tailor-gui.enable = true;

  services.udev.extraRules = ''
# For Basler
SUBSYSTEM=="usb", ATTRS{idVendor}=="2676", MODE:="0666", TAG+="uaccess", TAG+="udev-acl"
# For Hikvision
SUBSYSTEM=="usb", ATTRS{idVendor}=="2bdf", MODE:="0666", TAG+="uaccess", TAG+="udev-acl"
# For The Imaging Source
SUBSYSTEM=="usb", ATTRS{idVendor}=="199e", MODE:="0666", TAG+="uaccess", TAG+="udev-acl"
# For Daheng Imaging
SUBSYSTEM=="usb", ATTRS{idVendor}=="2ba2", MODE:="0666", TAG+="uaccess", TAG+="udev-acl"
# For Point Grey
SUBSYSTEM=="usb", ATTRS{idVendor}=="1e10", MODE:="0666", TAG+="uaccess", TAG+="udev-acl"
# For Dahua Technology
SUBSYSTEM=="usb", ATTRS{idVendor}=="2e03", MODE:="0666", TAG+="uaccess", TAG+="udev-acl"
# For IDS
SUBSYSTEM=="usb", ATTRS{idVendor}=="1409", MODE:="0666", TAG+="uaccess", TAG+="udev-acl"
SUBSYSTEM=="usb", ATTR{bDeviceClass}=="ef", ATTR{idVendor}=="1409", MODE="0777"
# Keychron keyboard
KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  '';

  hardware.sane.enable = true;

  services.resolved = {
    enable = true;
    dnssec = "false";
    domains = [ "~." ];
    fallbackDns = [ "8.8.8.8" "1.1.1.1" ];
    extraConfig = ''
      DNSOverTLS=false
    '';
  };

  networking.hostName = "tuxedo-infinitypro14-nixos"; # Define your hostname.
}

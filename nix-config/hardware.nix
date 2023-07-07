{ config, lib, pkgs, modulesPath, ... }:

rec {
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.device = "nodev";


  boot.supportedFilesystems = [ "ntfs" ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "vmd" "nvme" "usb_storage" "sd_mod" "sdhci_pci" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ 
    # import "/home/goose/prj/nixpkgs/nixpkgs/pkgs/os-specific/linux/als"
  ];
  boot.kernelParams = [ "i915.force_probe=46a8" ];
  # boots with kernel panic (blinking caps lock), hangs there
  # boot.kernelPackages = pkgs.linuxPackages_latest-libre;
  # boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # boot.kernelPackages =
  # let
  #   my-kernel = (pkgs.linux_6_1.override {
  #     argsOverride = rec {
  #       src = pkgs.fetchzip {
  #         url = "https://github.com/torvalds/linux/archive/refs/tags/v6.2.zip";
  #         sha256 = "sha256-woUP0KZEnwYEzvQEc1OBoCTjkLl8JjYAT4CxFVrfIjU=";
  #       };
  #       version = "6.2";
  #       modDirVersion = "6.2";
  #       };
  #   });
  # in
  # #  pkgs.linuxPackagesFor (
  # #   pkgs.linux-libre.override { linux = my-kernel; });
  # pkgs.linuxPackagesFor my-kernel;

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/4b55bb88-d461-48ec-b3c1-26545e213e45";
      fsType = "ext4";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/15fc3289-5599-4e60-95c0-8937428a5d88";
      fsType = "btrfs";
    };

  boot.initrd.luks.devices."nixos-home".device = "/dev/disk/by-uuid/34e93547-470a-415b-b6f1-f567f174a01e";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/A4A5-D3C9";
      fsType = "vfat";
    };

  swapDevices = [
    {
      device = "/home/swap1";
      size = 32 * 1024;
    }
  ];

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

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  services.tlp = {
    enable = true;
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
  systemd.services.asus-touchpad-numpad = {
    description = "Activate Numpad inside the touchpad with top right corner switch";
    documentation = ["https://github.com/mohamed-badaoui/asus-touchpad-numpad-driver"];
    path = [ pkgs.i2c-tools ];
    script = ''
      cd ${pkgs.fetchFromGitHub {
        owner = "mohamed-badaoui";
        repo = "asus-touchpad-numpad-driver";
        # These needs to be updated from time to time
        rev = "a2bada610ebb3fc002fceb53ddf93bc799241867";
        sha256 = "sha256-qanPTmP2Sctq4ybiUFzIiADP2gZH8HhajBORUSIXb04=";
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

  networking.hostName = "zenbook-ux3402z-nixos"; # Define your hostname.
  # networking.nameservers = [ "1.1.1.1" "9.9.9.9" ];
}
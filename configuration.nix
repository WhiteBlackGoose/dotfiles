# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs-goose, linux-input, ... }:
{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      (import ./nix-config/pc-specific-configuration.nix { linux-input = linux-input; })
      (import ./nix-config/xserver.nix { pkgs-goose = pkgs-goose; })
      ./nix-config/system-settings.nix
      (import ./nix-config/system-packages.nix { pkgs-goose = pkgs-goose; })
      ./nix-config/users.nix
      ./nix-config/env-variables.nix
    ];

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  

  nixpkgs.config.allowUnfree = false;

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    # here I list strings, which are names of packages allowed non-free
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}

{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    tri-input.url = "github:WhiteBlackGoose/tri";
    amcli-input.url = "github:asc-community/AngouriMathCLI";
    hyprland-input.url = "github:hyprwm/Hyprland";
    nil-input.url = "github:oxalica/nil/main";
    nvim-input.url = "github:neovim/neovim/master?dir=contrib";
    my-nix.url = "github:WhiteBlackGoose/my-nix";
    gpt4all.url = "github:polygon/gpt4all-nix";
    stablediffusion.url = "github:nixified-ai/flake";
    ataraxiasjel.url = "github:AtaraxiaSjel/nur/master";
    ataraxiasjel.inputs.nixpkgs.follows = "nixpkgs";
    ocr4nix.url = "git+https://codeberg.org/WhiteBlackGoose/ocr4nix";
  };

  outputs = inputs@{ nixpkgs, home-manager, tri-input, amcli-input, nil-input, nvim-input, gpt4all, my-nix, stablediffusion, ataraxiasjel, ocr4nix, ... }: {
    nixosConfigurations.wbg-pc = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";
      specialArgs.sw = {
        my-nix = my-nix;
        tri = tri-input.packages.${system};
        amcli = amcli-input.packages.${system};
        nil = nil-input.packages.${system};
        nvim = nvim-input.packages.${system};
        gpt4all = gpt4all.packages.${system};
        stablediffusion = stablediffusion.packages.${system};
        ataraxiasjel = ataraxiasjel.packages.${system};
      };
      modules = [
        { 
          nix.registry.nixpkgs.flake = nixpkgs;
          nix.nixPath = [ "/etc/nix/path" ];
          environment.etc."nix/path/nixpkgs".source = nixpkgs;
        }
        ./nix-config/nix-config.nix
        ./nix-config/hardware.nix
        ./nix-config/software/core.nix
        ./nix-config/software/dev.nix
        ./nix-config/software/casual.nix
        ./nix-config/scripts.nix
        ./nix-config/system-settings.nix
        ./nix-config/users.nix
        ./nix-config/env-variables.nix
        ./nix-config/syncthing.nix

        # WMs
        # (import ./nix-config/i3.nix { pkgs-goose = nixpkgs; })
        # (import ./nix-config/hyprland.nix inputs system)
        (import ./nix-config/gnome.nix)

        ./nix-config/docker.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.goose.imports = [
            ./nix-config/home/home.nix
            ./nix-config/home/ocr.nix
            ./nix-config/home/org.nix
          ];
          home-manager.users.goose.ocr = (ocr4nix.from-pkgs nixpkgs.legacyPackages.${system})
            .wayland;
        }
      ];
    };
  };
}

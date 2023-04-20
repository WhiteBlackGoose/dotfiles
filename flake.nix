{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs-goose.url = "github:WhiteBlackGoose/nixpkgs/master";
    # nixpkgs-new-linux.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations.wbg-pc = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        { 
          nix.registry.nixpkgs.flake = nixpkgs;
          nix.registry.nixpkgs-goose.flake = nixpkgs;
          nix.registry.linux-input.flake = nixpkgs;
          nix.nixPath = [ "/etc/nix/path" ];
          environment.etc."nix/path/nixpkgs".source = nixpkgs;
        }
        (import ./configuration.nix { pkgs-goose = nixpkgs; linux-input = nixpkgs; })
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.goose = import ./nix-config/home.nix;

          # Optionally, use home-manager.extraSpecialArgs to pass
          # arguments to home.nix
        }
      ];
    };
  };
}

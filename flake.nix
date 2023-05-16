{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    tri-input.url = "path:/home/goose/prj/tree-magick-editor";
    hyprland-input.url = "github:hyprwm/Hyprland";
  };

  outputs = { nixpkgs, home-manager, tri-input, ... }@inputs: {
    nixosConfigurations.wbg-pc = nixpkgs.lib.nixosSystem rec {
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

        # WMs
        (import ./nix-config/i3.nix { pkgs-goose = nixpkgs; })
        # (import ./nix-config/hyprland.nix inputs)

        {
          environment.systemPackages = [
            tri-input.packages.${system}.default
          ];
        }
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

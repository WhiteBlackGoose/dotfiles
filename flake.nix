{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    tri-input.url = "path:/home/goose/prj/tree-magick-editor";
    amcli-input.url = "github:asc-community/AngouriMathCLI";
    hyprland-input.url = "github:hyprwm/Hyprland";
    nil-input.url = "github:oxalica/nil/main";
    nvim-input.url = "github:neovim/neovim/master?dir=contrib";
    gpt4all.url = "github:polygon/gpt4all-nix";
  };

  outputs = { nixpkgs, home-manager, tri-input, amcli-input, nil-input, nvim-input, gpt4all, ... }: {
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
            amcli-input.packages.${system}.default
            nil-input.packages.${system}.default
            nvim-input.packages.${system}.default
            (nixpkgs.legacyPackages.${system}.writeScriptBin "chat"
              "QT_SCALE_FACTOR=2.5 ${gpt4all.packages.${system}.gpt4all-chat}/bin/chat $@")
          ];
        }
        {
          environment.systemPackages = import ./nix-config/scripts.nix nixpkgs.legacyPackages.${system};
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

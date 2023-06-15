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
    my-nix.url = "github:WhiteBlackGoose/my-nix";
  };

  outputs = { nixpkgs, home-manager, tri-input, amcli-input, nil-input, nvim-input, gpt4all, my-nix, ... }: {
    nixosConfigurations.wbg-pc = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";
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
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.goose.imports = [
            ./nix-config/home.nix
          ];
        }
      ];
    };
  };
}

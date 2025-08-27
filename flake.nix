{
  description = "NixOS system configuration with Home Manager";

  inputs = {
    # System packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager, reusing nixpkgs so versions match
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./configuration.nix

          # Enable Home Manager as a NixOS module
          home-manager.nixosModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # Home Manager config for user "kistkin"
            home-manager.users.kistkin = import ./home-manager/home.nix;
          }
        ];
      };
    };
  };
}


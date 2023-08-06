{
  description = "Richard Vock's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs2211.url = "github:nixos/nixpkgs/nixos-22.11";
    nixinate.url = "github:matthewcroughan/nixinate";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    home-manager.url = "github:nix-community/home-manager";
    agenix.url = "github:ryantm/agenix";
    utils = {
      url = "github:gytis-ivaskevicius/flake-utils-plus";
    };
    stylix.url = "github:richard-vock/stylix";
    base16-schemes.url = "github:tinted-theming/base16-schemes";
    base16-schemes.flake = false;
  };

  outputs =
    { self
    , nixpkgs
    , nixpkgs2211
    , nixinate
    , nixos-hardware
    , home-manager
    , agenix
    , stylix
    , base16-schemes
    , utils
    , ...
    } @ inputs: {
      apps = nixinate.nixinate.x86_64-linux self;
      nixosModules = import ./modules { lib = nixpkgs.lib; };
      nixosConfigurations = {
        home = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            utils.nixosModules.autoGenFromInputs
            home-manager.nixosModules.home-manager
            stylix.nixosModules.stylix
            agenix.nixosModules.default
            ./hosts/home/configuration.nix
          ];
          specialArgs = { inherit inputs; };
        };
        sync = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            utils.nixosModules.autoGenFromInputs
            home-manager.nixosModules.home-manager
            stylix.nixosModules.stylix
            agenix.nixosModules.default
            ./hosts/sync/configuration.nix
          ];
          specialArgs = { inherit inputs; };
        };
      };
    };
}

{
  description = "Richard Vock's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs2211.url = "github:nixos/nixpkgs/nixos-22.11";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    home-manager.url = "github:nix-community/home-manager";
    agenix.url = "github:ryantm/agenix";
    utils = {
      url = "github:gytis-ivaskevicius/flake-utils-plus";
    };
    stylix.url = "github:danth/stylix";
    base16-schemes.url = "github:tinted-theming/base16-schemes";
    base16-schemes.flake = false;
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
        tuxedo = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            utils.nixosModules.autoGenFromInputs
            home-manager.nixosModules.home-manager
            stylix.nixosModules.stylix
            agenix.nixosModules.default
            ./hosts/tuxedo/configuration.nix
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
        kawcloud = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            utils.nixosModules.autoGenFromInputs
            home-manager.nixosModules.home-manager
            stylix.nixosModules.stylix
            agenix.nixosModules.default
            ./hosts/kawcloud/configuration.nix
          ];
          specialArgs = { inherit inputs; };
        };
      };
    };
}

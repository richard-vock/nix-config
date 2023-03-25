{
  description = "Matthew's NixOS configuration";

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
            agenix.nixosModules.age
            ./hosts/home/configuration.nix
          ];
          specialArgs = { inherit inputs; };
        };
        #t480 = nixpkgs.lib.nixosSystem {
        #  system = "x86_64-linux";
        #  modules = [
        #    ./hosts/t480/configuration.nix
        #    utils.nixosModules.autoGenFromInputs
        #    home-manager.nixosModules.home-manager
        #    agenix.nixosModules.age
        #    nixos-hardware.nixosModules.lenovo-thinkpad-t480
        #    nixos-hardware.nixosModules.common-cpu-intel-kaby-lake
        #  ];
        #  specialArgs = { inherit inputs; };
        #};
        #hetznix = nixpkgs.lib.nixosSystem {
        #  system = "x86_64-linux";
        #  modules = [
        #    ./hosts/hetznix/configuration.nix
        #    agenix.nixosModules.age
        #  ];
        #  specialArgs = { inherit inputs; };
        #};
      };

      #stylix.base16Scheme = "${base16-schemes}/ayu-dark.yaml";
    };
}

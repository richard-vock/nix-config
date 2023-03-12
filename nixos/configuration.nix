# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, outputs, config, lib, pkgs, ... }: {
    imports = [
        ./hardware.nix 
        ./boot.nix 
        ./fs.nix 
        ./users.nix 
        ./networking.nix 
        ./locale.nix 
        ./xserver.nix 
        ./sound.nix 
        ./permanence.nix
        inputs.home-manager.nixosModules.home-manager
    ];

    nixpkgs = {
        overlays = [
            outputs.overlays.additions
            outputs.overlays.modifications
            outputs.overlays.unstable-packages
        ];

        config = {
            allowUnfree = true;
        };
    };

    nix = {
        registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

        nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

        settings = {
            experimental-features = [ "nix-command" "flakes" ];
            auto-optimise-store = true;
        };
    };

    home-manager = {
        extraSpecialArgs = { inherit inputs outputs; };
        users = { 
            richard = import ../home-manager;
        };
    };

    environment.systemPackages = with pkgs; [
        git
        vim
        wget
    ];

    system.stateVersion = "22.05"; # Did you read the comment?
}


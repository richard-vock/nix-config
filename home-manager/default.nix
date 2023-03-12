# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, outputs, lib, config, pkgs, ... }: {
    imports = [
        # If you want to use modules your own flake exports (from modules/home-manager):
        # outputs.homeManagerModules.example
  
        inputs.nix-colors.homeManagerModules.default
  
        ./permanence.nix
    ];
  
    nixpkgs = {
        # You can add overlays here
        overlays = [
            outputs.overlays.additions
            outputs.overlays.modifications
            outputs.overlays.unstable-packages
        ];
        config = {
            allowUnfree = true;
            allowUnfreePredicate = (_: true);
        };
    };
  
    home = {
        username = "richard";
        homeDirectory = "/home/richard";
    };
  
    # programs.neovim.enable = true;
    home.packages = with pkgs; [
        lazygit
    ];
  
    programs.home-manager.enable = true;
    programs.git.enable = true;
  
    colorScheme = inputs.nix-colors.colorSchemes.ayu-dark;
  
    systemd.user.startServices = "sd-switch";

    home.stateVersion = "22.11";
}

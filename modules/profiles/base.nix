{ config, pkgs, lib, inputs, ...}: {
  imports = [
    ../mixins/openssh.nix
    ../mixins/fonts.nix
    ../mixins/nvim.nix
  ];
  environment.systemPackages = with pkgs; [
    git
  ];
  nix = {
    settings = {
      trusted-users = [ "@wheel" "root" "nix-ssh" ];
      auto-optimise-store = true;
    };
    package = pkgs.nixUnstable;
    extraOptions =
      let empty_registry = builtins.toFile "empty-flake-registry.json" ''{"flakes":[],"version":2}''; in
      ''
        experimental-features = nix-command flakes
        flake-registry = ${empty_registry}
        builders-use-substitutes = true
      '';
    registry.nixpkgs.flake = inputs.nixpkgs;
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  };
}

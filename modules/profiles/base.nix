{ config, pkgs, lib, inputs, ...}: {
  imports = [
    ../mixins/openssh.nix
    ../mixins/fonts.nix
    ../mixins/nvim.nix
  ];
  environment.systemPackages = with pkgs; [
    lazygit
    difftastic
    file
    ripgrep
    fd
    unzip
    btop
    pciutils
    tree
    wget
    tmux
    gnumake
    ntfs3g
    sshfs
    ncdu
    usbutils
    yazi
    inputs.agenix.formatter.x86_64-linux
    inputs.agenix.packages.x86_64-linux.default
  ];
  nix = {
    settings = {
      trusted-users = [ "@wheel" "root" "nix-ssh" ];
      auto-optimise-store = true;
    };
    # package = pkgs.nixUnstable;
    extraOptions =
      let empty_registry = builtins.toFile "empty-flake-registry.json" ''{"flakes":[],"version":2}''; in
      ''
        experimental-features = nix-command flakes
        flake-registry = ${empty_registry}
        builders-use-substitutes = true
      '';
    registry.nixpkgs.flake = inputs.nixpkgs;
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    gc = {
      automatic = true;
      dates = "weekly";
    };
  };

  users.mutableUsers = false;
}

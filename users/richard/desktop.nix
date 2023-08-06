{ config, lib, pkgs, inputs, ... }:
{
  imports = [
    ./modules/i3.nix
    ./modules/stylix.nix
    ./modules/alacritty.nix
  ];

  xdg.enable = true;
}

{ config, lib, pkgs, inputs, ... }:
{
  imports = [
    inputs.stylix.homeModules.stylix
    ./modules/i3.nix
    ./modules/stylix.nix
    ./modules/alacritty.nix
    ./modules/kitty.nix
  ];

  xdg.enable = true;
}

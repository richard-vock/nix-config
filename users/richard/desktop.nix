{ config, lib, pkgs, inputs, ... }:
{
  imports = [
    ./modules/stylix.nix
    ./modules/alacritty.nix
    ./modules/nnn.nix
    ./modules/feh.nix
  ];
  home = {
    packages = with pkgs; [
      alsa-utils
      evince
      gimp
      inkscape
      networkmanagerapplet
      networkmanager-openvpn
      pavucontrol
      signal-desktop
    ];
  };

  xdg.enable = true;
}

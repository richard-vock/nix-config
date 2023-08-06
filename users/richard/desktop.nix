{ config, lib, pkgs, inputs, ... }:
{
  imports = [
    ./modules/i3.nix
    ./modules/stylix.nix
    ./modules/alacritty.nix
    ./modules/feh.nix
  ];
  home = {
    packages = with pkgs; [
      alsa-utils
      evince
      gimp
      inkscape
      maim
      xclip
      networkmanagerapplet
      pavucontrol
      signal-desktop
      spotify
      unityhub
      libreoffice-qt
      firefox
      vivaldi
    ];
  };

  xdg.enable = true;
}

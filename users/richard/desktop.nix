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
      inkscape
      gimp
      evince
      pavucontrol
      signal-desktop
    ];
  };

  #qt = {
  #  enable = true;
  #  platformTheme = "gnome";
  #  style = {
  #    name = "adwaita-dark";
  #    package = pkgs.adwaita-qt;
  #  };
  #};

  #gtk = {
  #  enable = true;
  #  theme.package = pkgs.arc-theme;
  #  theme.name = "Arc-Dark";
  #  iconTheme.package = pkgs.arc-icon-theme;
  #  iconTheme.name = "Arc";
  #};

  xdg.enable = true;
}

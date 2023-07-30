{ config, pkgs, lib, inputs, ...}: {
  imports = [
    ../profiles/i3.nix
  ];
  environment.systemPackages = with pkgs; [
    octave
    vlc
    ranger
    xfce.thunar
  ];
}

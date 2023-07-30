{ config, pkgs, lib, inputs, ...}: {
  imports = [
    ../profiles/i3.nix
    ../mixins/pipewire.nix
    ../mixins/bluetooth.nix
  ];
  environment.systemPackages = with pkgs; [
    octave
    vlc
    ranger
    xfce.thunar
  ];
}

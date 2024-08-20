{ config, pkgs, lib, inputs, ...}: {
  imports = [
    ../mixins/xserver.nix
    ../mixins/pipewire.nix
    ../mixins/bluetooth.nix
  ];
  environment.systemPackages = with pkgs; [
    alsa-utils
    evince
    gimp
    inkscape
    feh
    maim
    xclip
    networkmanagerapplet
    pavucontrol
    octave
    vlc
    ranger
    xfce.thunar
    libreoffice-qt
    firefox
    vivaldi
    signal-desktop
    spotify
    blender
    slack
    remmina
    httpie
  ];
}

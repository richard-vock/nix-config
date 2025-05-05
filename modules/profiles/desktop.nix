{ config, pkgs, lib, inputs, ...}: {
  imports = [
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
    wireguard-tools
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
  ];
}

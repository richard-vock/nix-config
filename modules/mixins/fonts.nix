{ config, pkgs, lib, ... }:
{
  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; [
#    corefonts
    fira-code fira-code-symbols
    terminus_font
    terminus_font_ttf
    jetbrains-mono
    powerline-fonts
    gelasio
    nerd-fonts.hack
    iosevka
    noto-fonts noto-fonts-cjk-sans noto-fonts-emoji
    source-code-pro
    ttf_bitstream_vera
    font-awesome
  ];
}

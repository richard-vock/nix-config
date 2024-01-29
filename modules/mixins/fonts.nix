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
    (nerdfonts.override { fonts = [ "Hack" ]; })
    iosevka
    noto-fonts noto-fonts-cjk noto-fonts-emoji
    source-code-pro
    ttf_bitstream_vera
    font-awesome
  ];
}

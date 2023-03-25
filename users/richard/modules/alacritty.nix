{ config, lib, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    #settings = {
    #  font = {
    #    normal = {
    #      family = "Hack Nerd Font";
    #      style = "Regular";
    #    };
    #    bold = {
    #      family = "Hack Nerd Font";
    #      style = "Bold";
    #    };
    #    italic = {
    #      family = "Hack Nerd Font";
    #      style = "Italic";
    #    };
    #    bold_italic = {
    #      family = "Hack Nerd Font";
    #      style = "Bold Italic";
    #    };
    #    size = 11;
    #  };
    #  env = {
    #    TERM="xterm-256color";
    #  };
    #};
  };
}

{ config, lib, pkgs, inputs, ... }:

with config.lib.stylix.colors.withHashtag;

{
  stylix = {
    base16Scheme = "${inputs.base16-schemes}/ayu-dark.yaml";
    fonts = {
      sansSerif = config.stylix.fonts.monospace;
      serif = config.stylix.fonts.monospace;

      monospace = {
        package = pkgs.nerd-fonts.hack;
        name = "Hack Nerd Font";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        desktop = 11;
        terminal = 11;
        applications = 12;
        popups = 11;
      };
    };
  };

  # i3 tweaks
  xsession.windowManager.i3.config.colors.focused.background = lib.mkForce base0D;
  xsession.windowManager.i3.config.colors.focused.text = lib.mkForce base00;
  xsession.windowManager.i3.config.colors.focused.border = lib.mkForce base0D;
  xsession.windowManager.i3.config.colors.focused.childBorder = lib.mkForce base0D;
  xsession.windowManager.i3.config.colors.focused.indicator = lib.mkForce base0D;
}

{ config, pkgs, lib, ... }:

{
  config = {
    environment.pathsToLink = [ "/libexec" ];
    programs.dconf.enable = true;

    services.xserver = {
        enable = true;

        screenSection = ''
          Option "metamodes" "HDMI-0: nvidia-auto-select +0+0, DP-0: nvidia-auto-select +2560+0, DP-2: nvidia-auto-select +5120+0"
        '';

        desktopManager.xterm.enable = false;
        displayManager.defaultSession = "none+i3";
        windowManager.i3.enable = true;

        layout = "us";
        xkbOptions = "eurosign:e,caps:escape";
        xkbVariant = "intl";
    };

    fonts.fonts = with pkgs; [ terminus_font_ttf font-awesome ];
  };
}

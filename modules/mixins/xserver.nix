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
        windowManager.i3.enable = true;

        xkb.layout = "us";
        xkb.variant = "eurosign:e,caps:escape";
        xkb.options = "intl";
    };

    services.displayManager = {
        enable = true;
        defaultSession = "none+i3";
    };
  };
}

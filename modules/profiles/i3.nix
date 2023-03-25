{ config, pkgs, lib, ... }: {
  imports = [
    ../mixins/i3.nix
  ];
  config = {
    environment.pathsToLink = [ "/libexec" ];
    programs.dconf.enable = true;

    services.xserver = {
        enable = true;

        desktopManager = {
          xterm.enable = false;
        };

        displayManager = {
          defaultSession = "none+i3";
        };

        windowManager.i3 = {
          enable = true;
          extraPackages = with pkgs; [
            dmenu
            i3status
            i3lock
            i3blocks
          ];
        };

        layout = "us";
        xkbOptions = "eurosign:e,caps:escape";
        xkbVariant = "intl";
    };

    fonts.fonts = with pkgs; [ terminus_font_ttf font-awesome ];
    home-manager.users.richard = { pkgs, ... }: {
      home.packages = with pkgs; [
        imv
        i3status
      ];
    };
  };
}

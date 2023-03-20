{ config, lib, pkgs, ... }:

let
    mod = "Mod4";
in {
    xsession.windowManager.i3 = {
        enable = true;
        config = {
            modifier = mod;

            keybindings = lib.mkOptionDefault {
                "${mod}+e" = "exec ${pkgs.dmenu}/bin/dmenu_run";

                "${mod}+j" = "focus left";
                "${mod}+k" = "focus down";
                "${mod}+l" = "focus up";
                "${mod}+semicolon" = "focus right";

                "${mod}+Shift+j" = "move left";
                "${mod}+Shift+k" = "move down";
                "${mod}+Shift+l" = "move up";
                "${mod}+Shift+semicolon" = "move right";
            };

            bars = [
                {
                    position = "bottom";
                    statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ${./i3status-rust.toml}";
                }
            ];
        };
    };
}


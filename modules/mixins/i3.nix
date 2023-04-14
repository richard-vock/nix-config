{ config, pkgs, inputs, ... }:

let
  terminal = "${pkgs.alacritty}/bin/alacritty";
  bemenu = "${pkgs.bemenu}/bin/bemenu-run -H 16 -p execute: --fn 'Hack Nerd 10' --tf '#FFFFFF' --scf '#FFFFFF' --ff '#FFFFFF' --tb ''#FFFFFF --nf '#FFFFFF' --hf '#FFFFFF' --nb '#000000' --tb '#000000' --fb '#000000'";
  launcher = bemenu;
  i3lockcmd = "${pkgs.swaylock}/bin/i3lock -c '#232323'";
in
{ config = {
    home-manager.users.richard = { pkgs, ... }: {
      xsession.windowManager.i3 = {
        enable = true;
        config = rec {
          inherit terminal;
          bars = [{
            trayOutput = "DP-2";
            fonts = {
              names = [ "Hack Nerd" ];
              size = 11.0;
            };
            statusCommand = "i3status-rs $HOME/.config/i3status-rust/config-default.toml";
            extraConfig = "height 25";
            colors = {
              focusedWorkspace = {
                background = "#59c2ff";
                text = "#000000";
                border = "#000000";
              };
              # activeWorkspace = {
              #   background = "#59c2ff";
              #   text = "#000000";
              #   border = "#000000";
              # };
            };
          }];
          window = {
            hideEdgeBorders = "both";
          };
          workspaceLayout = "tabbed";
          workspaceOutputAssign = [
            {
              output = "HDMI-0";
              workspace = "1";
            }
            {
              output = "DP-0";
              workspace = "2";
            }
            {
              output = "DP-2";
              workspace = "3";
            }
          ];
          focus.followMouse = false;
          startup = [
            { always = true; command = "${pkgs.systemd}/bin/systemd-notify --ready || true"; }
            { always = true; command = "${pkgs.networkmanagerapplet}/bin/nm-applet"; }
            { always = true; command = "${pkgs.flashfocus}/bin/flashfocus"; }
          ];
          modifier = "Mod1";
          keybindings = {
            "${modifier}+Return" = "exec ${terminal}";
            "${modifier}+x" = "exec ${i3lockcmd}";
            "${modifier}+Shift+c" = "kill";
            "${modifier}+e" = "exec ${launcher}";

            "${modifier}+h" = "focus left";
            "${modifier}+j" = "focus down";
            "${modifier}+k" = "focus up";
            "${modifier}+l" = "focus right";
            "${modifier}+Left" = "focus left";
            "${modifier}+Down" = "focus down";
            "${modifier}+Up" = "focus up";
            "${modifier}+Right" = "focus right";

            "${modifier}+Shift+h" = "move left";
            "${modifier}+Shift+j" = "move down";
            "${modifier}+Shift+k" = "move up";
            "${modifier}+Shift+l" = "move right";
            "${modifier}+Shift+Left" = "move left";
            "${modifier}+Shift+Down" = "move down";
            "${modifier}+Shift+Up" = "move up";
            "${modifier}+Shift+Right" = "move right";

            "${modifier}+n" = "splith";
            "${modifier}+m" = "splitv";
            "${modifier}+f" = "fullscreen toggle";
            "${modifier}+Shift+space" = "floating toggle";
            "${modifier}+t" = "layout toggle tabbed split";

            "${modifier}+i" = "focus parent";

            "${modifier}+Shift+r" = "reload";
            "${modifier}+Shift+p" = "restart";

            "${modifier}+1" = "workspace number 1";
            "${modifier}+2" = "workspace number 2";
            "${modifier}+3" = "workspace number 3";
            "${modifier}+4" = "workspace number 4";
            "${modifier}+5" = "workspace number 5";
            "${modifier}+6" = "workspace number 6";
            "${modifier}+7" = "workspace number 7";
            "${modifier}+8" = "workspace number 8";
            "${modifier}+9" = "workspace number 9";
            "${modifier}+0" = "workspace number 10";

            "${modifier}+Shift+1" = "move container to workspace number 1";
            "${modifier}+Shift+2" = "move container to workspace number 2";
            "${modifier}+Shift+3" = "move container to workspace number 3";
            "${modifier}+Shift+4" = "move container to workspace number 4";
            "${modifier}+Shift+5" = "move container to workspace number 5";
            "${modifier}+Shift+6" = "move container to workspace number 6";
            "${modifier}+Shift+7" = "move container to workspace number 7";
            "${modifier}+Shift+8" = "move container to workspace number 8";
            "${modifier}+Shift+9" = "move container to workspace number 9";
            "${modifier}+Shift+0" = "move container to workspace number 10";
          };
        };
      };
    };
  };
}

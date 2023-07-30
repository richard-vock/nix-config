{ config, lib, pkgs, inputs, headless ? true, ... }:

{
  imports = [
    ./modules/ssh/ssh_sk.nix
  ] ++ lib.optional (!headless) ./desktop.nix;

  home = {
    username = "richard";
    homeDirectory = "/home/richard";
  };

  programs = {
    starship = {
      enable = true;
      enableBashIntegration = true;
      settings = {
        username = {
          format = "[$user]($style) ";
          show_always = true;
        };
        shlvl = {
          disabled = false;
          format = "$shlvl ▼ ";
          threshold = 4;
        };
      };
    };
    bash = {
      enable = true;
      bashrcExtra = ''
        set -o vi
        export EDITOR=vim

        # Makes `nix inate` as an alias of `nix shell`.
        nix() {
          case $1 in
            inate)
              shift
              command nix shell "$@"
              ;;
            *)
              command nix "$@";;
          esac
        }
      '';
      # shellAliases = {
      #   n = "nix-shell -p";
      # };
    };
  };

  home.stateVersion = "20.03";
}

{
  config,
  lib,
  pkgs,
  inputs,
  headless ? true,
  ...
}:

{
  imports = [
    ./modules/git.nix
    ./modules/yazi.nix
  ]
  ++ lib.optional (!headless) ./desktop.nix;

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
        command_timeout = 2000;
      };
    };
    bash = {
      enable = true;
      bashrcExtra = ''
        set -o vi
        export EDITOR=nvim
        export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

        if command -v fzf-share >/dev/null; then
          source "$(fzf-share)/key-bindings.bash"
          source "$(fzf-share)/completion.bash"
        fi
      '';
      # shellAliases = {
      #   n = "nix-shell -p";
      # };
    };
  };

  home.stateVersion = "20.03";
}

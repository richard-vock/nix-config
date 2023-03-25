{ config, pkgs, ... }:

{
  config = {
    home-manager.users.richard = { pkgs, ... }: {


      programs.obs-studio = {
        enable = true;
#        plugins = with pkgs; [
#          obs-wlrobs
#          obs-v4l2sink
#          obs-ndi
#        ];
      };
    };
  };
}

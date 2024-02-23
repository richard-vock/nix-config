{ config, lib, pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    settings = {
        manager = {
            ratio = [1 4 3];
            show_hidden = true;
            show_symlink = true;
            sort_by = "alphabetical";
            sort_sensitive = false;
            sort_reverse = false;
            sort_dir_first = true;
        };
        opener = {
            play = [
                {
                    exec = "vlc \"$@\"";
                    orphan = true;
                    block = false;
                    desc = "Play video";
                }
            ];
        };
    };
  };
}

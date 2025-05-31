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
        open = {
            rules = [
                {
                    mime = "application/pdf";
                    use = "evince";
                }
                {
                    mime = "video/*";
                    use = "vlc";
                }
                {
                    mime = "image/*";
                    use = "imv";
                }
            ];
        };
        opener = {
            evince = [
                {
                    run = "evince \"$@\"";
                    orphan = true;
                    block = false;
                    desc = "Open PDF";
                }
            ];
            play = [
                {
                    run = "vlc \"$@\"";
                    orphan = true;
                    block = false;
                    desc = "Play video";
                }
            ];
            imv = [
                {
                    run = "imv \"$@\"";
                    orphan = true;
                    block = false;
                    desc = "View image";
                }
            ];
        };
    };
  };
}

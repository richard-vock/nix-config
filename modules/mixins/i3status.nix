{ pkgs, config, ... }:
{
  home-manager.users.richard.programs.i3status = {
    enable = true;
    modules."ipv6".enable = false;
    modules."wireless _first_".enable = false;
    modules."ethernet _first_".enable = false;
    modules."battery all".enable = false;
    modules."load".enable = false;
    modules."memory".enable = false;
    modules."disk /".enable = false;
  };
  # home-manager.users.richard.programs.i3status-rust = {
  #   enable = true;
  #   bars = {
  #     primary = {
  #       blocks = [
  #         {
  #           block = "time";
  #           interval = 1;
  #           format = "%F %T";
  #           icons_format = " ";
  #         }
  #       ];
  #       # theme = "space-villain";
  #       # icons = "none";
  #     };
  #   };
  # };
}

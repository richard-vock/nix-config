{ pkgs, config, ... }:
{
  home-manager.users.richard.programs.i3status-rust = {
     enable = true;
     bars = {
       default = {
         blocks = [
           {
             block = "music";
           }
           {
             block = "time";
             interval = 1;
             format = " $timestamp.datetime(f:'%a %d/%m %R') ";
             # icons_format = " ";
           }
         ];
         settings = {
           theme = {
             theme = "solarized-dark";
             overrides = {
               info_bg="#aad94c";
               idle_bg="#59c2ff";
               idle_fg="#000000";
             };
           };
         };
         theme="solarized-dark";
         icons="material-nf";
       };
     };
  };
}

{ pkgs, ... }:

{
  config = {
    home-manager.users.richard = { pkgs, ... }: {
      services.wlsunset = {
        enable = true;
        latitude = "50.733334";
        longitude = "7.100000";
        temperature.day = 6500;
        temperature.night = 4500;
      };
    };
  };
}

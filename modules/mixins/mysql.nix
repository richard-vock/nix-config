{ lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    mariadb
  ];
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };
}

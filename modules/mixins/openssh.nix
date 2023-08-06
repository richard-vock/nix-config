{ lib, ... }:
{
  services.openssh = {
    enable = true;
    ports = [ 55522 ];
    openFirewall = lib.mkForce true;
    settings = {
      PasswordAuthentication = false;
      # PermitRootLogin = lib.mkForce "no";
    };
  };
}

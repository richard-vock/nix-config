{ config, inputs, ... }:
let
  keys = inputs.self.nixosModules.ssot-keys;
in
{
  age.secrets.user_richard.file = ../../secrets/user_richard.age;
  nix.settings.trusted-users = [ "richard" ];
  users.users.richard = {
    isNormalUser = true;
    hashedPasswordFile = config.age.secrets.user_richard.path;
    extraGroups = [
      "wheel"
      "dialout"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBOipqKXXn3zmGmkXTucbZH3JDuJB+99G6hRByUuZvnk rvock@mailbox.org"
    ];
  };
}

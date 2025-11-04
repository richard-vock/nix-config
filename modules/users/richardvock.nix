{ config, inputs, ... }:
let
  keys = inputs.self.nixosModules.ssot-keys;
in
{
  age.secrets.user_richard.file = ../../secrets/user_richard.age;
  age.secrets."id_ed25519_main" = {
    file = ../../secrets/id_ed25519_main.age;
    path = "/home/richard/.ssh/id_ed25519_main";
    owner = "richard";
    group = "users";
    mode = "0600";
  };
  age.secrets."id_ed25519_main.pub" = {
    file = ../../secrets/id_ed25519_main.pub.age;
    path = "/home/richard/.ssh/id_ed25519_main.pub";
    owner = "richard";
    group = "users";
    mode = "0644";
  };

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

{ config, inputs, ... }:
let
  keys = inputs.self.nixosModules.ssot-keys;
in
{
  nix.settings.trusted-users = [ "richard" ];
  users.users.richard = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "dialout"
    ];
    openssh.authorizedKeys.keys = keys.richard;
  };
}

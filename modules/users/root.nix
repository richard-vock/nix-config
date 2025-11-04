{ config, ... }:
{
  age.secrets.user_root.file = ../../secrets/user_root.age;
  users.users.hashedPasswordFile = config.age.secrets.user_root.path;
}

{ config, lib, pkgs, ... }:
{
  age.secrets = {
    restic_data.file = ../../secrets/restic_data.age;
    restic_data.owner = "richard";
    restic_data_env.file = ../../secrets/restic_data_env.age;
    restic_data_env.owner = "richard";
    restic_data_bucket.file = ../../secrets/restic_data_bucket.age;
    restic_data_bucket.owner = "richard";
  };
  services.restic.backups = {
    data = {
      initialize = true;
      passwordFile = config.age.secrets.restic_data.path;
      environmentFile = config.age.secrets.restic_data_env.path;
      repositoryFile = config.age.secrets.restic_data_bucket.path;
      paths = [
        "/data"
      ];
      user = "richard";
      pruneOpts = [
        "--keep-daily 7"
        "--keep-weekly 5"
        "--keep-monthly 12"
      ];
    };
  };
}

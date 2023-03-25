{ pkgs, config, lib, ... }:
{
  networking.hostId = "235f593c";
  boot = {
    supportedFilesystems = [ "btrfs" ];
    initrd = {
      luks.devices."root" = {
        device = "/dev/disk/by-uuid/665a078b-7c0c-49a6-8ad2-28c420a76551";
        # Allow trim on SSD
        allowDiscards = true;
      };
    };
  };
}

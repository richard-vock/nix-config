{
    fileSystems."/" = {
        device = "/dev/disk/by-uuid/9306183c-5723-422c-8a9d-41111f8f7c5d";
        fsType = "btrfs";
        options = [ "subvol=root" "compress=zstd" "noatime" ];
    };

    boot.initrd.luks.devices."root".device = "/dev/disk/by-uuid/665a078b-7c0c-49a6-8ad2-28c420a76551";

    fileSystems."/home" = {
        device = "/dev/disk/by-uuid/9306183c-5723-422c-8a9d-41111f8f7c5d";
        fsType = "btrfs";
        options = [ "subvol=home" "compress=zstd" "noatime" ];
      };

    fileSystems."/nix" = {
        device = "/dev/disk/by-uuid/9306183c-5723-422c-8a9d-41111f8f7c5d";
        fsType = "btrfs";
        options = [ "subvol=nix" "compress=zstd" "noatime" ];
    };

    fileSystems."/var/log" = {
        device = "/dev/disk/by-uuid/9306183c-5723-422c-8a9d-41111f8f7c5d";
        fsType = "btrfs";
        options = [ "subvol=log" "compress=zstd" "noatime" ];
        neededForBoot = true;
    };

    fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/D576-89A6";
        fsType = "vfat";
    };

    swapDevices = [ ];
}

{
    fileSystems."/" = {
        device = "/dev/disk/by-uuid/d592e3e6-4edb-453a-9b54-611876f18706";
        fsType = "btrfs";
        options = [ "subvol=root" "compress=zstd" "noatime" ];
    };

    boot.initrd.luks.devices."root".device = "/dev/disk/by-uuid/665a078b-7c0c-49a6-8ad2-28c420a76551";

    fileSystems."/home" = {
        device = "/dev/disk/by-uuid/d592e3e6-4edb-453a-9b54-611876f18706";
        fsType = "btrfs";
        options = [ "subvol=home" "compress=zstd" "noatime" ];
      };

    fileSystems."/nix" = {
        device = "/dev/disk/by-uuid/d592e3e6-4edb-453a-9b54-611876f18706";
        fsType = "btrfs";
        options = [ "subvol=nix" "compress=zstd" "noatime" ];
    };

    fileSystems."/persist" = {
        device = "/dev/disk/by-uuid/d592e3e6-4edb-453a-9b54-611876f18706";
        fsType = "btrfs";
        options = [ "subvol=persist" "compress=zstd" "noatime" ];
    };

    fileSystems."/var/log" = {
        device = "/dev/disk/by-uuid/d592e3e6-4edb-453a-9b54-611876f18706";
        fsType = "btrfs";
        options = [ "subvol=log" "compress=zstd" "noatime" ];
        neededForBoot = true;
    };

    fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/BC36-1CAB";
        fsType = "vfat";
    };

    swapDevices = [ ];
}

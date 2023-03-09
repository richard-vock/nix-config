{
    fileSystems."/" = {
        device = "/dev/disk/by-uuid/b190fd5d-a213-47fc-a3ec-0c69ad6d9641";
        fsType = "btrfs";
        options = [ "subvol=root" "compress=zstd" ];
    };

    fileSystems."/home" = {
        device = "/dev/disk/by-uuid/b190fd5d-a213-47fc-a3ec-0c69ad6d9641";
        fsType = "btrfs";
        options = [ "subvol=home" "compress=zstd" ];
    };

    fileSystems."/nix" = {
        device = "/dev/disk/by-uuid/b190fd5d-a213-47fc-a3ec-0c69ad6d9641";
        fsType = "btrfs";
        options = [ "subvol=nix" "compress=zstd" "noatime" ];
    };

    swapDevices = [ ];
}

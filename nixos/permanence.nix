{inputs, pkgs, ...}: {
    imports = [
        inputs.impermanence.nixosModule
    ];

    environment.persistence."/persist" = {
        hideMounts = true;
        directories = [
            "/var/lib/systemd/coredump"
            "/var/lib/nixos"
            "/etc/NetworkManager/system-connections"
        ];
        files = [
            "/etc/machine-id"
            "/etc/adjtime"
            "/etc/ssh/ssh_host_rsa_key"
            "/etc/ssh/ssh_host_rsa_key.pub"
            "/etc/ssh/ssh_host_ed25519_key"
            "/etc/ssh/ssh_host_ed25519_key.pub"
            "/var/lib/NetworkManager/timestamps"
            { file = "/etc/nix/id_rsa"; parentDirectory = { mode = "u=rwx,g=,o="; }; }
        ];
    };

    security.sudo.extraConfig = ''
        # don't lecture on first use after each boot
        Defaults lecture = never
    '';

    boot.initrd.postDeviceCommands = pkgs.lib.mkBefore ''
        mkdir -p /mnt

        mount -o subvol=/ /dev/mapper/root /mnt

        btrfs subvolume list -o /mnt/root |
        cut -f9 -d' ' |
        while read subvolume; do
          echo "deleting /$subvolume subvolume..."
          btrfs subvolume delete "/mnt/$subvolume"
        done &&
        echo "deleting /root subvolume..." &&
        btrfs subvolume delete /mnt/root

        echo "restoring blank /root subvolume..."
        btrfs subvolume snapshot /mnt/root-blank /mnt/root

        btrfs subvolume list -o /mnt/home |
        cut -f9 -d' ' |
        while read subvolume; do
          echo "deleting /$subvolume subvolume..."
          btrfs subvolume delete "/mnt/$subvolume"
        done &&
        echo "deleting /home subvolume..." &&
        btrfs subvolume delete /mnt/home

        echo "restoring blank /home subvolume..."
        btrfs subvolume snapshot /mnt/home-blank /mnt/home

        umount /mnt
    '';
}

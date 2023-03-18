{
    boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-intel" ];
    boot.blacklistedKernelModules = ["nouveau"];
    boot.extraModulePackages = [ ];
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.systemd-boot.consoleMode = "max";

    boot.initrd.luks.devices."root".device = "/dev/disk/by-uuid/665a078b-7c0c-49a6-8ad2-28c420a76551";
}

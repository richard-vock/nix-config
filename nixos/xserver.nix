{ config, ...}: {
    hardware.opengl.enable = true;
    hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
    hardware.nvidia.modesetting.enable = true;
    services.xserver = {
        enable = true;

        # hardware
        videoDrivers = [ "nvidia" ];

        # wm
        windowManager.i3.enable = true;

        # input
        layout = "us";
        xkbOptions = "eurosign:e,caps:escape";
        xkbVariant = "intl";
    };
}

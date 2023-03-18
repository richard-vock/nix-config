{
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

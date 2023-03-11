{ lib, ... }: {
    networking.useDHCP = lib.mkDefault true;
    # networking.interfaces.enp5s0.useDHCP = lib.mkDefault true;
    # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;
    networking.hostName = "home";
    networking.networkmanager.enable = true;

    networking.firewall.enable = false;

    services.openssh.enable = true;
    services.openssh.ports = [ 55522 ];
    services.openssh.permitRootLogin = "no";
}

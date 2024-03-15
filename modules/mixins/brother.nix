{ lib, pkgs, ... }:
{
    services.printing = {
        enable = true;
        drivers = [ pkgs.brlaser pkgs.brgenml1lpr pkgs.brgenml1cupswrapper  ];
    };
    services.avahi = {
        enable = true;
        nssmdns = true;
        openFirewall = true;
    };
}

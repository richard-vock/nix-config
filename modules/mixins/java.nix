{ lib, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        gradle
    ];
}

{ lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    qemu
  ];
}

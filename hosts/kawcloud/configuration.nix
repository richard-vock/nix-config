{ config, lib, pkgs, inputs, ... }:

with config.lib.stylix.colors.withHashtag;

{
  imports = with inputs.self.nixosModules; [
    ./hardware-configuration.nix
    profiles-base
    users-richardvock
  ];

  nixpkgs.config.allowUnfree = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users = import "${inputs.self}/users";
    extraSpecialArgs = {
      inherit inputs;
      headless = true;
    };
  };

  stylix.image = ../../assets/black_bg.png;
  stylix.base16Scheme = "${inputs.base16-schemes}/ayu-dark.yaml";

  nix = {
    # From flake-utils-plus
    generateNixPathFromInputs = true;
    generateRegistryFromInputs = true;
    linkInputs = true;
  };

  networking = {
    firewall = {
      allowedTCPPorts = [ 55522 ];
      allowedUDPPorts = [ 55522 ];
    };
    hostName = "sync";
    networkmanager.enable = true;
    useDHCP = false;
    interfaces = {
      "eth0".useDHCP = true;
    };
    extraHosts = ''
    '';
  };

  services = {
    logind.killUserProcesses = true;
  };

  boot.cleanTmpDir = true;
  zramSwap.enable = true;

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  users.users.root.openssh.authorizedKeys.keys = [
    ''ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDHPBj2LARlTzFKHC0EohVEwQ+OctYSZkNGVwWdyhPOOWS/Ie9D/g5jZP9iym1SOVh4M/JHtpldeUIOJ2wcLvJkDC/Ijef4HYicBF86UGkWDLo+liYbKNRG+dOfncM4q51FuNjNz9j7W0tYxYBvVlkgB2+6G/Gp/ys9TMlcOvI22ChTetSRcmZ95KZdTDXoMe4NiyqddJE0GDNExPgvxbaNe7J2vmrh/heTlufFzu0W1PmTuMDNEq4whJ/DQEJbYOvXjK5qxlbu8Rl/j+zKJoj0bg9LPSAxloBEJ7VaGkmH2YxMHB7dijRNkuR28i8MvBFV4L6Jxi5PBVPk7yjuySD5 slim@hastromil-2013-06-11''
  ];

  time.timeZone = "Europe/Berlin";

  system.stateVersion = "23.11";
}


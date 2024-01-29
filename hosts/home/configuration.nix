{ config, lib, pkgs, inputs, ... }:

with config.lib.stylix.colors.withHashtag;

{
  imports = with inputs.self.nixosModules; [
    ./disks.nix
    ./hardware-configuration.nix
    profiles-base
    profiles-desktop
    users-richardvock
    mixins-obs
    mixins-v4l2loopback
    mixins-docker
    mixins-steam
    mixins-mysql
    mixins-nodejs
  ];

  nixpkgs.config.allowUnfree = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users = import "${inputs.self}/users";
    extraSpecialArgs = {
      inherit inputs;
      headless = false;
    };
  };

  stylix.image = ../../assets/black_bg.png;
  stylix.base16Scheme = "${inputs.base16-schemes}/ayu-dark.yaml";

  users.users.richard.extraGroups = [ "video" ];

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
    hostName = "home";
    networkmanager.enable = true;
    useDHCP = false;
    interfaces = {
      "enp5s0".useDHCP = true;
    };
    extraHosts = ''
      10.0.50.142      gixel-ka-05
      10.0.50.162      gixel-ka-01
      10.0.50.202      gixel-dgx-01
      10.0.50.63       gixel-dome-01
      10.0.50.65       gixel-ka-02
      10.0.50.68       gixel-ka-07
      10.0.50.70       gixel-ka-06
      10.0.50.85       gixel-ka-04
      10.0.50.95       gixel-ka-03
      10.1.50.176      gixel-bon-01
      10.1.50.42       gixel-bon-02
      10.1.50.81       gixel-bon-04
      10.1.50.94       gixel-bon-03
    '';
  };

  services.syncthing = {
    enable = true;
    user = "richard";
    dataDir = "/data";
    configDir = "/data/.config/syncthing";
    overrideDevices = true;
    settings.devices = {
      "sync" = { id = "2SLDIR7-EXPR4LU-QPA7EPX-HVIJREX-6C4KX2P-XW6SKKB-OCMPRYN-O7SIZQK"; };
    };
  };

  services = {
    logind.killUserProcesses = true;
  };

  boot = {
    blacklistedKernelModules = ["nouveau"];
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
        consoleMode = "max";
      };
      efi = {
        canTouchEfiVariables = true;
      };
      timeout = 3000;
    };
  };

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  time.timeZone = "Europe/Berlin";

  hardware = {
    opengl.enable = true;
    nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
    nvidia.modesetting.enable = true;
  };
  services.xserver.videoDrivers = [ "nvidia" ];

  system.stateVersion = "22.11";
}


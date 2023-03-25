{ config, lib, pkgs, inputs, ... }:

with config.lib.stylix.colors.withHashtag;

{
  imports = with inputs.self.nixosModules; [
    ./disks.nix
    ./hardware-configuration.nix
    users-richardvock
    profiles-i3
    profiles-pipewire
    mixins-obs
    mixins-v4l2loopback
    mixins-common
    mixins-i3status
    mixins-fonts
    mixins-bluetooth
    mixins-openssh
    editor-nvim
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

  #stylix.image = ./wallpaper.jpg;
  stylix.image = pkgs.fetchurl {
    url = "https://www.pixelstalk.net/wp-content/uploads/2016/07/Cyberpunk-Desktop-Images.jpg";
    sha256 = "42278b15cd3a21bea5ce67f51732ef87ee191fd05ae9c37840cf041a48ee2d48";
  };
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

  environment.systemPackages = with pkgs; [
    wget
    vim
    tmux
    gnumake
    btop
    git
    inputs.agenix.formatter.x86_64-linux
  ];

  system.stateVersion = "22.11";
}


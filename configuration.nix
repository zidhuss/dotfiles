{
  pkgs,
  nixpkgs,
  lib,
  ...
}: {
  users.users."abry" = {
    home = "/Users/abry";
    uid = 501;
    shell = pkgs.fish;
  };
  users.knownUsers = ["abry"];
  system.primaryUser = "abry";

  system.defaults = {
    menuExtraClock = {
      Show24Hour = true;
      ShowAMPM = false;
    };

    NSGlobalDomain = {
      AppleInterfaceStyleSwitchesAutomatically = true;
      AppleICUForce24HourTime = true;
      AppleMeasurementUnits = "Centimeters";
      AppleMetricUnits = 1;
      AppleTemperatureUnit = "Celsius";
      InitialKeyRepeat = 25;
      KeyRepeat = 5;
    };

    dock = {
      autohide = true;
      tilesize = 66;
      largesize = 99;
      magnification = true;
      show-recents = false;
      expose-group-apps = true;
      wvous-br-corner = 11;
    };

    finder = {
      FXDefaultSearchScope = "SCcf";
      CreateDesktop = false;
    };

    WindowManager = {
      AppWindowGroupingBehavior = true;
      EnableTiledWindowMargins = false;
    };

    trackpad = {
      Clicking = false;
      Dragging = false;
      TrackpadRightClick = true;
      TrackpadThreeFingerDrag = false;
    };
  };

  environment.systemPackages = with pkgs; [
    curl
    imagemagick
    wezterm
    nh
  ];

  # Flake pinning
  nix.registry.nixpkgs.flake = nixpkgs;

  programs.zsh.enable = true;
  programs.fish.enable = true;
  security.pam.services.sudo_local = {
    touchIdAuth = true;
    watchIdAuth = true;
  };

  nixpkgs.hostPlatform = "aarch64-darwin";

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "claude-code"
    ];

  programs.ssh.knownHosts = {
    nixbuild = {
      hostNames = ["eu.nixbuild.net"];
      publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPIQCZc54poJ8vqawd8TraNryQeJnvH1eLpIDgbiqymM";
    };
  };

  nix = {
    enable = true;
    distributedBuilds = true;
    buildMachines = [
      {
        hostName = "nickel";
        protocol = "ssh-ng";
        sshUser = "root";
        systems = ["aarch64-linux"];
        maxJobs = 8;
        speedFactor = 2;
        supportedFeatures = ["big-parallel"];
      }
      {
        hostName = "eu.nixbuild.net";
        systems = [
          "x86_64-linux"
          "aarch64-linux"
          "armv7l-linux"
        ];
        maxJobs = 100;
        supportedFeatures = ["benchmark" "big-parallel"];
      }
    ];

    settings = {
      experimental-features = "nix-command flakes";
      trusted-users = ["@admin"];
      substituters = ["ssh://eu.nixbuild.net"];
      trusted-public-keys = ["nixbuild.net/WA6DCE-1:QJWjvXvACfwkrqte0z4IL0B9ZXZMmaQgmCEmmjScUGM="];
      builders-use-substitutes = true;
    };
  };

  system.stateVersion = 5;
}

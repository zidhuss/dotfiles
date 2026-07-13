{
  config,
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
    attic-client
    curl
    imagemagick
    wezterm
    nh
    sops
  ];

  # Flake pinning
  nix.registry.nixpkgs.flake = nixpkgs;

  sops = {
    age.sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
    defaultSopsFile = ./secrets.yaml;
    secrets."attic/token" = {
      owner = "abry";
    };
    templates."nix-attic-netrc".content = ''
      machine attic.zidhuss.tech password ${config.sops.placeholder."attic/token"}
    '';
  };

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
    ];

    settings = {
      experimental-features = "nix-command flakes";
      trusted-users = ["@admin"];
      substituters = [
        "https://attic.zidhuss.tech/zidhuss"
      ];
      trusted-public-keys = [
        "zidhuss:VD+JftXXvyvnIzY1xdnxwAZhNaGnaYpMwDaFzb88g5M="
      ];
      netrc-file = config.sops.templates."nix-attic-netrc".path;
      builders-use-substitutes = true;
    };
  };

  system.stateVersion = 5;
}

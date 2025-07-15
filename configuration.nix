{
  pkgs,
  nixpkgs,
  lib,
  ...
}: {
  users.users."abry" = {
    home = "/Users/abry";
  };

  environment.systemPackages = with pkgs; [
    curlHTTP3
    imagemagick
    wezterm
    nh
  ];

  # Flake pinning
  nix.registry.nixpkgs.flake = nixpkgs;

  programs.zsh.enable = true;
  programs.fish.enable = true;
  security.pam.services.sudo_local.touchIdAuth = true;

  nixpkgs.hostPlatform = "aarch64-darwin";

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "copilot-language-server"
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

  ids.gids.nixbld = 30000;
  system.stateVersion = 5;
}

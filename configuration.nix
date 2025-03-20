{
  pkgs,
  nixpkgs,
  ...
}: {
  users.users."abry" = {
    home = "/Users/abry";
  };
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    curlHTTP3
    imagemagick
    wezterm
  ];

  services.nix-daemon.enable = true;

  # Flake pinning
  nix.registry.nixpkgs.flake = nixpkgs;

  programs.zsh.enable = true;
  programs.fish.enable = true;
  security.pam.enableSudoTouchIdAuth = true;

  nixpkgs.hostPlatform = "aarch64-darwin";

  programs.ssh.knownHosts = {
    nixbuild = {
      hostNames = ["eu.nixbuild.net"];
      publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPIQCZc54poJ8vqawd8TraNryQeJnvH1eLpIDgbiqymM";
    };
  };

  nix = {
    distributedBuilds = true;
    buildMachines = [
      {
        hostName = "eu.nixbuild.net";
        system = "x86_64-linux";
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

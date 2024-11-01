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

  # # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;
  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Flake pinning
  nix.registry.nixpkgs.flake = nixpkgs;

  # Allow building linux packages on darwin.
  nix.linux-builder.enable = true;
  nix.settings.trusted-users = ["@admin"];
  nix.settings.substituters = ["ssh://eu.nixbuild.net"];
  nix.settings.trusted-public-keys = ["nixbuild.net/WA6DCE-1:QJWjvXvACfwkrqte0z4IL0B9ZXZMmaQgmCEmmjScUGM="];

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
  };

  system.stateVersion = 5;
}

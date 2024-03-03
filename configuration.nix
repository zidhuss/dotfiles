{pkgs, ...}: {
  users.users."abry" = {
    home = "/Users/abry";
  };
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    nodejs_21
  ];

  # # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;
  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  programs.zsh.enable = true;
  programs.fish.enable = true;
  security.pam.enableSudoTouchIdAuth = true;

  nixpkgs.hostPlatform = "aarch64-darwin";
}
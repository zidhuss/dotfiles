{pkgs, ...}: {
  users.users."abry" = {
    home = "/Users/abry";
  };
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    nodejs_21
    curlHTTP3
    mosh
  ];

  # # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;
  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Allow building linux packages on darwin.
  nix.linux-builder.enable = true;
  nix.settings.trusted-users = ["@admin"];

  programs.zsh.enable = true;
  programs.fish.enable = true;
  security.pam.enableSudoTouchIdAuth = true;

  nixpkgs.hostPlatform = "aarch64-darwin";
}

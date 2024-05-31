{
  description = "Nix config for my machines";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = inputs @ {
    nix-darwin,
    home-manager,
    ...
  }: let
    overlays = [
      inputs.neovim-nightly-overlay.overlays.default
    ];
  in {
    darwinConfigurations."Husseins-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      modules = [
        ./configuration.nix
        home-manager.darwinModules.home-manager
        {
          users.users."abry" = {
            home = "/Users/abry";
          };

          nixpkgs.overlays = overlays;

          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users."abry" = import ./home.nix;
        }
      ];
    };
  };
}

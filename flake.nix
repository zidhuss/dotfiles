{
  description = "Nix config for my machines";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    starship-jj = {
      url = "gitlab:lanastara_foss/starship-jj";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fonts = {
      url = "git+ssh://git@github.com/zidhuss/fonts.git";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nix-darwin,
    home-manager,
    nixpkgs,
    ...
  }: let
    overlays = [
      inputs.neovim-nightly-overlay.overlays.default
      inputs.starship-jj.overlays.default
    ];

    sharedModules = [
      ./configuration.nix
      home-manager.darwinModules.home-manager
      ({
        pkgs,
        ...
      }: {
        users.users."abry" = {
          home = "/Users/abry";
        };

        nixpkgs.overlays = overlays;

        fonts.packages = [
          inputs.fonts.packages.${pkgs.stdenv.hostPlatform.system}.all
        ];

        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users."abry" = import ./home.nix;
      })
    ];
  in {
    darwinConfigurations."Husseins-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      modules =
        sharedModules
        ++ [
          {
            ids.gids.nixbld = 30000;
          }
        ];
      specialArgs = {
        inherit nixpkgs;
      };
    };

    darwinConfigurations."Husseins-M4" = nix-darwin.lib.darwinSystem {
      modules = sharedModules;
      specialArgs = {
        inherit nixpkgs;
      };
    };
  };
}

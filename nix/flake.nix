{
  description = "Nix configuration for Darwin and Linux";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    yazi-flavor = {
      url = "github:yazi-rs/flavors";
      flake = false;
    };

    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, yazi-flavor, nix-homebrew, ... }:
  let

    darwinSystem = "aarch64-darwin";
    linuxSystem = "aarch64-linux";

    darwinPkgs = nixpkgs.legacyPackages.${darwinSystem};
    linuxPkgs = nixpkgs.legacyPackages.${linuxSystem};

  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#kevmbp
    darwinConfigurations."kevmbp" = nix-darwin.lib.darwinSystem {
      specialArgs = { inherit self; };
      modules = [ 
        ./darwin
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            # Install Homebrew under the default prefix
            enable = true;

            # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
            enableRosetta = true;

            # User owning the Homebrew prefix
            user = "kevin";
          };
        }
      ];
    };

    # Home-manager configurations
    homeConfigurations = {
      # Darwin config
      "kevin@darwin" = home-manager.lib.homeManagerConfiguration {
        pkgs = darwinPkgs;
        modules = [ ./home-manager/darwin ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = { inherit yazi-flavor; };
      };

      # Linux config
      "kevin@linux" = home-manager.lib.homeManagerConfiguration {
        pkgs = linuxPkgs;
        modules = [ ./home-manager/linux ];
        extraSpecialArgs = { inherit yazi-flavor; };
      };

      # Server config
      "kevin@server" = home-manager.lib.homeManagerConfiguration {
        pkgs = linuxPkgs;
        modules = [ ./home-manager/server ];
        extraSpecialArgs = { inherit yazi-flavor; };
      };

    };
  };
}

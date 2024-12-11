{
  description = "nix-darwin system flake";

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

    system = "aarch64-darwin";
    pkgs = nixpkgs.legacyPackages.${system};

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

    homeConfigurations."kevin" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      # Specify your home configuration modules here, for example,
      # the path to your home.nix.
      modules = [ 
        ./home-manager 
      ];

      extraSpecialArgs = {
        inherit yazi-flavor;
      };

      # Optionally use extraSpecialArgs
      # to pass through arguments to home.nix
    };
  };
}

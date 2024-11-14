{
  description = "Nix-Darwin configurationi flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";

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
    
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager, yazi-flavor, nix-homebrew }:
  let
    platform = "aarch64-darwin";
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = with pkgs; [ 

      ];
      
      # Hombrew 
      homebrew = {
        enable = true;

        taps = [ "FelixKratz/formulae" ];
        brews = [ 
          "borders"
          "switchaudio-osx" # Sketchybar
          "nowplaying-cli"  # Sketchybar
          "pngpaste"
          "luarocks"
          "lua"
          "sketchybar"  
          "ghex"
        ];
        casks = [ 
          "nikitabobko/tap/aerospace"
          "arc"
          "sf-symbols"   # Sketchybar
          "font-sf-mono" # Sketchybar
          "font-sf-pro"  # Sketchybar
          "ollama"
          "imhex"
          "docker"
          "zoho-mail"
          "jetbrains-toolbox"
          "utm"
          "nextcloud"
          "karabiner-elements"
          "chatgpt"
          "cleanshot"
          "discord"
          "logi-options+"
          "marta"
          "obsidian"
          "raycast"
          "slack"
          "spotify"
          "wezterm@nightly"
        ];
        masApps = {
          "WhatsApp" = 310633997;
          "Tailscale" = 1475387142;
        };
        # Dictates what happens to formulae installed by Homebrew that aren't present in the this file.
        onActivation = {
          # cleanup = "zap";
          autoUpdate = true;
          upgrade = true;
        };

      };

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      # When adding a new shell, always enable the shell system-wide, 
      # even if it's already enabled in your Home Manager configuration,
      # otherwise it won't source the necessary files.
      # source https://nixos.wiki/wiki/Command_Shell
      programs.zsh.enable = true;
      programs.fish.enable = true;

      # Add Fish as a valid login shell on the system.
      environment.shells = [ pkgs.fish ];


      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system = {
        startup.chime = false;
        stateVersion = 5;
        defaults = {
          WindowManager.EnableStandardClickToShowDesktop = false;
          dock = {
            wvous-br-corner = 1;
            autohide = true;
            show-recents = false;
          # dock.mru-spaces = false;
            persistent-apps = [
              "/Applications/WezTerm.app"
              "/Applications/Arc.app"
            ];
            persistent-others = [];
          };

          NSGlobalDomain = {
            AppleInterfaceStyle = "Dark";
            KeyRepeat = 1;
            InitialKeyRepeat = 20;
            _HIHideMenuBar = true;
            "com.apple.trackpad.scaling" = 2.6;
          };

          finder = {
            AppleShowAllExtensions = true;
            ShowPathbar = true;
          };

          # screencapture.location = "~/Pictures/screenshots";
          screensaver.askForPasswordDelay = 1;

          trackpad = {
            Clicking = true;  # enable tap to click
            TrackpadRightClick = true;  # enable two finger right click
            TrackpadThreeFingerDrag = true;  # enable three finger drag
          };
        };
      };

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = platform;

      # Get Zsh completion for system packages 
      environment.pathsToLink = [ "/share/zsh/" "share/fish" ];

      security.pam.enableSudoTouchIdAuth = true;
      
    };
    pkgs = nixpkgs.legacyPackages.${platform};
  in
  {
   # Build darwin flake using:
    # $ darwin-rebuild build --flake .#kevmbp
    darwinConfigurations."kevmbp" = nix-darwin.lib.darwinSystem {
      modules = [ 
        configuration
        nix-homebrew.darwinModules.nix-homebrew {
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

    homeConfigurations = {
      kevin = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ 
          ./home.nix 
          {
            # Make yazi-flavor available in home.nix
            _module.args.yazi-flavor = inputs.yazi-flavor;
          }
        ];
      };
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."kevmbp".pkgs;
  };
}

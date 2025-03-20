{ pkgs, self, ... }: {

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [ 
    gnumake
    bws
  ];

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";
  
  nix.enable = false;

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog

  system = {
    startup.chime = false;
    stateVersion = 6;
    defaults = {
      trackpad.Clicking = true;
      WindowManager = {
        EnableStandardClickToShowDesktop = false;
        StandardHideDesktopIcons = true;
      };

      # Disable animation when switching screens or opening apps
      universalaccess.reduceMotion = true;

      dock = {
        orientation = "right";
        wvous-br-corner = 1;
        autohide = true;
        show-recents = false;
        mru-spaces = false;
        persistent-apps = [
          "/Applications/WezTerm.app"
          "/Applications/Ghostty.app"
          "/Applications/Arc.app"
        ];
        persistent-others = [];
      };

      NSGlobalDomain = {
        _HIHideMenuBar = true;
        InitialKeyRepeat = 15;
        KeyRepeat = 1;
        "com.apple.trackpad.scaling" = 2.6;
        AppleEnableSwipeNavigateWithScrolls = true;
      };

      finder = {
        AppleShowAllExtensions = true;
        ShowPathbar = true;
      };

      # screencapture.location = "~/Pictures/screenshots";
      screensaver.askForPasswordDelay = 1;

    };
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  nixpkgs.config.allowUnfree = true;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}

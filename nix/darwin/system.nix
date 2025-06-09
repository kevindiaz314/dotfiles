{ pkgs, self, darwinSystem, ... }: {

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [ 
  ];

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";
  
  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog

  system = {
    primaryUser = "kevin";
    startup.chime = false;
    stateVersion = 6;
    defaults = {
      trackpad.Clicking = true;
      universalaccess.reduceMotion = true;
      WindowManager = {
        EnableStandardClickToShowDesktop = false;
        StandardHideDesktopIcons = true;
      };

      dock = {
        orientation = "right";
        wvous-br-corner = 1;
        autohide = true;
        show-recents = false;
        mru-spaces = false;
        persistent-apps = [
          "/Applications/Ghostty.app"
          "/Applications/Zen.app"
        ];
        persistent-others = [];
      };

      NSGlobalDomain = {
        _HIHideMenuBar = true;
        InitialKeyRepeat = 15;
        KeyRepeat = 1;
        "com.apple.trackpad.scaling" = 2.6;
        AppleEnableSwipeNavigateWithScrolls = true;
        NSAutomaticWindowAnimationsEnabled = false;
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
  nixpkgs.hostPlatform = darwinSystem;
}

{ pkgs, self, ... }: {

  homebrew = {
    enable = true;

    # Dictates what happens to formulae installed by Homebrew that aren't present in the this file.
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "uninstall";
    };

    # Homebrew taps
    taps = [
      "FelixKratz/formulae"
      "koekeishiya/formulae"
    ];
    
    # Homebrew packages
    brews = [
      # CLI tools
      "atuin"         # Shell history
      "bat"           # Cat with syntax highlighting
      "btop"          # System monitor
      "chezmoi"       # Dotfiles manager
      "eza"           # ls replacement
      "fastfetch"     # System info
      "fd"            # Find replacement
      "fish"          # Shell
      "fzf"           # Fuzzy finder
      "git"           # Version control
      "git-filter-repo" # Git history filtering
      "iperf3"        # Network speed test
      "lazygit"       # Git TUI
      "oh-my-posh"    # Prompt customization
      "ripgrep"       # Grep replacement
      "sevenzip"      # Archive utility
      "superfile"     # File manager
      "wget"          # Download utility
      "yazi"          # File manager
      "zellij"        # Terminal multiplexer
      "zoxide"        # Directory jumper
      
      # Development
      "gradle"        # Build tool
      "neovim"        # Text editor
      "node"          # JavaScript runtime
      "openjdk"       # Java SDK
      "rustup"        # Rust installer
      
      # macOS UI enhancements
      "borders"       # Window borders
      "sketchybar"    # Menu bar customization
      "switchaudio-osx" # Audio device switcher (for Sketchybar)
      "yabai"         # Window manager
      
      # Commented out
      # "ant"
      # "bitwarden-cli"
    ];

    # Homebrew casks
    casks = [
      # Browsers
      "arc"
      # "zen-browser"
      
      # Development and coding
      "cursor"
      "visual-studio-code"
      "ghostty"
      "kitty"
      
      # Security and networking
      "bitwarden"
      "tailscale"
      "wireshark"
      
      # Productivity and organization
      "cleanshot"
      "itsycal"
      "obsidian"
      "raycast"
      "hammerspoon"
      # "todoist"
      # "chatgpt"
      "claude"
      "leader-key"
      "keyclu"
      
      # File management and sync
      "forklift"
      "nextcloud"
      "syncthing"

      # Communication
      "discord"
      "slack"
      "whatsapp"
      "spotify"
      
      # System utilities
      "MonitorControl"
      "karabiner-elements"
      "duet"
      "balenaetcher"
      "localsend"
      # "zoho-mail"
      # "jetbrains-toolbox"
      # "utm"
      "logi-options+"
      
      # Fonts and design
      "font-atkinson-hyperlegible"
      "sf-symbols"   # Sketchybar
      "font-sf-mono" # Sketchybar
      "font-sf-pro"  # Sketchybar
    ];

    masApps = {
    };
  };
}

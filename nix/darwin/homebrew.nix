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
      "sevenzip"
      "bitwarden-cli"
      "borders"
      "superfile"
      "switchaudio-osx" # Sketchybar
      "sketchybar"  
      "yabai"
      "ant"
      "neovim"
      "wget"
      "chezmoi"
      "iperf3"
      "git"
      "node"
      "lazygit"
      "atuin"
      "fzf"
      "zellij"
      "fish"
      "fd"
      "zoxide"
      "ripgrep"
      "yazi"
      "oh-my-posh"
      "eza"
      "fastfetch"
      "git-filter-repo"
      "bat"
      "btop"
      "rustup"
      "openjdk"
      "gradle"
    ];

    # Homebrew casks
    casks = [
      "wireshark"
      "font-atkinson-hyperlegible"
      "forklift"
      # "lm-studio"
      "leader-key"
      "todoist"
      "bitwarden"
      "keyclu"
      "claude"
      "localsend"
      "balenaetcher"
      "itsycal"
      "cursor"
      "visual-studio-code@insiders"
      "ghostty"
      "hammerspoon"
      "syncthing"
      "duet"
      "MonitorControl"
      # "nikitabobko/tap/aerospace"
      "arc"
      "zen-browser"
      "sf-symbols"   # Sketchybar
      "font-sf-mono" # Sketchybar
      "font-sf-pro"  # Sketchybar
      # "ollama"
      # "docker"
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
      "whatsapp"
      "tailscale"
    ];

    masApps = {
    };
  };
}

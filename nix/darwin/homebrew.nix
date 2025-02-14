{ config, pkgs, ... }: {
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
    ];
    
    # Homebrew packages
    brews = [
      "bitwarden-cli"
      "borders"
      "switchaudio-osx" # Sketchybar
      "luarocks"
      "lua"
      "sketchybar"  
      "koekeishiya/formulae/yabai"
      "gradle@7"
      "mysql"
    ];

    # Homebrew casks
    casks = [
      "forklift"
      "lm-studio"
      "leader-key"
      "todoist"
      "bitwarden"
      "keyclu"
      "claude"
      "itsycal"
      "cursor"
      "ghostty"
      "hammerspoon"
      "syncthing"
      # "duet"
      "MonitorControl"
      # "nikitabobko/tap/aerospace"
      "arc"
      "sf-symbols"   # Sketchybar
      "font-sf-mono" # Sketchybar
      "font-sf-pro"  # Sketchybar
      # "ollama"
      # "docker"
      "zoho-mail"
      "jetbrains-toolbox"
      # "utm"
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

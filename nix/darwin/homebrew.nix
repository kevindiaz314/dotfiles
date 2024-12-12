{ config, pkgs, ... }: {
  homebrew = {
    enable = true;

    # Dictates what happens to formulae installed by Homebrew that aren't present in the this file.
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };

    # Homebrew taps
    taps = [
      "FelixKratz/formulae"
    ];
    
    # Homebrew packages
    brews = [
      "borders"
      "switchaudio-osx" # Sketchybar
      "nowplaying-cli"  # Sketchybar
      "luarocks"
      "lua"
      "sketchybar"  
    ];

    # Homebrew casks
    casks = [
      "duet"
      "MonitorControl"
      "nikitabobko/tap/aerospace"
      "arc"
      # "visual-studio-code"
      "sf-symbols"   # Sketchybar
      "font-sf-mono" # Sketchybar
      "font-sf-pro"  # Sketchybar
      # "ollama"
      # "docker"
      "zoho-mail"
      # "jetbrains-toolbox"
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
    ];

    masApps = {
      "WhatsApp" = 310633997;
      "Tailscale" = 1475387142;
    };

  };
}

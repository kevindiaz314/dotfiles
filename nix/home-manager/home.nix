{ config, pkgs, yazi-flavor, ... }:

{

  # Enable unfree packages
  nixpkgs.config.allowUnfree = true;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "kevin";
  home.homeDirectory = "/Users/kevin";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?

    # Nerd Fonts
    nerd-fonts.monaspace
    nerd-fonts.iosevka
    nerd-fonts.hack
    nerd-fonts.victor-mono
    nerd-fonts.jetbrains-mono

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

    # ---- For tmux tokyo-night theme ----
    bc coreutils gawk gh glab gnused jq nowplaying-cli

    # jdk22
    chezmoi
    vscode
    cargo
    htop
    kitty
    nodejs_22
    yarn
    sesh
    bat
    eza
    fd
    fzf
    gnumake
    neovim
    ripgrep
    stow
    tmux
    fastfetch
    oh-my-posh

  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/kevin/etc/profile.d/hm-session-vars.sh
  #

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    plugins = [
      {
        name = "F-Sy-H";
        src = pkgs.fetchFromGitHub {
          owner = "z-shell";
          repo = "F-Sy-H";
          rev = "v1.67";
          sha256 = "sha256-zhaXjrNL0amxexbZm4Kr5Y/feq1+2zW0O6eo9iZhmi0=";
        };
      }
    ];
    shellAliases = {
      nvim-lazy = "NVIM_APPNAME=LazyVim nvim";
      nvim-astro = "NVIM_APPNAME=AstroNvim nvim";
      nvim-chad = "NVIM_APPNAME=NvChad nvim";
      iin = "nvim $(fzf --preview 'bat --color=always {}')";
      ff = "fastfetch";
      lsc = "eza -la --no-user --icons --no-time --no-permissions --no-filesize"; # ls clean
      ls = "eza -l";
      n = "nvim";
      lg = "lazygit";
    };
    defaultKeymap = "viins";
    initExtra = ''

      export PATH="/opt/homebrew/bin:$PATH"

      if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then #eval "$(oh-my-posh init zsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/powerlevel10k_rainbow.omp.json')" 
        eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/omp.toml)" 
      fi
      
      # Setup fzf keybindings and fuzzy completion
      source <(fzf --zsh)
      
      nvims() {
        items=("Default" "LazyVim" "AstroNvim" "NvChad")
        config=$(printf "%s\n" "''${items[@]}" | fzf --prompt=" Neovim Config   " --height=~50% --layout=reverse --border --exit-0)
        if [[ -z $config ]]; then
          echo "Nothing selected"
          return 0
        elif [[ $config == "Default" ]]; then
          config=""
        fi
        NVIM_APPNAME=$config nvim "$@"
      }
      
    '';
  };

  # programs.bash.enable = true;

  programs.fish = {
    enable = true;
    functions = {  
      nvims = ''
        set -l items Default LazyVim AstroNvim NvChad
        set -l config (printf "%s\n" $items | fzf --prompt=" Neovim Config   " --height=~50% --layout=reverse --border --exit-0)

        if test -z "$config"
            echo "Nothing selected"
            return 0
        else if test "$config" = Default
            set config ""
        end

        env NVIM_APPNAME=$config nvim $argv
      '';

      iin = ''
        # Select a file with fzf and preview it using bat, then open it in Neovim
        set selected_file (fzf --preview 'bat --style numbers --color always --line-range :300 {}')

        if test -n "$selected_file"
          nvim $selected_file
        end
      '';

    };
      
    shellAliases = {

      # ----- Neovim isolated configurations -----
      nvim-lazy="NVIM_APPNAME=LazyVim nvim";
      nvim-astro="NVIM_APPNAME=AstroNvim nvim";
      nvim-chad="NVIM_APPNAME=NvChad nvim";
      lsc = "eza -la --no-user --icons --no-time --no-permissions --no-filesize"; # ls clean
      ls = "eza -l";
      n = "nvim";
      ff = "fastfetch";
      lg = "lazygit";


    };

    interactiveShellInit = ''

      # Overwrite fish_greeting
      set fish_greeting

      # Initialize Oh My Posh
      oh-my-posh init fish --config ~/.config/ohmyposh/omp.toml | source

      # Set up fzf key bindings
      fzf --fish | source;

    '';
  };

  programs.git = {
    enable = true;
    userEmail = "kevin@kev314.dev";
    userName = "kevindiaz314";
  };

  programs.lazygit = {
    enable = true;
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };

  programs.zellij = {
    enable = true;
  };

  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
    enableZshIntegration = true;
    enableFishIntegration = true;
    settings = {
      manager = {
        show_hidden = true;
      };
    };
    theme = {
      flavor = {
        use = "catppuccin-mocha";
      };
    };
    flavors = {
      catppuccin-mocha = "${yazi-flavor}/catppuccin-mocha.yazi";
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

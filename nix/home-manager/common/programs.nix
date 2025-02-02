{ config, pkgs, yazi-flavor, ... }:

{

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
      lc = "eza -la --no-user --icons --no-time --no-permissions --no-filesize"; # ls clean
      l = "eza --long -bF --icons"; # Extended details with binary sizes and type indicators
      ll = "eza --long -a --icons"; # Long format, including hidden files
      ls = "eza --icons";
      n = "nvim";
      lg = "lazygit";
    };
    defaultKeymap = "viins";
    initExtra = ''

      if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then #eval "$(oh-my-posh init zsh)" 
        eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/omp.json)" 
      fi
      
      # Setup fzf keybindings and fuzzy completion
      source <(fzf --zsh)
      
      nvims() {
        items=("Default" "LazyVim")
        config=$(printf "%s\n" "''${items[@]}" | fzf --prompt=" Neovim Config   " --height=~50% --layout=reverse --border --exit-0)
        if [[ -z $config ]]; then
          echo "Nothing selected"
          return 0
        elif [[ $config == "Default" ]]; then
          config=""
        fi
        NVIM_APPNAME=$config nvim "$@"
      }

      if [[ $(ps -o command= -p "$PPID" | awk '{print $1}') != 'fish' ]]
      then
        exec fish -l
      fi
      
    '';
  };

  # programs.bash.enable = true;

  programs.fish = {
    enable = true;
    functions = {  
      nvims = ''
        set -l items Default LazyVim
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
      lc = "eza -la --no-user --icons --no-time --no-permissions --no-filesize"; # ls clean
      l = "eza --long -bF --icons"; # Extended details with binary sizes and type indicators
      ll = "eza --long -a --icons"; # Long format, including hidden files
      ls = "eza --icons";
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
    extraConfig = {
      init.defaultBranch = "main";
    };
    includes = [
      {
        # Apply college config to any repo inside ~/college/
        condition = "gitdir:~/college/";
        path = config.home.homeDirectory + "/.config/git/.college";
      }
    ];
  };

  # Create the college-specific Git config file
  home.file.".config/git/.college".text = ''
    [user]
      email = "kdiazcac@asu.edu"
      name = "kdiazcac"
    [core]
      sshCommand = "ssh -i ~/.ssh/kdiazcac_ed25519"
  '';
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
        dark = "catppuccin-mocha";
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

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
          sha256 = "0bcsc4kgda577fs3bnvymmxdz3z5mf19pn8ngfqsklabnf79f5nf";
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
      l = "eza --long --total-size -h -bF --icons"; # Extended details with binary sizes and type indicators
      ll = "eza --long --total-size -ha --icons"; # Long format, including hidden files
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

  programs.git = {
    enable = true;
    userEmail = "github@kev314.dev";
    userName = "Kevin Diaz";
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
      name = "Kevin Diaz"
    [core]
      sshCommand = "ssh -i ~/.ssh/kdiazcac_ed25519"
  '';

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

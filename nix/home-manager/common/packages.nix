{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    # Adds the 'hello' command to your environment. It prints a friendly
    # "Hello, world!" when run.
    # pkgs.hello

    # It is sometimes useful to fine-tune packages, for example, by applying
    # overrides. You can do that directly here, just don't forget the
    # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # fonts?

    # You can also create simple shell scripts directly inside your
    # configuration. For example, this adds a command 'my-hello' to your
    # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

    # ---- For tmux tokyo-night theme ----
    # bc coreutils gawk gh glab gnused jq

    # Nerd Fonts
    # nerd-fonts.jetbrains-mono

    atkinson-hyperlegible
    wget
    chezmoi
    cargo
    btop
    nodejs_22
    bat
    eza
    fd
    fzf
    gnumake
    neovim
    ripgrep
    tmux
    fastfetch
    oh-my-posh
    git-filter-repo
    bws
  ];
}

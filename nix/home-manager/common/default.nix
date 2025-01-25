{ config, pkgs, ... }: {
  imports = [
    ./packages.nix
    ./programs.nix
  ];

  home = {
    username = "kevin";
    stateVersion = "24.11";
  };

  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
{ config, pkgs, ... }: {
  imports = [
    ../common
    ../common/desktop.nix
  ];

  home.homeDirectory = "/home/kevin";

  # Linux-specific configurations
  home.packages = with pkgs; [
    playerctl
  ];
}
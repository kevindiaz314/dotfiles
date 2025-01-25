{ config, pkgs, ... }: {
  imports = [
    ../common
    ../common/desktop.nix
  ];

  home.homeDirectory = "/Users/kevin";

  # Darwin-specific configurations
  home.packages = with pkgs; [
    # Darwin-only packages
    nowplaying-cli
  ];
}

{ config, pkgs, ... }: {
  imports = [
    ../common
  ];

  home.homeDirectory = "/home/kevin";

  # Server-specific configurations (CLI-only tools)
  home.packages = with pkgs; [
  ];
}
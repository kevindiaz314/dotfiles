{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    # Development tools common to desktop environments
    gradle_7
    # jdk17
    iperf
    vscode
  ];
}

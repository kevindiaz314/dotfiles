{ config, pkgs, ... }: {
  home.packages = with pkgs; [

    # Packages common to desktop environments
    iperf
    vscode
  ];
}

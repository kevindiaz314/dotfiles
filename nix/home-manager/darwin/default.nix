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

  home.sessionVariables = {
    EDITOR = "nvim";
    JAVA_HOME = "/Library/Java/JavaVirtualMachines/jdk-18.0.2.1.jdk/Contents/Home";
    # JAVA_HOME = "/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home";
    PATH = "/opt/homebrew/bin:/opt/homebrew/sbin:/opt/homebrew/opt/gradle@7/bin:$JAVA_HOME/bin:$PATH";
  };
}

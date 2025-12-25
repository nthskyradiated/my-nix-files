{ config, pkgs, ... }:

{
  home.username = "andy";
  home.homeDirectory = "/home/andy";
  home.stateVersion = "25.11";
  programs.git.enable = true;
  programs.bash = {
    enable = true;
    shellAliases = {
      cat = "bat";
      ls = "eza -l --icons";
      k = "kubectl ";
    };
  };
}

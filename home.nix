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
    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        exec uwsm start -S hyprland-uwsm.desktop
      fi
    '';
  };
}

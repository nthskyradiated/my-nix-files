{ config, pkgs, ... }:

{
  home.username = "andy";
  home.homeDirectory = "/home/andy";
  home.stateVersion = "25.11";
  programs.git.enable = true;
  
  wayland.windowManager.hyprland = {
  enable = true;
  systemd.enable = false;  # Disable since uwsm handles this
    };
  
  programs.bash = {
    enable = true;
    shellAliases = {
      cat = "bat";
      ls = "exa -l --icons";
      k= "kubectl ";
    };
    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
      exec uwsm start hyprland-uwsm.desktop
      fi
    '';
  };
}

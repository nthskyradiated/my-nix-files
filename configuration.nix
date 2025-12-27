{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  services.getty.autologinUser = "andy";

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Oman/Muscat";
  
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };

  users.users.andy = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;
  environment.systemPackages = with pkgs; [
    vim
    neovim
    wget
    ghostty
    waybar
    kitty
    tealdeer
    bat
    eza
    yq
    jq
    librewolf
    kubectl
    go
    nodejs_24
    pnpm
    kubeseal
    kubernetes-helm
    ansible
    k9s
    ripgrep
    fzf
    deno
    python314
    libvirt
    qemu_kvm
    wofi
    btop
    docker
  ];

  fonts.packages = with pkgs; [
  jetbrains-mono
  nerd-fonts.fira-code
  nerd-fonts.caskaydia-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";

}

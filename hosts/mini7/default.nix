{ pkgs, stateVersion, hostname, ... }:

{
  imports = [
    ./modules
    ./hosts/${hostname}/own-modules
    ./hosts/${hostname}/hardware-configuration.nix
  ];

  # Увімкнення експериментальних функцій nix
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Встановлення версії стану системи
  system.stateVersion = stateVersion;

  # Дозвіл на використання unfree пакетів
  nixpkgs.config.allowUnfree = true;

  # Основні пакети системи
  environment.systemPackages = with pkgs; [
    home-manager
    ntfs3g
    exfatprogs
  ];

  # Налаштування xdg-portal для Hyprland
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-wlr
    ];
  };

  # Docker налаштування
  virtualisation.docker = {
    enable = true;
  };
}
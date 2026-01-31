{ config, pkgs, stateVersion, ... }:

{
  imports = [
    ./modules
    ./pkgs
  ];

  # Увімкнення експериментальних функцій nix
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Встановлення версії стану системи
  system.stateVersion = stateVersion;

  # Дозвіл на використання unfree пакетів
  nixpkgs.config.allowUnfree = true;

  # Налаштування xdg-portal для Hyprland
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
    config = {
      # hyprland.preferred = [ "hyprland" "gtk" ];
      common.default = "*";
    };
  };
}
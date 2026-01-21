let
  modulesPath = ./modules;
  pkgsPath = ./pkgs;
in
{
  imports = [
    "${modulesPath}/boot.nix"
    "${modulesPath}/hardware.nix"
    "${modulesPath}/homemanager.nix"
    "${modulesPath}/network.nix"
    "${modulesPath}/programs.nix"
    "${modulesPath}/services.nix"
    "${modulesPath}/timezone.nix"
    "${modulesPath}/user.nix"

    "${pkgsPath}/developer.nix"
    "${pkgsPath}/fonts.nix"
    "${pkgsPath}/shell.nix"
    "${pkgsPath}/utils.nix"
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
}
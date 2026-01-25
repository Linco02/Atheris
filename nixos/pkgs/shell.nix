{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Головні пакети для робочого середовища Hyprland
    xwayland
    hyprland
    hyprlock
    waybar
    xdg-desktop-portal
    xdg-desktop-portal-hyprland

    # Основні утиліти для роботи в терміналі та файловому менеджері
    kitty
    rofi

    # Аудіо та Bluetooth підтримка
    pulseaudio
    pavucontrol
    pipewire
    wireplumber
    bluez
    bluez-tools
    blueman
  ];  
}

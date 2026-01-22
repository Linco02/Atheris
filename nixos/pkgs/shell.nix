{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Головні пакети для робочого середовища Hyprland
    xwayland
    hyprland
    hyprlock
    waybar

    # Основні утиліти для роботи в терміналі та файловому менеджері
    kitty
    fish
    # thunar
    rofi

    # Налаштування зовнішнього вигляду
    hyprpaper
    waypaper

    # Інші корисні пакети
    nwg-look
    gnome-shell
    glance

    # Мультимедійні програми
    vlc
    mpv
    ffmpeg
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav

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

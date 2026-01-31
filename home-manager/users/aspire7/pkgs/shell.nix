{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hellwal
    papirus-icon-theme
    material-cursors

    # Налаштування зовнішнього вигляду
    hyprpaper
    waypaper
    hyprlock
    waybar

    # Мультимедійні програми
    vlc
    mpv
    ffmpeg
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav

    # Інші корисні пакети
    nwg-look
    gnome-shell
    glance
  ];  
}

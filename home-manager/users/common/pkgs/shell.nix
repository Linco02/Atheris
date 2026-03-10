{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.qt6ct
    kdePackages.qt5compat

    # Налаштування зовнішнього вигляду
    quickshell
    matugen
    hyprlock
    
    papirus-icon-theme
    hicolor-icon-theme
    adwaita-icon-theme

    # Мультимедійні програми
    eog
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
    
    python3

    gtk3
    gtk4
    qt6.qtimageformats
    libsForQt5.qt5ct
    kdePackages.qt6ct
    kdePackages.qtsvg
    kdePackages.qtimageformats
  ];  
}

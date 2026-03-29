{ pkgs, quickshell, inputs, ... }:

{
  home.packages = with pkgs; [
    # shell

    (inputs.quickshell.packages.${pkgs.system}.default.withModules [
      pkgs.qt6.qtmultimedia
    ])
    # quickshell
    qt6.qtimageformats
    qt6.qtmultimedia
    libsForQt5.qt5ct
    kdePackages.qt6ct
    kdePackages.qt5compat
    kdePackages.qtsvg
    kdePackages.qtimageformats

    # Налаштування зовнішнього вигляду
    matugen
    pywalfox-native
    
    papirus-icon-theme
    hicolor-icon-theme
    # adwaita-icon-theme

    # Мультимедійні програми
    eog
    vlc
    mpv
    ffmpeg
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
    gst_all_1.gst-vaapi

    # Інші корисні пакети
    nwg-look
    gnome-shell
    glance
    
    python3

    gtk3
    gtk4
  ];
}
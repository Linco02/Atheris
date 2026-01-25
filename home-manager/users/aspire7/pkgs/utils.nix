{ pkgs, ... }:

{
  # Утиліти
  home.packages = with pkgs; [
    youtube-music
    telegram-desktop
    gparted
    appimage-run
    vesktop
    deluge
    kdePackages.kdenlive
    gimp
    krita
    docker
    docker-compose
    qemu
    jstest-gtk
    nwg-displays
    neohtop
    libreoffice
    xarchiver
    kdePackages.kcalc
    microfetch
    dunst
    hyprshot
    jq
    wget
    htop
    unzip
    unrar
    sassc

    gdk-pixbuf
    poppler
    ffmpegthumbnailer

  ];
}

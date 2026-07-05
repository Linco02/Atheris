{ pkgs, nur, ... }:

{
  # Утиліти
  home.packages = with pkgs; [
    pear-desktop
    spotify
    telegram-desktop
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
    # nwg-displays
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
    pavucontrol
    gnome-software
    google-chrome

    gdk-pixbuf
    poppler
    ffmpegthumbnailer

    brightnessctl
    lm_sensors
    
    libnotify

    furmark

    # android-tools

    clinfo
    libva-utils
    nur
    
    cava
  ];
}

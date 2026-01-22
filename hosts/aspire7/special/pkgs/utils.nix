{ pkgs, ... }:

{
  # Утиліти
  environment.systemPackages = with pkgs; [
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
  ];
}

{ pkgs, ... }:

{
  # Утиліти
  environment.systemPackages = with pkgs; [
    jq
    unzip
    unrar
    xarchiver
    microfetch
    git
    wget
    htop
    dunst
    ntfs3g
    exfatprogs
    os-prober
    gdk-pixbuf
    poppler
    ffmpegthumbnailer
    sassc
    hyprshot
    kdePackages.kcalc
    brightnessctl
    xdg-desktop-portal
    xdg-desktop-portal-hyprland
  ];
}

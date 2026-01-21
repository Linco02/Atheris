{ pkgs, ... }:

{
  # Ігри
  environment.systemPackages = with pkgs; [
    heroic
    lutris
    steam
    prismlauncher

    wineWowPackages.full
    winetricks
    protontricks
    protonup-qt

    mesa
    jdk17
    mangohud
    gamemode
    libGL
    alsa-lib
    vulkan-loader
    vulkan-tools
    gst_all_1.gstreamer
    vkbasalt

    osu-lazer
  ];
}
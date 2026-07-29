{ pkgs, ... }:

{
  # Ігри
  home.packages = with pkgs; [
    heroic
    lutris
    steam
    prismlauncher

    wineWow64Packages.full
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

    # ryubing
    cemu

    # osu-lazer
  ];
}
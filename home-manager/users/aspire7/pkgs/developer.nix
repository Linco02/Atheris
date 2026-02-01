{ pkgs, ... }:

{
  # Програмування
  home.packages = with pkgs; [
    vscodium
    neovim

    python3Packages.pygobject3
    gobject-introspection
    gtk3
    gtk4

    quickshell
    qtcreator

    gcc
    scdoc
    pkg-config

    meson
    ninja
    cmake
  ];
}
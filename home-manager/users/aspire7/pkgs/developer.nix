{ pkgs, ... }:

{
  # Програмування
  home.packages = with pkgs; [
    vscodium
    neovim

    python3
    gcc
    pkg-config
    scdoc
    gtk3
    python3Packages.pygobject3
    gobject-introspection
    gtk4

    quickshell
    kdePackages.qt6ct
    kdePackages.qt5compat
    qtcreator

    meson
    ninja
    cmake
  ];
}
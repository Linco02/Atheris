{ pkgs }:

{
  # Інструменти
  tools = with pkgs; [
    gcc
    gcc-wrapper
    gdb
    g++
    g++-wrapper
    scdoc
    pkg-config
    meson
    ninja
    cmake
    git
  ];

  # Бібліотеки для розробки
  libs = with pkgs; [
    gtk3
    gtk4
    python3Packages.pygobject3
    gobject-introspection
    quickshell
    qt6.qtbase
    qt6.wrapQtAppsHook
  ];

  # Редактори та IDE
  editors = with pkgs; [
    vscodium
    neovim
    vim
    qtcreator
  ];
}
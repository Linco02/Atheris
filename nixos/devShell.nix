{ pkgs }:

{
  # Інструменти
  tools = with pkgs; [
    gcc
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
  ];

  # Редактори та IDE
  editors = with pkgs; [
    vscodium
    neovim
    vim
    qtcreator
  ];
}
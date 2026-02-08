{ pkgs }:

{
  # Інструменти
  tools = with pkgs; [
    gcc
    gdb
    gnumake
    scdoc
    pkg-config
    meson
    ninja
    cmake
    git
  ];

  # Бібліотеки для розробки
  libs = with pkgs; [
    (python3.withPackages (ps: with ps; [
      debugpy # для дебагу
      pyside6
      python-lsp-server
      pip
      pygobject3
    ]))

    gtk3
    gtk4
    gobject-introspection
    quickshell
    qt6.qtbase
    qt6.wrapQtAppsHook
    qt6.qtimageformats
    kdePackages.qt6ct
    kdePackages.qtsvg
    kdePackages.qtimageformats
    # qt6.full
    # qt5.full

    makeWrapper
    bashInteractive
  ];

  # Редактори та IDE
  editors = with pkgs; [
    vscodium
    neovim
    vim
    qtcreator
  ];
}
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

    gparted
    # fdisk
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

    gobject-introspection
    qt6.qtbase
    qt6.wrapQtAppsHook
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
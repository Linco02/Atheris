{ pkgs, user, config, lib, ... }:

{
  gtk = {
    enable = true;
    colorScheme = "dark";

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };

    font = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };

    gtk4.theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
  };

  home.activation.gtkSymlink = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ln -sf /tmp/atheris/gtk.css ${config.home.homeDirectory}/.config/gtk-4.0/gtk.css
    ln -sf /tmp/atheris/gtk.css ${config.home.homeDirectory}/.config/gtk-3.0/gtk.css
  '';
  # xdg.configFile."gtk-4.0/gtk.css".source = config.lib.file.mkOutOfStoreSymlink "/tmp/atheris/gtk.css";
  # xdg.configFile."gtk-3.0/gtk.css".source = config.lib.file.mkOutOfStoreSymlink "/tmp/atheris/gtk.css";
}
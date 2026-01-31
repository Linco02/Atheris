{ pkgs, ... }:

{
  gtk = {
    enable = true;
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 40;
    };
  };

  qt = {
    enable = true;
    style.package = pkgs.adwaita-qt;
    style.name = "adwaita-dark";
  };

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";

    gtk.enable = true;
    x11.enable = true;
    hyprcursor.enable = true;
    sway.enable = true;

    size = 30;
    hyprcursor.size = 30;
  };
}
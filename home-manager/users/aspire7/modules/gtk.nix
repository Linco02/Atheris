{ pkgs, ... }:

{
  gtk = {
    enable = true;
    colorScheme = "dark";

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
      name = "Papirus";
    };
  };
}
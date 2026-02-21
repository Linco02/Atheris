{ pkgs, user, ... }:

{
  gtk = {
    enable = true;
    colorScheme = "dark";

    # gtk3.extraCss = ''
    #   @import url("file:///home/${user}/.cache/hellwal/gtk.css");
    # '';

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
  };
}
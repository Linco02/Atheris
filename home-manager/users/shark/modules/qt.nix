{ pkgs, ... }:

{
  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };
}
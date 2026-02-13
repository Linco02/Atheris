{ pkgs, ... }:

{
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "kvantum";  
  };

  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
  };
}
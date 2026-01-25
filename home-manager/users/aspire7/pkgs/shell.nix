{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hellwal
    papirus-icon-theme
  ];  
}

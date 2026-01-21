{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    hellwal
    papirus-icon-theme
  ];  
}

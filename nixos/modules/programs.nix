{ pkgs, ... }:

{
  programs = {
    fish.enable = true;
    firefox.enable = true;

    hyprland = {
      enable = true;
      withUWSM = true;
    };

    thunar = {
      enable = true;
      plugins = with pkgs; [
        thunar-archive-plugin
        thunar-volman
        thunar-media-tags-plugin
      ];
    };
  };
}
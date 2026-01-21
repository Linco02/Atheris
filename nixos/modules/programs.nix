{ pkgs, ... }:

{
  programs = {
    fish.enable = true;
    firefox.enable = true;

    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
        thunar-media-tags-plugin
      ];
    };


  };
}
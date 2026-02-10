{ pkgs, ... }:

{
  programs = {
    steam.enable = true;
    gamemode.enable = true;
    virt-manager.enable = true;

    java = {
      enable = true;
      package = pkgs.temurin-bin-17;
    };
  };
}

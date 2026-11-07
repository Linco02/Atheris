{ pkgs, ... }:

{
  programs = {
    gamemode.enable = true;
    virt-manager.enable = true;

    steam.enable = true;

    java = {
      enable = true;
      package = pkgs.temurin-bin-17;
    };

    corectrl.enable = true;
  };
}

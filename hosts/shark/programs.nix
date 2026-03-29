{ pkgs, ... }:

{
  programs = {
    gamemode.enable = true;
    virt-manager.enable = true;

    steam = {
      enable = true;
      # package = pkgs.millennium-steam;
    };

    java = {
      enable = true;
      package = pkgs.temurin-bin-17;
    };
  };
}

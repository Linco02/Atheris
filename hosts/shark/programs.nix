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

    corectrl = {
      enable = true;
      gpuOverclock = {
        enable = true;
        ppfeaturemask = "0xffffffff";
      };
    };
  };
}

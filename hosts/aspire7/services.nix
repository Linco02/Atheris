{ pkgs, ... }:

{
  services = {
    flatpak.enable = true;
    upower.enable = true;
    fprintd = {
      enable = true;
      tod = {
        enable = true;
        driver = pkgs.libfprint-2-tod1-elan;
      };
    };
  };
}
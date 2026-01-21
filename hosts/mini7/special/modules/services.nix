{ config, pkgs, ...}:

{
  # Увімкнення NVIDIA яй відеодрайвера
  services.xserver.videoDrivers = [ "nvidia" ];
}
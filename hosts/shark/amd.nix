{ config, pkgs, ...}:

{
  # Увімкнення AMD яй відеодрайвера
  services.xserver.videoDrivers = [ "amdgpu" ];
}
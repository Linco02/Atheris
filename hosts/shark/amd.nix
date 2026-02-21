{ config, pkgs, ...}:

{
  # Увімкнення AMD яй відеодрайвера
  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };
}
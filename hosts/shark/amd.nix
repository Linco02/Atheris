{ ... }:

{
  # Увімкнення AMD яй відеодрайвера
  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.amdgpu.overdrive = {
    enable = true;
    ppfeaturemask = "0xffffffff";
  };
}
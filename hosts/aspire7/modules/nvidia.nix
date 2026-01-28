{ config, pkgs, ...}:

{
  # Увімкнення NVIDIA яй відеодрайвера
  services.xserver.videoDrivers = [ "nvidia" "amdgpu" ];

  hardware = {
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      prime = {
        offload.enable = true;
        offload.enableOffloadSetuidPrograms = true;

        nvidiaBusId = "PCI:1:0:0";
        amdgpuBusId = "PCI:5:0:0";
      };
    };
  };
}
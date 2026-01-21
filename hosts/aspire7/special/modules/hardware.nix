{ config, pkgs, ...}:

{
  hardware = {
    # Підтримка геймпадів Xbox
    xpadneo.enable = true;

    # Налаштування steam
    steam-hardware.enable = true;

    # Налаштування графіки
    graphics = {
      enable = true;
      enable32Bit = true;
    };

  # Увімкнення NVIDIA яй відеодрайвера
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      prime = {
        nvidiaBusId = "PCI:1:0:0";
        amdgpuBusId = "PCI:5:0:0";
      };
    };


  };
}
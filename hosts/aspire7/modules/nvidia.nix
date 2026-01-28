{ config, pkgs, ... }:

{

  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "nvidia" "amdgpu" ]; # Тепер обидва

  # Дозволяємо лише необхідні драйвери
  # services.xserver.videoDrivers = [ "nvidia" ];

  # boot.kernelParams = [ "nvidia_drm.modeset=1" "nvidia_drm.fbdev=1" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    open = false; # Для 1650 краще тримати false (пропрієтарний драйвер стабільніший)
    nvidiaSettings = true;
    # Використовуємо стабільну гілку
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;
      # ПЕРЕВІРТЕ ЦІ ID ЩЕ РАЗ ЧЕРЕЗ LSPCI!
      nvidiaBusId = "PCI:1:0:0"; 
      amdgpuBusId = "PCI:5:0:0";
    };
  };

  environment.sessionVariables = {
    # Вказуємо Hyprland використовувати інтегровану карту для виводу, 
    # а NVIDIA лише для важких обчислень
    WLR_DRM_DEVICES = "/dev/dri/card0:/dev/dri/card1";
  
    # Обов'язково для вашої 1650
    WLR_NO_HARDWARE_CURSORS = "1";
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };
}
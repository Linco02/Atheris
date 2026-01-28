{ config, pkgs, ... }:

{
  # Дозволяємо лише необхідні драйвери
  services.xserver.videoDrivers = [ "nvidia" ];

  boot.kernelParams = [ "nvidia_drm.modeset=1" "nvidia_drm.fbdev=1" ];

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

  # Змінні оточення для Hyprland + NVIDIA
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    XDG_SESSION_TYPE = "wayland";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1"; # Без цього на 1650 часто чорний екран
    NVD_BACKEND = "direct"; # Покращує роботу відео
  };
}
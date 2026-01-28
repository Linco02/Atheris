{ config, pkgs, ... }:

{
  # 1. Спробуємо інше ядро (LTS зазвичай стабільніше для ноутбуків)
  boot.kernelPackages = pkgs.linuxPackages_latest; # Або pkgs.linuxPackages_6_6 (LTS)

  # 2. Додаємо параметри для виправлення ініціалізації AMD
  boot.kernelParams = [ 
    "amdgpu.noretry=0" 
    "initcall_blacklist=simpledrm_platform_driver_init" # Вимикаємо конфліктний simpledrm
    "nvidia_drm.modeset=1"
    "nvidia_drm.fbdev=1"
  ];

  # 3. ПЕРЕКОНАЙТЕСЯ, що прошивка завантажується
  hardware.enableAllFirmware = true;
  hardware.cpu.amd.updateMicrocode = true;

  # 4. Виправляємо порядок драйверів
  services.xserver.videoDrivers = [ "nvidia" "amdgpu" ];

  # 5. Обов'язково додаємо це для Hyprland + NVIDIA
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    # Змушуємо Hyprland бачити обидві карти, але AMD як основну для екрана
    WLR_DRM_DEVICES = "/dev/dri/card0:/dev/dri/card1";
  };
}
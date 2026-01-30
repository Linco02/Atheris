{ pkgs, ...}:

{
  boot = {
    # Заставка при завантажені
    plymouth = {  
      enable = true;
      theme = "rings";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "rings" ];
        })
      ];
    };

    consoleLogLevel = 3;
    kernelParams = [
      "quiet"
      "udev.log_level=3"
      "systemd.show_status=auto"
    ];

    loader = {
      # Ввімкнення підтримки EFI-змінних
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = false;

      # Налаштування GRUB-завантажувача
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = true;

        theme = ../../assets/grub2;
        gfxmodeEfi = "1920x1080";
        gfxpayloadEfi = "keep";
      };
    };

    initrd = {
      systemd.enable = true;
      verbose = false;
      availableKernelModules = [ 
        "nvme"
        "ahci" 
        "usbhid" 
      ];
    };
  };
}
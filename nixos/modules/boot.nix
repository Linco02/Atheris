{
  boot = {
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

        # theme = ../../assets/grub2;
        # gfxmodeEfi = "1920x1080";
        # gfxpayloadEfi = "keep";
      };
    };

    initrd.availableKernelModules = [ 
      "nvme"
      "ahci" 
      "usbhid" 
    ];
  };
}
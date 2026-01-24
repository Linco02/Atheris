{
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = false;

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
}
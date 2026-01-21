{
  # Налаштування завантаження
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    supportedFilesystems = [
      "ntfs"
    ];
    blacklistedKernelModules = [
      "ntfs3"
    ];
  };
}
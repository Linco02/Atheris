{ pkgs, ...}:
let
  grubTheme = pkgs.fetchFromGitHub {
    owner = "OliveThePuffin";
    repo = "yorha-grub-theme";
    rev = "4d9cd37";
    hash = "sha256-Udtx1aMVNP9XMEctWmnEOswxCzWmWvuWclS8UR/PWz0=";
    sparseCheckout = [ "yorha-1920x1080" ];
  };
in
{
  boot = {
    # Заставка при завантажені
    plymouth = {  
      enable = true;
      theme = "seal_2";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "seal_2" ];
        })
      ];
    };

    consoleLogLevel = 3;
    kernelParams = [
      "quiet"
      "udev.log_level=3"
      "systemd.show_status=auto"
      "vt.global_cursor_default=0"
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
        theme = "${grubTheme}/yorha-1920x1080";
        gfxmodeEfi = "auto";
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

    supportedFilesystems = [ "exfat" "ntfs" ];
  };
}
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
  };
}
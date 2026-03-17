{ config, pkgs, ...}:

{
  hardware = {
    # Підтримка геймпадів Xbox
    xpadneo.enable = true;

    i2c.enable = true;

    # Налаштування steam
    steam-hardware.enable = true;

    # Налаштування графіки
    graphics = {
      package = pkgs.mesa;
      enable = true;
      enable32Bit = true;
    };
  };
}
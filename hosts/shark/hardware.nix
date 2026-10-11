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

    display = {
      edid.packages = [
        (pkgs.runCommand "edid-aw2725dm" { } ''
          mkdir -p $out/lib/firmware/edid
          cp ${./aw2725dm.bin} $out/lib/firmware/edid/aw2725dm.bin
        '')
      ];
      outputs."DP-3" = {
        edid = "aw2725dm.bin";
        mode = "e";
      };
    };
  };
}
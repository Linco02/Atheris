{ config, pkgs, ... }:

{
  hardware = {
    # uinput.enable = true;

    # Налаштування Bluetooth
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
          FastConnectable = true;
          ControllerMode = "bredr";
        };
        Policy = {
          AutoEnable = true;
        };
      };
    };
  };
}
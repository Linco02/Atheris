{ pkgs, ... }:

{
  services = {
    flatpak.enable = true;
    upower.enable = true;

    # Керування підсвіткою
    hardware.openrgb.enable = true;

    udev.extraRules = ''
      SUBSYSTEMS=="usb", ATTRS{idVendor}=="0db0", ATTRS{idProduct}=="0076", MODE="0666", GROUP="users"
    '';
  };
}
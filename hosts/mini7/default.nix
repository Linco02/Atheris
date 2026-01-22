{ pkgs, ... }:

{
  imports = [
    ./special/modules/hardware.nix
    ./special/modules/services.nix
    ./hardware-configuration.nix
  ];
}
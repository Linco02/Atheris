{ pkgs, ... }:

let
  modules = ./special/modules;
in
{
  imports = [
    "${modules}/hardware.nix"
    "${modules}/services.nix"

    /etc/nixos/hardware-configuration.nix
  ];
}
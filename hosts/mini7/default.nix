{ pkgs, stateVersion, hostname, ... }:

let
  modules = .special/modules;
  # packages = .special/pkgs;
in
{
  imports = [
    "${modules}/hardware.nix"
    "${modules}/services.nix"

    ./hardware-configuration.nix
  ];
}
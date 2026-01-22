{ pkgs, ... }:

let
  modules = ./special/modules;
  hwConfig = if builtins.pathExists ./hardware-configuration.nix 
             then [ ./hardware-configuration.nix ]
             else [ ];
in
{
  imports = hwConfig ++ [
    "${modules}/hardware.nix"
    "${modules}/services.nix"
  ];
}
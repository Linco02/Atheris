{ config, pkgs, stateVersion, ... }:

{
  imports = [
    ./modules
    ./pkgs
  ];
}
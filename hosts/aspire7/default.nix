{ pkgs, stateVersion, hostname, ... }:

let
  modules = ./modules;
  packages = ./pkgs;
in
{
  imports = [
    "${modules}/programs/vscode.nix"
    "${modules}/hardware.nix"
    "${modules}/programs.nix"
    "${modules}/services.nix"

    "${packages}/developer.nix"
    "${packages}/game.nix"
    "${packages}/shell.nix"
    "${packages}/utils.nix"

    ./hardware-configuration.nix
  ];

  # Docker налаштування
  virtualisation.docker = {
    enable = true;
  };
}
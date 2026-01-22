{ pkgs, ... }:

let
  modules = ./special/modules;
  packages = ./special/pkgs;
  hwConfig = if builtins.pathExists ./hardware-configuration.nix 
             then [ ./hardware-configuration.nix ]
             else [ ];
in
{
  imports = hwConfig ++ [
    # "${modules}/programs/vscode.nix"
    "${modules}/hardware.nix"
    "${modules}/programs.nix"
    "${modules}/services.nix"

    "${packages}/developer.nix"
    "${packages}/game.nix"
    "${packages}/shell.nix"
    "${packages}/utils.nix"
  ];

  # Docker налаштування
  virtualisation.docker = {
    enable = true;
  };
}
{ config, pkgs, inputs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with nix-vscode-extensions.extensions.${system}; [
      vscode-marketplace.arrterian.nix-env-selector
      vscode-marketplace.batisteo.vscode-django
      vscode-marketplace.bbenoist.nix
    ];
  };
}

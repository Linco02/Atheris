{ pkgs, ... }:

{
  # Програмування
  environment.systemPackages = with pkgs; [
    vim
  ];
}
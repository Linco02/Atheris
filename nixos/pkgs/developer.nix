{ pkgs, ... }:

{
  # Програмування
  environment.systemPackages = with pkgs; [
    vim

    meson
    ninja
    cmake
  ];
}
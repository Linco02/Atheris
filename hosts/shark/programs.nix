{ pkgs, ... }:

{
  programs = {
    steam.enable = true;
    gamemode.enable = true;
    virt-manager.enable = true;

    java = {
      enable = true;
      package = pkgs.temurin-bin-17;
    };

    # nix-ld = {
    #   enable = true;
    #   libraries = with pkgs; [
    #     stdenv.cc.cc
    #     zlib
    #     glib
    #     libpulseaudio
    #     alsa-lib
    #     libjack2

    #     xorg.libX11
    #     xorg.libXext
    #     xorg.libXrender
    #     xorg.libXtst
    #     xorg.libXi

    #     freetype
    #     fontconfig
    #   ];
    # };
  };
}

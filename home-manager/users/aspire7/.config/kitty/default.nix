{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    extraConfig = ''
      source = "~/.cache/hellwal/kitty-colors.conf"

      font_family      JetBrains Mono
      font_size 14.0
      window_padding_width 10
      background_opacity 0.75
    '';
  };
}

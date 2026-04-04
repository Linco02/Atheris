{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    extraConfig = ''
      include /tmp/atheris/kitty-colors.conf

      font_family      JetBrains Mono
      font_size 14.0
      window_padding_width 10
    '';
  };

}

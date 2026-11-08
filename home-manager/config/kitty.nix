{ ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      scrollback_lines = 10000;
      window_padding_width = 10;
      enable_audio_bell = false;
      remember_window_size = false;
    };
    font = {
      name = "JetBrains Mono";
      size = 14;
    };

    extraConfig = ''
      include /tmp/atheris/kitty-colors.conf
    '';
  };

}

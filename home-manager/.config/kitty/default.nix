{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    extraConfig = builtins.readFile ./kitty.conf;

    # extraConfig = ''
    #   include ${./kytty.conf}
    # '';
  };

  # Додаємо сам файл кольорів у домашню папку користувача
  # home.file.".config/kitty/kytty.conf".source = ./kytty.conf;
}

{
  programs.waybar = {
    enable = true;
  };

  home.file = {
    "./.config/waybar/config.jsonc".source = ./theme/config.jsonc;
    "./.config/waybar/modules.jsonc".source = ./theme/modules.jsonc;
    "./.config/waybar/style.css".source = ./theme/style.css;
    "./.config/waybar/animation.css".source = ./theme/animation.css;
  };
}
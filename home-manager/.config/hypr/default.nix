{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    # settings = {
    #   source = [ "./hyprland/hyprland.conf" ];
    # };
  };

  programs.hyprlock = {
    enable = true;
    # settings = {
    #   source = [ "./hyprlock/hyprlock.conf" ];
    # };
  };

  services.hyprpaper = {
    enable = true;
    # settings = {
    #   preload = "~/Pictures/wallpaper/stat/wal1.png";

    #   wallpaper = [
    #     "eDP-1,~/Pictures/wallpaper/stat/wal1.png"
    #     "HDMI-A-1,~/Pictures/wallpaper/stat/wal1.png"
    #   ];
    # };
  };

  home.file.".config/hypr/hyprland.conf".source = ./hyprland/hyprland.conf;
  home.file.".config/hypr/binds.conf".source = ./hyprland/binds.conf;
  home.file.".config/hypr/visual.conf".source = ./hyprland/visual.conf;

  home.file.".config/hypr/hyprlock.conf".source = ./hyprlock/hyprlock.conf;
  # home.file.".config/hypr/hyprpaper.conf".source = ./hyprpaper/hyprpaper.conf;
}
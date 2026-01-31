{ pkgs, config, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    settings = {
      # ============================================================
      # STARTUP & THEMING
      # ============================================================
      
      # Load color scheme from wallpaper
      source = "~/.cache/hellwal/hyprland-colors.conf";

      # Monitor configuration
      # monitor = [
      #   "Monitor Virtual-1,1920x1080@60,0x0,1"
      #   # "eDP-1,1920x1080@60,0x0,1"
      #   # "HDMI-A-1,2560x1440@144,1920x0,1"
      # ];

      monitor = ", preferred, auto, 1";

      env = [
        # "HYPRCURSOR_THEME,Bibata-Modern-Ice"
        "XCURSOR_SIZE,28"
        "HYPRCURSOR_SIZE,28"
      ];

      # Startup commands executed on Hyprland launch
      exec-once = [
        # "hyprctl setcursor Bibata-Modern-Ice 24"
        "/nix/store/fxd030lwhc81ajzxbvxcj1y0p8mgf52q-dbus-1.14.10/bin/dbus-update-activation-environment --systemd DISPLAY HYPRLAND_INSTANCE_SIGNATURE WAYLAND_DISPLAY XDG_CURRENT_DESKTOP && systemctl --user stop hyprland-session.target && systemctl --user start hyprland-session.target"
        "hyprpaper"
        "waypaper --random"
        # "sh ~/Documents/Scripts/change-theme.sh"
        # "sleep 0.5 && python ~/Documents/Scripts/init-monitor.py"
      ];

      # ============================================================
      # VARIABLE DEFINITIONS (used throughout config)
      # ============================================================
      "$mainMod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "thunar";
      "$menu" = "rofi -show drun";

      # ============================================================
      # INPUT SETTINGS
      # ============================================================
      input = {
        kb_layout = "us,ua";
        kb_options = "grp:alt_shift_toggle";
        follow_mouse = 1;
        sensitivity = 0;

        touchpad = {
          natural_scroll = true;
        };
      };

      # ============================================================
      # GENERAL WINDOW & LAYOUT SETTINGS
      # ============================================================
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "$foreground";
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };

      # Dwindle layout configuration
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      # Master layout configuration
      master = {
        new_status = "master";
      };

      # ============================================================
      # VISUAL EFFECTS & DECORATION
      # ============================================================
      decoration = {
        rounding = 15;
        active_opacity = 1;
        inactive_opacity = 1;
        dim_inactive = false;
        dim_strength = 0.3;

        # Shadow configuration
        shadow = {
          enabled = false;
          range = 6;
          render_power = 4;
          color = "$foreground";
        };

        # Blur effect
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      # ============================================================
      # ANIMATIONS & TRANSITIONS
      # ============================================================
      animations = {
        enabled = true;

        # Bezier curves for animation easing
        bezier = [
          "liner, 0, 0, 1, 1"
          "ease-out, 0, 0, 0.58, 1"
          "ease-in, 0.42, 0, 1, 1"
          "smoth, 0.25, 1.0, 0.25, 1.0"
          "fast, 0.15, 0.85, 0.25, 1.0"
        ];

        # Animation definitions (property, duration, delay, curve, style)
        animation = [
          "windows, 1, 4, fast, gnomed"
          "windowsOut, 1, 6, smoth, slide"
          "windowsMove, 1, 6, smoth, popin"
          "layersIn, 1, 2, fast, slide left"
          "layersOut, 1, 2, fast, slide right"
          "fadeIn, 1, 4, ease-in"
          "fadeOut, 1, 4, liner"
          "fadeSwitch, 1, 2, ease-in"
          "fadeShadow, 1, 10, smoth"
          "fadeDim, 1, 6, smoth"
          "fadeLayersIn, 1, 10, smoth"
          "fadeLayersOut, 1, 10, smoth"
          "border, 1, 10, smoth"
          "workspacesIn, 1, 2, ease-out, slide"
          "workspacesOut, 1, 2, ease-out, slide"
          "specialWorkspaceIn, 1, 2, ease-out, slidevert"
          "specialWorkspaceOut, 1, 2, ease-out, slidevert"
        ];
      };

      # ============================================================
      # MISCELLANEOUS SETTINGS
      # ============================================================
      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
      };

      # ============================================================
      # KEYBINDINGS - Regular (bind)
      # ============================================================
      bind = [
        # Window resizing
        "$mainMod SHIFT, H, resizeactive, -100 0"
        "$mainMod SHIFT, L, resizeactive, 60 0"
        "$mainMod SHIFT, K, resizeactive, 0 -60"
        "$mainMod SHIFT, J, resizeactive, 0 100"

        # Application shortcuts
        "$mainMod, I, exec, python ~/Documents/Scripts/init-monitor.py"
        "$mainMod, Q, exec, $terminal"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, R, exec, $menu"
        "$mainMod, F, exec, flatpak run app.zen_browser.zen"
        "$mainMod, L, exec, hyprlock"
        "$mainMod, W, exec, waypaper"
        ", Print, exec, hyprshot -m region -o ~/Pictures/screanshoot/"

        # Window management
        "$mainMod, C, killactive,"
        "$mainMod, V, togglefloating,"
        "$mainMod, P, pseudo,"
        "$mainMod, J, togglesplit,"
        "$mainMod, M, exit,"

        # Window focus navigation (arrow keys)
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Workspace switching (1-10)
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move window to workspace (Shift + number)
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Mouse-based workspace switching
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];

      # ============================================================
      # KEYBINDINGS - Mouse (bindm)
      # ============================================================
      bindm = [
        # Move window with mouse (Super + LMB)
        "$mainMod, mouse:272, movewindow"
        # Resize window with mouse (Super + RMB)
        "$mainMod, mouse:273, resizewindow"
      ];

      # ============================================================
      # KEYBINDINGS - Repeat (bindel) - Volume & Brightness
      # ============================================================
      bindel = [
        # Audio controls (repeat-enabled)
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

        # Brightness controls (repeat-enabled)
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      # ============================================================
      # KEYBINDINGS - Lock (bindl) - Media Controls
      # ============================================================
      bindl = [
        # Music player controls (locked - work even when typing)
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPause, exec, playerctl play-pause"
      ];
    };
  };
}
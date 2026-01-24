{
  programs.hyprlock = {
    enable = true;
    settings = {
      # ============================================================
      # BACKGROUND & DISPLAY SETTINGS
      # ============================================================
      background = [
        {
          # Monitor configuration
          monitor = "";

          # Base color (RGBA format)
          color = "rgba(25, 20, 20, 1.0)";

          # Blur effect settings
          blur_passes = 0;
          blur_size = 7;
          noise = 0.0117;

          # Visual enhancement
          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0.0;
        }
      ];

      # ============================================================
      # INPUT FIELD & PASSWORD PROMPT
      # ============================================================
      "input-field" = [
        {
          # Monitor configuration
          monitor = "eDP-1";

          # Size and position
          size = [ 200 50 ];
          position = [ 0 -20 ];
          halign = "center";
          valign = "center";

          # Border and dots styling
          outline_thickness = 3;
          rounding = -1;

          # Dot indicators configuration
          dots_size = 0.33;
          dots_spacing = 0.15;
          dots_center = false;
          dots_rounding = -1;

          # Color scheme
          outer_color = "rgb(151515)";
          inner_color = "rgb(200, 200, 200)";
          font_color = "rgb(10, 10, 10)";
          check_color = "rgb(204, 136, 34)";
          fail_color = "rgb(204, 34, 34)";
          capslock_color = -1;
          numlock_color = -1;
          bothlock_color = -1;

          # Password input behavior
          placeholder_text = "<i>Input Password...</i>";
          hide_input = false;
          swap_font_color = false;
          invert_numlock = false;

          # Fade and timeout settings
          fade_on_empty = true;
          fade_timeout = 1000;

          # Failure feedback
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          fail_transition = 300;
        }
      ];
    };
  };
}

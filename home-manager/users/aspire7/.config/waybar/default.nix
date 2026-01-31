{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin-top = 0;
        margin-left = 0;
        margin-right = 0;

        modules-left = [
          "group/toolbox"
          "hyprland/workspaces"
          "wlr/taskbar"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "group/monitors"
          "pulseaudio"
          "battery"
          "network"
          "hyprland/language"
        ];

        # --- LEFT MODULES ---
        "group/toolbox" = {
          tooltip = false;
          orientation = "horizontal";
          modules = [
            "custom/powermenu"
            "custom/firefox"
            "custom/wofi"
            "custom/filemanager"
            "custom/terminal"
          ];
        };

        "custom/powermenu" = {
          format = "";
          tooltip = false;
          on-click-right = "reboot";
          on-click = "poweroff";
        };

        "custom/firefox" = {
          format = "󰈹";
          tooltip = false;
          on-click = "firefox";
          on-click-middle = "pkill firefox";
        };

        "custom/wofi" = {
          format = "";
          tooltip = false;
          on-click = "rofi -show drun";
          on-click-middle = "pkill rofi";
        };

        "custom/filemanager" = {
          format = "";
          tooltip = false;
          on-click = "thunar";
          on-click-middle = "pkill thunar";
        };

        "custom/terminal" = {
          format = "";
          tooltip = false;
          on-click = "kitty";
          on-click-middle = "pkill kitty";
        };

        "hyprland/workspaces" = {
          format = "{icon}";
          disable-scroll = true;
          format-icons = {
            empty = "○";
            persistent = "◉";
            active = "●";
          };
          persistent-workspaces = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
            "5" = [ ];
          };
        };

        "wlr/taskbar" = {
          format = "{icon}";
          tooltip = false;
          icon-size = 18;
          on-click = "activate";
          on-click-middle = "close";
          sort-by-app-id = true;
          ignore-list = [ "wofi" ];
        };

        # --- CENTER MODULES ---
        "clock" = {
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };

        # --- RIGHT MODULES ---
        "group/monitors" = {
          tooltip = false;
          orientation = "horizontal";
          modules = [
            "custom/lapmonitor"
            "custom/outmonitor"
          ];
        };

        "custom/lapmonitor" = {
          format = "󰌢";
          tooltip = false;
          on-click = "hyprctl keyword monitor 'eDP-1,1920x1080@60,0x0,1'";
          on-click-right = "hyprctl keyword monitor 'eDP-1,disable'";
        };

        "custom/outmonitor" = {
          format = "󰍹";
          tooltip = false;
          on-click = "hyprctl keyword monitor 'HDMI-A-1,2560x1440@144,auto,1'";
          on-click-right = "hyprctl keyword monitor 'HDMI-A-1,disable'";
        };

        "pulseaudio" = {
          tooltip = false;
          format = "{icon} {volume}%";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" "" ];
          };
          on-click = "pavucontrol";
        };

        "battery" = {
          tooltip = false;
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-full = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{time} {icon}";
          format-icons = [ "" "" "" "" "" ];
        };

        "network" = {
          tooltip = false;
          format-wifi = " {signalStrength}%";
          format-ethernet = "{cidr} ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = " ⚠ ";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };

        "hyprland/language" = {
          tooltip = false;
          format-en = "US";
          format-uk = "UA";
        };
      };
    };

    style = ''
      @import url("../../.cache/hellwal/waybar-colors.css");

      * {
        font-family: "Symbols Nerd Font", "JetBrainsMono Nerd Font", monospace;
        font-size: 18px;
        border-radius: 0;
      }

      window#waybar {
        background-color: rgba(0, 0, 0, 0);
      }

      /* CONTAINER */
      #toolbox,
      #workspaces,
      #taskbar,
      #clock,
      #monitors,
      #pulseaudio,
      #battery,
      #network,
      #language {
        background-color: @background;
        border: 2px solid @foreground;
        border-top: 0;
        border-bottom-right-radius: 15px;
        border-bottom-left-radius: 15px;
      }

      #taskbar.empty {
        background-color: transparent;
        border: 2px solid transparent;
        border-top: 0;
        border-bottom-right-radius: 15px;
        border-bottom-left-radius: 15px;
      }

      #toolbox,
      #workspaces,
      #taskbar {
        margin-left: 10px;
      }

      #monitors,
      #pulseaudio,
      #battery,
      #network,
      #language {
        margin-right: 10px;
      }

      /* ELEMENT */
      #custom-powermenu,
      #custom-firefox,
      #custom-wofi,
      #custom-filemanager,
      #custom-terminal,
      #workspaces button,
      #taskbar button,
      #clock,
      #custom-lapmonitor,
      #custom-outmonitor,
      #pulseaudio,
      #battery,
      #network,
      #language {
        padding-left: 10px;
        padding-right: 10px;
        color: @foreground;
        background-color: @background;
        border-top: 2px solid @background;
        border-bottom-right-radius: 13px;
        border-bottom-left-radius: 13px;
      }

      #custom-powermenu:hover,
      #custom-firefox:hover,
      #custom-wofi:hover,
      #custom-filemanager:hover,
      #custom-terminal:hover,
      #workspaces button:hover,
      #taskbar button:hover,
      #clock:hover,
      #custom-lapmonitor:hover,
      #custom-outmonitor:hover,
      #pulseaudio:hover,
      #battery:hover,
      #network:hover,
      #language:hover {
        background-color: @color8;
        border-top: 2px solid @color4;
      }

      @keyframes ping {
          0% { background-color: @background; }
          50% { background-color: @color6; }
          100% { background-color: @background; }
      }

      #workspaces button.active {
        padding-left: 20px;
        padding-right: 20px;
        background-color: @color8;
        border-top: 2px solid @color4;
      }

      #workspaces button.urgent {
        animation: 1.5s ping linear infinite;
      }

      #taskbar button.active {
        padding-left: 20px;
        padding-right: 20px;
        background-color: @color8;
        border-top: 2px solid @color4;
      }
    '';
  };
}
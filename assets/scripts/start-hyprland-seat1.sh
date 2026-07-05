#!/usr/bin/env fish
set -x XDG_SEAT seat1
set -x WAYLAND_DISPLAY wayland-3
set -x XDG_RUNTIME_DIR /run/user/(id -u)
set -x HYPRLAND_CONFIG /home/linco02/.config/hypr/hyprland-seat1.conf
exec Hyprland
wallpaper=$(grep "^wallpaper" ~/.config/waypaper/config.ini | cut -d'=' -f2 | xargs)
hellwal -i $wallpaper

pkill waybar
waybar &

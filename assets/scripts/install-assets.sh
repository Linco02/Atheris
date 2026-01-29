# створення директорій
mkdir ~/assets
mkdir ~/assets/wallpaper
mkdir ~/assets/scripts
mkdir ~/.config/hellwal

# копіювання шпалер
cp ../wallpaper/* ~/assets/wallpaper/

# копіювання скриптів
cp -r ./ ~/assets/scripts/

# конфіг для waypaper
cp ../waypaper/* ~/.config/waypaper/

# завантаження hellwal
nix-shell -p gcc imlib2 xorg.libX11 --run "
    git clone https://github.com/danihek/hellwal ~/.config/hellwal/ || true
    cd ~/.config/hellwal/
    make
"
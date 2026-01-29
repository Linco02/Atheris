# створення директорій
mkdir assets
mkdir assets/wallpaper 
mkdir assets/hellwal

# копіювання шпалер
cp -r ../assets/wallpaper/* ~/assets/wallpaper/

# завантаження hellwal
nix-shell -p gcc imlib2 xorg.libX11 --run "
    git clone https://github.com/danihek/hellwal ~/assets/hellwal/ || true
    cd ~/assets/hellwal
    make
"
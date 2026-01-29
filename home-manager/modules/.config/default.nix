{ pkgs, ... }:

{
  imports = [
    ./hypr
    ./kitty
    ./rofi
    ./waybar
  ];

  home.pointerCursor = 
    let 
      getFrom = url: hash: name: {
        gtk.enable = true;
        x11.enable = true;
        name = name;
        size = 24;
        package = 
          # імпортувати з github
          # pkgs.runCommand "moveUp" {} ''
          #   mkdir -p $out/share/icons
          #   ln -s ${pkgs.fetchzip {
          #     url = url;
          #     hash = hash;
          #   }} $out/share/icons/${name}
          # '';

          # імпортувати з директорії assets
          pkgs.runCommand "install-local-cursor" {} ''
            mkdir -p $out/share/icons/${name}
            cp -r ${path}/. $out/share/icons/${name}
          '';
      };
    in
      # github
      # getFrom 
      #   "https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.7/Bibata-Modern-Ice.tar.xz"
      #   "sha256-SG/NQd3K9DHNr9o4m49LJH+UC/a1eROUjrAQDSn3TAU="
      #   "Bibata-Modern-Ice";

      # assets
      getFromPath pkgs ../../polarnight-cursors "polarnight-cursors";
}
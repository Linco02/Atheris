{ pkgs, config, homeStateVersion, user, hostname, inputs, ... }:

{
  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
    extraOutputsToInstall = [ "man" ];

    # курсор
    pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";

      gtk.enable = true;
      x11.enable = true;
      hyprcursor.enable = true;
      sway.enable = true;

      size = 24;
      hyprcursor.size = 24;
    };
  };

  services.dunst.enable = false;
}
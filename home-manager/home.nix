{ pkgs, config, homeStateVersion, user, hostname, ... }:

{
  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;

    # курсор
    pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";

      gtk.enable = true;
      x11.enable = true;
      hyprcursor.enable = true;
      sway.enable = true;

      size = 30;
      hyprcursor.size = 30;
    };
  };

  nixpkgs.config.allowUnfree = true;
  services.dunst.enable = true;
}
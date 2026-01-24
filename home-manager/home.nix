{ pkgs, homeStateVersion, user, ... }:

{
  imports = [
    ./.config
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };

  services.dunst.enable = true;
}
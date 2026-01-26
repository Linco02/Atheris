{ pkgs, homeStateVersion, user, hostname, ... }:

{
  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };

  services.dunst.enable = true;
}
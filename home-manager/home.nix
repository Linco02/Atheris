{ pkgs, homeStateVersion, user, homename, ... }:

{
  imports = [
    ./.config
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };
}
{ pkgs, homeStateVersion, user, homename, ... }:

{
  imports = [
    ./pkgs/${homename}
    ./.config
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };

  services.dunst.enable = true;
}
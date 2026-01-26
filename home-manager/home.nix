{ pkgs, homeStateVersion, user, hostname, ... }:

{
  imports = [
    ./modules
  ]
  ++ lib.optional (builtins.pathExists ./users/${hostname}/modules)
    ./users/${hostname}/modules
  ++ lib.optional (builtins.pathExists ./users/${hostname}/pkgs)
    ./users/${hostname}/pkgs;

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };

  services.dunst.enable = true;
}
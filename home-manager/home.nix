{ pkgs, homeStateVersion, user, hostname, ... }:

{
  imports = [
    ./modules
  ]
  ++ lib.optional (builtins.pathExists (./users + "/${hostname}/modules.nix")) ./users/${hostname}/modules.nix
  ++ lib.optional (builtins.pathExists (./users + "/${hostname}/packages.nix")) ./users/${hostname}/packages.nix;

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };

  services.dunst.enable = true;
}
{ pkgs, config, homeStateVersion, user, hostname, ... }:

{
  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };

  nixpkgs.config.allowUnfree = true;
  services.dunst.enable = true;
}
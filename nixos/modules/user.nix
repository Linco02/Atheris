{ pkgs, user, ... }:

{  
  users.users.${user} = {
    isNormalUser = true;
    description = "User ${user}";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.fish;
  };
}
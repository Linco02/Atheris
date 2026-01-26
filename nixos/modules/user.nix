{ pkgs, user, ... }:

{  
  users.users.${user} = {
    isNormalUser = true;
    description = "User ${user}";
    extraGroups = [ "wheel" "networkmanager" "libvirtd" ];
    shell = pkgs.fish;
  };
}
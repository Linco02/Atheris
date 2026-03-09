{ pkgs, user, ... }:

{  
  users.users.${user} = {
    isNormalUser = true;
    description = "User ${user}";
    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
      "docker"
      "plugdev"
      "i2c"
    ];
    shell = pkgs.fish;
  };
}
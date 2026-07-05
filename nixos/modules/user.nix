{ pkgs, user, ... }:

{  
  users.users.${user} = {
    isNormalUser = true;
    description = "User ${user}";
    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
      "kvm"
      "docker"
      "plugdev"
      "i2c"
      "input"
      "video"
      "uinput"
    ];
    shell = pkgs.fish;
  };
}
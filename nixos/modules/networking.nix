{ hostname, ... }:

{
  # Налаштування мережі
  networking = {
    firewall = {
      enable = false;
      allowedTCPPorts = [ 59100 47998 48000 ];
      allowedUDPPorts = [ 59100 59200 47998 48000 ];
    };

    hostName = hostname;
    networkmanager.enable = true;
  };
}
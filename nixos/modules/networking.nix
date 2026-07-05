{ hostname, ... }:

{
  # Налаштування мережі
  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [ 59100 ];
      allowedUDPPorts = [ 59100 59200 ];
    };

    hostName = hostname;
    networkmanager.enable = true;
  };
}
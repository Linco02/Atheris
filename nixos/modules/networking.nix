{ hostname, ... }:

{
  # Налаштування мережі
  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [ 59100 27040 ];
      allowedUDPPorts = [ 59100 59200 27040 ];
    };

    hostName = hostname;
    networkmanager.enable = true;
  };
}
{ hostname, ... }:

{
  # Налаштування мережі
  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [ 59100 27036 24070 27037 ];
      allowedUDPPorts = [ 59100 59200 24070 27031 27032 27033 27034 27035 27036 ];
    };

    hostName = hostname;
    networkmanager.enable = true;
  };
}
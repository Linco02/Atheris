{ hostname, ... }:

{
  # Налаштування мережі
  networking = {
    firewall = {
      enable = true;
    };

    hostName = hostname;
    networkmanager.enable = true;
  };
}
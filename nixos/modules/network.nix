{ hostname, ... }:

{
  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [  ];
    };

    hostName = hostname;
    networkmanager.enable = true;
  };
}
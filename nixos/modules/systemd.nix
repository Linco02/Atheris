{ pkgs, lib, ... }:

{
  systemd = {
    user.services = { 
      polkit-gnome-authentication-agent-1 = {
        description = "polkit-gnome-authentication-agent-1";
        wantedBy = [ "graphical-session.target" ];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };

      sunshine = {
        serviceConfig = {
          # Примусово вказуємо Sunshine використовувати лише карту AMD (card1)
          # та виключаємо спроби звернутися до Nvidia (card2), які викликали краш
          Environment = [
            "WLR_DRM_DEVICES=/dev/dri/card1"
            "LIBVA_DRIVER_NAME=radeonsi"
          ];
        };
      };

      dunst.enable = false;
    };

    services.virt-secret-init-encryption.enable = true;
  };
}
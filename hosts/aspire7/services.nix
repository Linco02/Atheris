# { config, pkgs, sunshine, ... }:

{ config, pkgs, sunshine, ... }:

{
  services = {
    flatpak.enable = true;
    upower.enable = true;
    # fprintd = {
    #   enable = true;
    #   tod = {
    #     enable = true;
    #     driver = pkgs.libfprint-2-tod1-elan;
    #   };
    # };
    seatd.enable = true;

    sunshine = {
      enable = true;
      autoStart = false;
      capSysAdmin = true; 
      openFirewall = true;
      
      # Беремо готовий пакет з нестабільного каналу
      # package = pkgs-unstable.sunshine;
    };

    tailscale.enable = true;

    udev.extraRules = ''
      KERNEL=="uinput", GROUP="input", MODE="0660", OPTIONS+="static_node=uinput"

      # VKMS card -> seat1
      SUBSYSTEM=="drm", KERNEL=="card1", ATTR{dev}=="226:1", TAG+="seat", ENV{ID_SEAT}="seat1"

      # Sunshine virtual input devices -> seat1
      SUBSYSTEM=="input", ATTRS{name}=="mouse-passthrough*", TAG+="seat", ENV{ID_SEAT}="seat1"
      SUBSYSTEM=="input", ATTRS{name}=="keyboard-passthrough", TAG+="seat", ENV{ID_SEAT}="seat1"

      # # 1. Головна відеокарта NVIDIA для seat1 (додаємо теги master та seat)
      # DEVPATH=="/devices/pci0000:00/0000:00:01.1/0000:01:00.0/drm/card0", ENV{ID_SEAT}="seat1", TAG+="seat", TAG+="master"
      # # 2. Перенесення клавіатури Hator Rockfall 2 за її точним файлом
      # KERNEL=="event8", SUBSYSTEM=="input", ENV{ID_SEAT}="seat1", TAG+="seat"
      # # 3. Перенесення миші VGN/Compx за її точним файлом
      # KERNEL=="event7", SUBSYSTEM=="input", ENV{ID_SEAT}="seat1", TAG+="seat"
    '';
  };
}

# let
#   # Використовуємо фіксований зріз unstable з хешем, щоб Flakes не сварився в pure mode
#   pkgs-unstable = import (fetchTarball {
#     url = "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
#     # Цей хеш змусить Flakes довіряти завантаженню
#     sha256 = "sha256:1wyxdpvr89578sq48m2ibz6kkb6z4if8ywflq6z3vy1dwy9ljwn6"; 
#   }) {
#     config = config.nixpkgs.config;
#   };
# in {
#   services = {
#     flatpak.enable = true;
#     upower.enable = true;
#     # fprintd = {
#     #   enable = true;
#     #   tod = {
#     #     enable = true;
#     #     driver = pkgs.libfprint-2-tod1-elan;
#     #   };
#     # };

#     sunshine = {
#       enable = true;
#       autoStart = false;
#       capSysAdmin = true; 
#       openFirewall = true;
      
#       # Беремо готовий пакет з нестабільного каналу
#       package = pkgs-unstable.sunshine;
#     };

#     tailscale.enable = true;

#     udev.extraRules = ''
#       KERNEL=="uinput", GROUP="input", MODE="0660", OPTIONS+="static_node=uinput"
#     '';
#   };
# }

# { config, pkgs, system, ... }:

# let
#   # Використовуємо фіксований зріз unstable з хешем
#   pkgs-unstable = import (fetchTarball {
#     url = "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
#     sha256 = "sha256:1wyxdpvr89578sq48m2ibz6kkb6z4if8ywflq6z3vy1dwy9ljwn6"; 
#   }) {
#     # Явно вказуємо архітектуру системи, щоб Flakes не сварився на currentSystem
#     localSystem = { inherit system; };
#     config = config.nixpkgs.config;
#   };
# in {
#   services = {
#     flatpak.enable = true;
#     upower.enable = true;
#     # fprintd = {
#     #   enable = true;
#     #   tod = {
#     #     enable = true;
#     #     driver = pkgs.libfprint-2-tod1-elan;
#     #   };
#     # };

#     sunshine = {
#       enable = true;
#       autoStart = false;
#       capSysAdmin = true; 
#       openFirewall = true;
      
#       # Беремо готовий пакет з нестабільного каналу
#       package = pkgs-unstable.sunshine;
#     };

#     tailscale.enable = true;

#     udev.extraRules = ''
#       KERNEL=="uinput", GROUP="input", MODE="0660", OPTIONS+="static_node=uinput"

#     '';
#   };
# }
{ user, ... }:

{
  services = {
    # Менеджер сповіщень
    dunst.enable = true;

    # Bluetooth менеджер
    blueman.enable = true;

    # Налаштування файлової системи та мініатюр
    gvfs.enable = true;
    udisks2.enable = true;
    tumbler.enable = true;

    # Greetd налаштування для Hyprland
    greetd = {
      enable = true;
      settings.default_session = {
        command = "Hyprland";
        user = user;
      };
    };

    # Налаштування звуку
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = false;
      wireplumber.enable = true;

      # Підтримки Bluetooth для звуку 
      extraConfig.pipewire."bluez5".properties = {
        "bluez5.enable-msbc" = true;
        "bluez5.enable-hw-volume" = true;
        "bluez5.codecs" = [ "aac" "sbc" ];
      };
    };
  };
}
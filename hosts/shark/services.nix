{ pkgs, ... }:

{
  services = {
    flatpak.enable = true;
    upower.enable = true;

    # Керування підсвіткою
    hardware = {
      openrgb = {
        enable = true;
        package = pkgs.openrgb-with-all-plugins;
      };
    };

    udev.extraRules = ''
      SUBSYSTEMS=="usb", ATTRS{idVendor}=="0db0", ATTRS{idProduct}=="0076", MODE="0666", GROUP="users"
    '';

    ollama = {
      enable = true;
      package = pkgs.ollama-rocm;
      loadModels = ["llama3.1:8b" "qwen2.5-coder:14b"];
      rocmOverrideGfx = "10.3.0";
    };
    
    open-webui.enable = true;
  };
}
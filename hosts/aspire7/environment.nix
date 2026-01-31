{
  environment.sessionVariables = {
    # Змушує Electron-додатки використовувати Wayland замість XWayland
    NIXOS_OZONE_WL = "1";
    
    # Допомагає Java-додаткам (Minecraft) не "губити" курсор
    _JAVA_AWT_WM_NONREPARENTING = "1";
    
    # Ваша попередня змінна (якщо NVIDIA)
    WLR_NO_HARDWARE_CURSORS = "1";
  };
}
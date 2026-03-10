{
  xdg.configFile."matugen/config.toml".text = ''
    [config]
    default_mode = "dark"

    [templates.hypr]
    input_path = '/home/linco02/.config/atheris/templates/hypr.mustache'
    output_path = '/home/linco02/.cache/atheris/hypr.conf'
    template_type = "Command"

    [templates.qml]
    input_path = '/home/linco02/.config/atheris/templates/palette.json.mustache'
    output_path = '/home/linco02/.cache/atheris/palette.json'
    template_type = "Json"

    [templates.rofi]
    input_path = '/home/linco02/.config/atheris/templates/rofi.mustache'
    output_path = '/home/linco02/.cache/atheris/rofi.rasi'
  '';
}
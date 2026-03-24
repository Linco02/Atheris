{
  xdg.configFile."matugen/config.toml".text = ''
    [config]
    default_mode = "dark"

    [templates.hypr]
    input_path = '~/Atheris/assets/matugen/hypr.mustache'
    output_path = '/tmp/atheris/hypr.conf'
    template_type = "Command"

    [templates.qml]
    input_path = '~/Atheris/assets/matugen/palette.json.mustache'
    output_path = '/tmp/atheris/palette.json'
    template_type = "Json"

    [templates.rofi]
    input_path = '~/Atheris/assets/matugen/rofi.mustache'
    output_path = '/tmp/atheris/rofi.rasi'

    [templates.openrgb]
    input_path = '~/Atheris/assets/matugen/openrgb.mustache'
    output_path = '/tmp/atheris/openrgb.sh'
    template_type = "Command"
  '';
}
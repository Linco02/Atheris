{
  xdg.configFile."matugen/config.toml".text = ''
    [config]
    default_mode = "dark"

    [templates.codium]
    input_path = '~/Atheris/assets/matugen/codium.mustache'
    output_path = '/home/linco02/.vscode-oss/extensions/matugen-theme/theme.json'
    template_type = "Json"
    
    [templates.gtk]
    input_path = '~/Atheris/assets/matugen/gtk.mustache'
    output_path = '/tmp/atheris/gtk.css'
    template_type = "Css"

    [templates.hypr]
    input_path = '~/Atheris/assets/matugen/hypr.mustache'
    output_path = '/tmp/atheris/hypr.conf'
    template_type = "Command"

    [templates.kitty]
    input_path = '~/Atheris/assets/matugen/kitty.mustache'
    output_path = '/tmp/atheris/kitty-colors.conf'

    [templates.openrgb]
    input_path = '~/Atheris/assets/matugen/openrgb.mustache'
    output_path = '/tmp/atheris/openrgb.sh'
    template_type = "Command"

    [templates.pywalfox]
    input_path = '~/Atheris/assets/matugen/pywalfox.mustache'
    output_path = '/tmp/atheris/pywalfox.sh'
    template_type = "Command"

    [templates.qml]
    input_path = '~/Atheris/assets/matugen/palette.json.mustache'
    output_path = '/tmp/atheris/palette.json'
    template_type = "Json"

    [templates.rofi]
    input_path = '~/Atheris/assets/matugen/rofi.mustache'
    output_path = '/tmp/atheris/rofi.rasi'

    [templates.qt6ct]
    input_path = '~/Atheris/assets/matugen/qt6ct.mustache'
    output_path = '/tmp/atheris/qt6ct.conf'
  '';
}
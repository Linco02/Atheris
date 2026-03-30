{ config, pkgs, inputs, ... }:

let
  marketplace = inputs.nix-vscode-extensions.extensions.${pkgs.stdenv.hostPlatform.system}.vscode-marketplace;
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      userSettings = {
        "workbench.colorTheme" = "Matugen";
        "git.confirmSync" = false;
        "git.enableSmartCommit" = true;
        "git.postCommitCommand" = "none";
        "workbench.editorAssociations" = {
          "{git,gitlens,chat-editing-snapshot-text-model,copilot,git-graph,git-graph-3}:/**/*.qrc" = "default";
          "{git,gitlens,chat-editing-snapshot-text-model,copilot,git-graph,git-graph-3}:/**/*.ui" = "default";
          "*.qrc" = "qt-core.qrcEditor";
        };
      };
      extensions = with marketplace; [
        arrterian.nix-env-selector
        batisteo.vscode-django
        bbenoist.nix
        bradlc.vscode-tailwindcss
        brettm12345.nixfmt-vscode
        ecmel.vscode-html-css
        jnoortheen.nix-ide
        ms-python.debugpy
        ms-python.python
        # ms-python.vscode-pylance
        njpwerner.autodocstring
        ritwickdey.liveserver
        visualstudioexptteam.intellicode-api-usage-examples
        visualstudioexptteam.vscodeintellicode
        wholroyd.jinja
        zainchen.json
        aykutsarac.jsoncrack-vscode
        bbenoist.qml
        dlasagno.rasi
        donjayamanne.python-environment-manager
        donjayamanne.python-extension-pack
        jmkrivocapich.drawfolderstructure
        # ms-python.vscode-python-envs
        nextbook.file-and-folder-icons
        theqtcompany.qt-core
        theqtcompany.qt-qml
        wayou.vscode-todo-highlight
        clinyong.vscode-css-modules
        davidwang.ini-for-vscode
        eriklynd.json-tools
        fireblast.hyprlang-vscode
        kevinrose.vsc-python-indent
        mohsen1.prettify-json
        visbydev.folder-path-color
        mkhl.direnv
      ];
    };
  };

  home.file.".vscode-oss/extensions/matugen-theme/package.json".text = builtins.toJSON {
    name = "matugen-theme";
    displayName = "Matugen Theme";
    description = "Dynamic Material You theme";
    version = "1.0.0";
    publisher = "linco02";
    engines.vscode = "^1.0.0";
    contributes.themes = [{
      label = "Matugen";
      uiTheme = "vs-dark";
      path = "./theme.json";
    }];
  };
}

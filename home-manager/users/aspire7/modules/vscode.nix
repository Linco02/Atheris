{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      arrterian.nix-env-selector
      batisteo.vscode-django
      bbenoist.nix
      bradlc.vscode-tailwindcss
      brettm12345.nixfmt-vscode
      ecmel.vscode-html-css
      github.copilot
      github.copilot-chat
      jnoortheen.nix-ide
      ms-python.debugpy
      ms-python.python
      ms-python.vscode-pylance
      njpwerner.autodocstring
      ritwickdey.liveserver
      visualstudioexptteam.intellicode-api-usage-examples
      visualstudioexptteam.vscodeintellicode
      wholroyd.jinja
      zainchen.json
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "jsoncrack-vscode";
        publisher = "aykutsarac";
        version = "5.0.0";
        sha256 = "sha256-SwgUm6rIEp15Lc86UHTD5gVHrs9Mwbcwsb7LL5SGVy4=";
      }

      {
        name = "qml";
        publisher = "bbenoist";
        version = "1.0.0";
        sha256 = "sha256-tphnVlD5LA6Au+WDrLZkAxnMJeTCd3UTyTN1Jelditk=";
      }

      {
        name = "rasi";
        publisher = "dlasagno";
        version = "1.0.0";
        sha256 = "sha256-s60alej3cNAbSJxsRlIRE2Qha6oAsmcOBbWoqp+w6fk=";
      }

      {
        name = "python-environment-manager";
        publisher = "donjayamanne";
        version = "1.2.7";
        sha256 = "sha256-w3csu6rJm/Z6invC/TR7tx6Aq5DD77VM62nem8/QMlg=";
      }

      {
        name = "python-extension-pack";
        publisher = "donjayamanne";
        version = "1.7.0";
        sha256 = "sha256-ewOw6nMVzNSYddLcCBGKVNvllztFwhEtncE2RFeFcOc=";
      }

      {
        name = "drawfolderstructure";
        publisher = "jmkrivocapich";
        version = "1.4.6";
        sha256 = "sha256-oQblpTx1zMQGlKLb5X55zLITlp1y41m/1PReAobl96Y=";
      }

      {
        name = "vscode-python-envs";
        publisher = "ms-python";
        version = "1.17.10261015";
        sha256 = "sha256-jzawlB4fKNvu4hRJ+pMy1rO0KRSrDdY6egAwcuPc/64=";
      }

      {
        name = "file-and-folder-icons";
        publisher = "nextbook";
        version = "1.0.4";
        sha256 = "sha256-PzEiRmY1Mt3BNRpPiwk9vFW+qIKhQ3jGwjg2hwrNRPc=";
      }

      {
        name = "qt-core";
        publisher = "theqtcompany";
        version = "1.11.1";
        sha256 = "sha256-PQmNWezNYVGGNFAJrlMRhXHe3o0XV6LxE2omU1mqZM0=";
      }

      {
        name = "qt-qml";
        publisher = "theqtcompany";
        version = "1.11.1";
        sha256 = "sha256-cWS3xUAbPiH/Mqohs0reWNyfMLiSO7tXdIp7/GbTysw=";
      }

      {
        name = "vscode-todo-highlight";
        publisher = "wayou";
        version = "1.0.5";
        sha256 = "sha256-CQVtMdt/fZcNIbH/KybJixnLqCsz5iF1U0k+GfL65Ok=";
      }

      {
        name = "vscode-css-modules";
        publisher = "clinyong";
        version = "0.5.4";
        sha256 = "sha256-Z64k6iFsdj2ICmH3MQOk9p4KLRp/wg+htgMAftvU4TQ=";
      }

      {
        name = "ini-for-vscode";
        publisher = "davidwang";
        version = "0.0.4";
        sha256 = "sha256-ejdb6F0wiYUdJnViHrY2yojsMjrn9war85cdOQtlltk=";
      }

      {
        name = "json-tools";
        publisher = "eriklynd";
        version = "1.0.2";
        sha256 = "sha256-7tBjhcqCUnwOXwjhLK8iYtXH/my6ATpWvgrfDNi8tzw=";
      }

      {
        name = "hyprlang-vscode";
        publisher = "fireblast";
        version = "0.0.3";
        sha256 = "sha256-lSMihMIue0qu9+97EgT5dqjbzsey0TLZDpJby+Piip4=";
      }

      {
        name = "vsc-python-indent";
        publisher = "kevinrose";
        version = "1.21.0";
        sha256 = "sha256-SvJhVG8sofzV0PebZG4IIORX3AcfmErDQ00tRF9fk/4=";
      }

      {
        name = "prettify-json";
        publisher = "mohsen1";
        version = "0.0.3";
        sha256 = "sha256-lvds+lFDzt1s6RikhrnAKJipRHU+Dk85ZO49d1sA8uo=";
      }

      {
        name = "folder-path-color";
        publisher = "visbydev";
        version = "0.0.16";
        sha256 = "sha256-2MYZkCg8+Jm9puugYFEXi1YhIZdTzDILR44aUbguzvY=";
      }
    ];
  };
}

{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    # package = pkgs.vscodium;
    profiles.default.extensions = (with pkgs.vscode-extensions; [
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
    ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "jsoncrack-vscode";
        publisher = "aykutsarac";
        version = "3.0.0";
        sha256 = "sha256-Ob7zs04aYsL0xdvMCZybWEcrZmo96Vhoo7Y63gw0If8=";
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
        sha256 = "sha256-6KzT0/owPLtYdLmi28HujJHwjovYBByIqIvlTpmPpaM=";
      }

      {
        name = "python-extension-pack";
        publisher = "donjayamanne";
        version = "1.7.0";
        sha256 = "sha256-EMd5ejkXUaaTxtSM2oTauvpW9HsZ2PFAnNUzQEshINc=";
      }

      {
        name = "drawfolderstructure";
        publisher = "jmkrivocapich";
        version = "1.4.5";
        sha256 = "sha256-6KljHuk7Vc4WKAwRLze1HTybCnM7S7proDFZbue3oQg=";
      }

      {
        name = "vscode-python-envs";
        publisher = "ms-python";
        version = "1.11.12751011";
        sha256 = "sha256-aYpd8ROwxx5S2H7Sp7dcVO8suNvvQz8N+qivDQpLJ1Q=";
      }

      {
        name = "file-and-folder-icons";
        publisher = "nextbook";
        version = "1.0.4";
        sha256 = "sha256-hGGep/sdXpnNNoLrI6cD8aia3TZ8PcBU6j28TzAOtLg=";
      }

      {
        name = "qt-core";
        publisher = "theqtcompany";
        version = "1.9.0";
        sha256 = "sha256-5Q2qT1He7ec+rOK2G4C2sXTRgWIs1NJdQepwm6d4U9g=";
      }

      {
        name = "qt-qml";
        publisher = "theqtcompany";
        version = "1.9.0";
        sha256 = "sha256-r15cKAnPWcu4q1In/IAr+VW6dgTtP4QqeJpcYu4r4IM=";
      }

      {
        name = "vscode-todo-highlight";
        publisher = "wayou";
        version = "1.0.5";
        sha256 = "sha256-CGWXK7qnQhZsOWJBVXxXqJCYhHZM+FqL66Lt1g/uhLk=";
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
        version = "0.0.1";
        sha256 = "sha256-lSMihMIue0qu9+97EgT5dqjbzsey0TLZDpJby+Piip4=";
      }

      { #
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

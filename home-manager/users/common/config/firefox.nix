{ config, pkgs, user, ... }:

{
  programs.firefox = {
    enable = true;
    languagePacks = ["uk"];
    policies = {
      DefaultDownloadDirectory = "\${user}/Downloads";
    };
    profiles.default = {
      path = "07jo4lrc.default"; 
      isDefault = true;
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };

      userChrome = ''
        @import url("file:///tmp/atheris/firefox-colors.css");

        #navigator-toolbox {
          background-color: var(--m3-bg) !important;
          border-bottom: 1px solid var(--m3-outline) !important;
        }

        #urlbar-background {
          background-color: var(--m3-accent) !important;
          border: 2px solid var(--m3-primary) !important;
          border-radius: 12px !important;
        }

        #urlbar-input, .urlbar-input-box {
          color: var(--m3-fg) !important;
        }

        .tab-background[selected="true"] {
          background-color: var(--m3-primary) !important;
          background-image: none !important;
        }

        .tab-label[selected="true"] {
          color: var(--m3-bg) !important;
          font-weight: bold !important;
        }

        toolbarbutton {
          fill: var(--m3-primary) !important;
          color: var(--m3-primary) !important;
        }
      '';
    };
  };
}
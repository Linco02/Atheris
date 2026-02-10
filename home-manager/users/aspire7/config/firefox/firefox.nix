{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.default = {
      # Add your userChrome.css content directly as a string
      userChrome = ''
        /* Your custom CSS goes here */
        /* Example: hide the tab bar */
        #tabbrowser-tabs {
          visibility: collapse !important;
        }
      '';

      # Optional: You can also manage settings, including the required one from Step 1
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
    };
  };
}
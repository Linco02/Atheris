{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    languagePacks = ["uk"];

    profiles = {
      default = {
        isDefault = true;
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "browser.download.dir" = "${config.home.homeDirectory}/Downloads";
          "browser.download.folderList" = 2;
        };

        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          darkreader
          ublock-origin
          privacy-badger
          pywalfox
          istilldontcareaboutcookies
          simple-translate
        ];
      };
    };
  };
}
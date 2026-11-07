{ lib, ... }:

let
  locale = "uk_UA.UTF-8";  # або "cs_CZ.UTF-8"
in
{
  time.timeZone = "Europe/Prague";  # або "Europe/Kyiv"

  i18n.defaultLocale = locale;
  i18n.extraLocaleSettings = lib.genAttrs [
    "LC_ADDRESS" "LC_IDENTIFICATION" "LC_MEASUREMENT" "LC_MONETARY"
    "LC_NAME" "LC_NUMERIC" "LC_PAPER" "LC_TELEPHONE" "LC_TIME"
  ] (_: locale);
}
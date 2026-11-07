{ ... }:

{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      opener = {
        edit = [
          { run = ''nvim "$@"''; block = true; for = "unix"; }
        ];
      };

      open = {
        rules = [
          { mime = "text/*"; use = "edit"; }
        ];
      };
    };
  };
}

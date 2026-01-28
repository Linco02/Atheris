{ inputs, ... }:

{
  # Home Manager налаштування
  imports = [ inputs.home-manager.nixosModules.default ];
  home-manager.backupFileExtension = "backup";
}

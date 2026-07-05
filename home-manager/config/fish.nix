{ hostname, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      dev = "nix develop ~/Atheris";
      homeS = "home-manager switch --flake ~/Atheris#${hostname}";
      nixosS= "sudo nixos-rebuild switch --flake ~/Atheris#${hostname}";
    };
    generateCompletions = false;
    interactiveShellInit = ''
      microfetch
    '';
  };
}
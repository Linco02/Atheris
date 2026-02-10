{
  programs.fish = {
    enable = true;
    shellAliases = {
      dev = "nix develop ~/Atheris";
      homeS = "home-manager switch --flake ~/Atheris#shark";
      nixosS= "sudo nixos-rebuild switch --flake ~/Atheris#shark";
    };
  };
}
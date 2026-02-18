{
  programs.fish = {
    enable = true;
    shellAliases = {
      dev = "nix develop ~/Atheris";
      homeS = "home-manager switch --flake ~/Atheris#aspire7";
      nixosS= "sudo nixos-rebuild switch --flake ~/Atheris#aspire7";
    };
  };
}
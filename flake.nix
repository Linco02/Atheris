{
  description = "Linco-Flake NIXSYSTEM";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    waybar = {
      url = "github:Alexays/Waybar/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "github:quickshell-mirror/quickshell?ref=v0.2.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, waybar, quickshell, disko, ... }@inputs:
    let
      # Default system for hosts that don't explicitly override it.
      defaultSystem = "x86_64-linux";
      homeStateVersion = "25.05";
      defaultUser = "linco02";
      pkgs = nixpkgs.legacyPackages.${defaultSystem};

      # Build a NixOS system for a host.
      makeSystem = { hostname, stateVersion, system ? defaultSystem }: nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs stateVersion hostname user; };
        modules = [
          inputs.disko.nixosModules.disko
          ./hosts/${hostname}
          ./nixos
        ];
      };

      # Build a Home Manager configuration for a host.
      makeHome = { hostname, user}: home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit nixpkgs home-manager homeStateVersion user hostname; };
        modules = [ ./home-manager/${hostname}/home.nix ];
      };
    in
    {
      nixosConfigurations = {
        aspire7 = makeSystem { user = defaultUser; hostname = "aspire7"; stateVersion = homeStateVersion; };
        mini7   = makeSystem { user = defaultUser; hostname = "mini7";   stateVersion = homeStateVersion; };
      };

      homeConfigurations = {
        "aspire7" = makeHome { user = defaultUser; hostname = "aspire7"; };
        "mini7" = makeHome { user = defaultUser; hostname = "mini7"; };
      };
    };
}


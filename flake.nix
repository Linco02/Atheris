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
      user = "nixlinco";
      pkgs = nixpkgs.legacyPackages.${defaultSystem};

      # Hosts: you can add multiple hosts here; each host may override `system`.
      hosts = [
        { hostname = "aspire7"; stateVersion = homeStateVersion; system = defaultSystem; }
        { hostname = "mini7"; stateVersion = homeStateVersion; system = defaultSystem; }
      ];

      # Build a NixOS system for a host. The `system` argument defaults to `defaultSystem`.
      makeSystem = { hostname, stateVersion, system ? defaultSystem }:
        nixpkgs.lib.nixosSystem {
          system = system;
          # `specialArgs` are visible to modules under ./nixos/*. If you prefer, pass only the
          # specific inputs your modules need instead of the whole `inputs` set.
          specialArgs = {
            inherit inputs stateVersion hostname user;
          };
          modules = [
            ./hosts/${hostname}
            ./nixos
          ];
        };
    in
    {
      # Export the packages set for the default system so other flakes can import it if needed.
      packages = {
        "${defaultSystem}" = pkgs;
      };

      nixosConfigurations = nixpkgs.lib.foldl' (configs: host:
        configs // {
          "${host.hostname}" = makeSystem {
            inherit (host) hostname stateVersion system;
          };
        }) {} hosts;

      homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Pass explicit inputs to the Home Manager modules (prefer this to passing `inputs`).
        extraSpecialArgs = {
          inherit nixpkgs home-manager homeStateVersion user;
        };

        modules = [
          ./home-manager/home.nix
        ];
      };
    };
}


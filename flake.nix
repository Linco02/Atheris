{
  description = "Atheris-Flake by linco02";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nur.url = "github:nix-community/NUR";
    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";

    home-manager = {
      url = "github:nix-community/home-manager";
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

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sunshine = {
      url = "github:LizardByte/Sunshine/v2026.516.143833?submodules=1";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, home-manager, quickshell, disko, nix-vscode-extensions, nur, millennium, sunshine, ... }@inputs:
    let
      # Default system for hosts that don't explicitly override it.
      defaultSystem = "x86_64-linux";
      homeStateVersion = "25.11";
      defaultUser = "linco02";
      # pkgs = nixpkgs.legacyPackages.${defaultSystem};

      pkgs = import nixpkgs {
        system = defaultSystem;
        config.allowUnfree = true;
        overlays = [
          inputs.nur.overlays.default
          inputs.millennium.overlays.default
          (final: prev: {
            quickshell = prev.quickshell.overrideAttrs (old: {
              buildInputs = old.buildInputs ++ [ final.qt6.qtmultimedia ];
              cmakeFlags = (old.cmakeFlags or []) ++ [ "-DQUICKSHELL_MULTIMEDIA=ON" ];
            });
          })
        ];
      };

      # devShell
      developer = import ./nixos/devShell.nix { inherit pkgs; };

      # Build a NixOS system for a host.
      makeSystem = { user, hostname, stateVersion, system ? defaultSystem }: nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs stateVersion hostname user; };
        modules = [
          inputs.disko.nixosModules.disko
          ./hosts/${hostname}
          ./nixos
          {
            nixpkgs.pkgs = pkgs;
            system.stateVersion = stateVersion;
          }
        ];
      };

      # Build a Home Manager configuration for a host.
      makeHome = { hostname, user}: home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit nixpkgs inputs nur home-manager quickshell homeStateVersion user hostname; };
        modules = [
          ./home-manager/home.nix
          ./home-manager/config
          ./home-manager/pkgs
        ];
      };
    in
    {
      nixosConfigurations = {
        aspire7 = makeSystem { user = defaultUser; hostname = "aspire7"; stateVersion = homeStateVersion; };
        shark = makeSystem { user = defaultUser; hostname = "shark";   stateVersion = homeStateVersion; };
      };

      homeConfigurations = {
        "aspire7" = makeHome { user = defaultUser; hostname = "aspire7"; };
        "shark" = makeHome { user = defaultUser; hostname = "shark"; };
      };

      devShells.${defaultSystem}.default = pkgs.mkShell {
        nativeBuildInputs = developer.tools;
        buildInputs = developer.libs ++ developer.editors;

        shellHook = ''
          echo "Режим devShell!"
        '';
      };
    };
}
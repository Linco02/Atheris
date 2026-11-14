{
  description = "Atheris-Flake by linco02";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-26.05";
    nur.url = "github:nix-community/NUR";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    quickshell = {
      url = "github:quickshell-mirror/quickshell";
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

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    qml-language-server.url = "github:cushycush/qml-language-server";

    claude-code.url = "github:sadjow/claude-code-nix";
  };

  outputs = { self, nixpkgs, home-manager, quickshell, disko, nix-vscode-extensions, nur, sunshine, hyprland, nixvim, claude-code, ... }@inputs:
    let
      # Default system for hosts that don't explicitly override it.
      defaultSystem = "x86_64-linux";
      homeStateVersion = "26.05";
      user = "linco02";
      # pkgs = nixpkgs.legacyPackages.${defaultSystem};

      pkgs = import nixpkgs {
        system = defaultSystem;
        config.allowUnfree = true;
        overlays = [
          inputs.nur.overlays.default
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
      makeSystem = { hostname, stateVersion, system ? defaultSystem }: nixpkgs.lib.nixosSystem {
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
      makeHome = { hostname }: home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs homeStateVersion user hostname; };
        modules = [
          ./home-manager/home.nix
          ./home-manager/config
          ./home-manager/pkgs
          nixvim.homeModules.nixvim
        ];
      };
    in
    {
      nixosConfigurations = {
        aspire7 = makeSystem { hostname = "aspire7"; stateVersion = homeStateVersion; };
        shark = makeSystem { hostname = "shark";   stateVersion = homeStateVersion; };
      };

      homeConfigurations = {
        "aspire7" = makeHome { hostname = "aspire7"; };
        "shark" = makeHome { hostname = "shark"; };
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
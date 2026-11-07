# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A personal NixOS flake configuration ("Atheris") for two machines (`aspire7`, `shark`), using Home Manager, Hyprland, and a matugen-driven theming pipeline. There is no application source code to build/lint/test in the traditional sense — "testing" a change means building/activating the NixOS or Home Manager configuration. Comments inside `.nix` files are frequently written in Ukrainian.

## Common commands

Build/activate a host's full NixOS system (requires sudo, rebuilds boot entries, services, etc.):
```
sudo nixos-rebuild switch --flake ~/Atheris#<hostname>
```

Apply only the user-level Home Manager config (dotfiles, user packages, Hyprland config, theming):
```
home-manager switch --flake ~/Atheris#<hostname>
```

These aliases are defined in `home-manager/config/fish.nix` (`nixosS`, `homeS`) and only exist once the config is already applied on a machine — don't assume they're available when bootstrapping a fresh install.

Enter the project devShell (tools for C/C++/Python/Qt development, defined in `nixos/devShell.nix`):
```
nix develop ~/Atheris
```
(aliased to `dev` in fish).

Dry-build / check without activating:
```
nixos-rebuild build --flake ~/Atheris#<hostname>
nix flake check
```

Valid `<hostname>` values are `aspire7` and `shark` (see `flake.nix` `nixosConfigurations` / `homeConfigurations`).

Initial disk partitioning for a fresh install uses disko and is documented in `README.md` (`disko.nix` per host, then `nixos-install --flake .#<profile>`).

## Architecture

### Flake entry point (`flake.nix`)
- Defines two parallel output trees per host: `nixosConfigurations.<hostname>` (system-level, via `makeSystem`) and `homeConfigurations.<hostname>` (user-level, via `makeHome`, built as a **standalone** Home Manager configuration rather than wired in through `home-manager.users.<user>` inside the NixOS module — the two are applied independently with separate commands, see above).
- `pkgs` is built once centrally in `flake.nix` with overlays (`nur`, `millennium`, and a patched `quickshell` with Qt multimedia enabled) and passed down to both system and home builds — don't re-import `nixpkgs` inside submodules.
- `defaultUser` (`linco02`) and `homeStateVersion` are set once here and threaded through `specialArgs`/`extraSpecialArgs` to every module.

### System layer (`nixos/`)
- `nixos/default.nix` just imports `./modules` and `./pkgs`.
- `nixos/modules/default.nix` is the single aggregation point for shared system modules (boot, hardware, home-manager glue, networking, nix settings, programs, security, services, systemd, timezone, user, xdg). Add new shared system-level concerns as a new file here and register it in this list.
- `nixos/pkgs/` holds shared system-wide package sets.
- `nixos/devShell.nix` defines the `nix develop` shell (separate from any host/home package set).

### Host layer (`hosts/<hostname>/`)
- Each host has its own `default.nix` that imports only the host-specific modules it needs — the two hosts are **not** symmetric (e.g. `aspire7` has `nvidia.nix`, `shark` has `amd.nix`/`boot.nix`/`filesystem.nix`). Check the host's own `default.nix` import list before assuming a module applies to both.
- `hardware-configuration.nix` is machine-generated (filesystems/UUIDs) — treat as generated, not hand-authored.
- `disco.nix` is the disko declarative-partitioning config for that host.
- Mirrors of the same concern (`programs.nix`, `security.nix`, `services.nix`, `virtualisation.nix`) exist per-host and are intentionally separate from the shared `nixos/modules/` versions — host-specific overrides/additions live here, not in the shared modules.

### Home Manager layer (`home-manager/`)
- `home.nix` sets core `home.*` options (username, stateVersion, cursor theme, session vars) — this is the top-level file passed into `makeHome`.
- `home-manager/config/default.nix` aggregates per-app configs (fish, git, gtk, qt, kitty, codium, firefox, rofi, cava, vim, hyprland, matugen). Add new app configs as a new file here and register it in the import list.
- `home-manager/pkgs/default.nix` aggregates user package sets (`fonts.nix`, `game.nix`, `shell.nix`, `utils.nix`).
- `home-manager/config/hyprland.nix` is the Hyprland window manager config; it sources live theme colors from `/tmp/atheris/hypr.conf`, which is generated at runtime by matugen (not checked into the repo).

### Theming pipeline (`assets/matugen/` + `home-manager/config/matugen.nix`)
- matugen generates a color palette (from wallpaper) and renders it through Mustache templates in `assets/matugen/` into various target configs/scripts, all written at runtime under `/tmp/atheris/` (gtk.css, hypr.conf, kitty-colors.conf, rofi.rasi, qt6ct.conf, palette.json, openrgb.sh, pywalfox.sh) plus one persistent target for the Codium theme extension. `home-manager/config/matugen.nix` is the authoritative mapping of template → output path/type — update both the template and this file together when adding a new themed target.
- `assets/scripts/` contains standalone shell/python helpers (monitor init, wallpaper switching, Hyprland/Sunshine seat startup, asset install) that are invoked from Hyprland `exec-once`/keybinds or run manually, not managed as Nix derivations.

## Notes
- `assets/wallpaper` is gitignored — wallpapers are not versioned with the config.
- There's a sibling project, `Atheris-shell` (quickshell QML, launched from `hyprland.nix`'s `exec-once`), that is a separate repo and not part of this one.

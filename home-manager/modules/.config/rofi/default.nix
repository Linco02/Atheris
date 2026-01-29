{ inputs, config, pkgs, ... }:

{
	programs.rofi = {
		enable = true;
		package = pkgs.rofi;
		plugins = with pkgs; [
			rofi-calc
			pkgs.rofi-emoji
		];

		# Змінні
		extraConfig = {
			modi = "drun,filebrowser";
			combi-modi = "drun,filebrowser";
			show-icons = true;
			icon-theme = "Papirus-Dark";
			display-drun = "󰊗  Apps";
			display-filebrowser = "  FileBrowser";
			drun-display-format = "{name}";
		};

		# тема
		theme = let
			inherit (config.lib.formats.rasi) mkLiteral;
		in {
			"@import" = "/home/nixlinco/.cache/hellwal/rofi.rasi";

			"*" = {
				font = "JetBrainsMono Nerd Font 16";
			};

			"window" = {
				border = mkLiteral "1px";
				padding = mkLiteral "20px";
			};

			"message" = {
				border = mkLiteral "2px 0px 0px";
			};

			"listview" = {
				padding = mkLiteral "2px 0px";
				columns = 2;
				border = mkLiteral "2px 0px 0px";
				scrollbar = true;
			};

			"element" = {
				padding = mkLiteral "2px 0px";
				spacing = mkLiteral "10px";
			};

			"element-icon" = {
				size = mkLiteral "32px";
			};

			"scrollbar" = {
				handle-width = mkLiteral "5px";
			};

			"inputbar" = {
				padding = mkLiteral "2px 0px";
			};
		};
	};

	# nixpkgs.overlays = [
	# 	(final: prev: {
	# 		rofi-calc = prev.rofi-calc.override {
	# 			rofi-unwrapped = prev.rofi-wayland-unwrapped;
	# 		};
	# 	})
	# ];
}
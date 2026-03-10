{ inputs, config, pkgs, ... }:

{
	programs.rofi = {
		enable = true;
		package = pkgs.rofi;
		plugins = with pkgs; [
			rofi-calc
			rofi-emoji
		];

		# Змінні
		extraConfig = {
			modi = "drun,filebrowser,emoji,calc";
			combi-modi = "drun,filebrowser,emoji,calc";
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
			"@import" = "~/.cache/atheris/rofi.rasi";

			"*" = {
				font = "JetBrainsMono Nerd Font 16";
				background-color = mkLiteral "@bg";
      	text-color = mkLiteral "@fg";
			};

			"window" = {
				border = mkLiteral "2px";
				border-color = mkLiteral "@acc";
				border-radius = mkLiteral "15px";
				padding = mkLiteral "20px";
				background-color = mkLiteral "@bg";
			};

			"message" = {
				border = mkLiteral "2px 0px 0px";
				background-color = mkLiteral "transparent";
			};

			"listview" = {
				padding = mkLiteral "2px 0px";
				columns = 2;
				border = mkLiteral "2px 0px 0px";
				scrollbar = true;
				border-color = mkLiteral "@acc";
			};

			"element" = {
				padding = mkLiteral "2px 0px";
				spacing = mkLiteral "10px";
			};

			"element selected" = {
				background-color = mkLiteral "@acc";
			};

			"element-icon" = {
				size = mkLiteral "32px";
				background-color = mkLiteral "transparent";
			};

			"element-text" = {
				background-color = mkLiteral "transparent";
			};

			"scrollbar" = {
				handle-width = mkLiteral "5px";
				background-color = mkLiteral "@acc";
			};

			"inputbar" = {
				padding = mkLiteral "2px 0px";
			};
		};
	};
}
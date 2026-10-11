{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    # Системні пакетні залежності для LSP / форматерів / Treesitter
    extraPackages = with pkgs; [
      lua-language-server
      nil # LSP для Nix
      ripgrep # Потрібен для швидкого пошуку через Telescope
      fd
    ];

    # Декларативні плагіни NixOS
    plugins = with pkgs.vimPlugins; [
      # Синтаксис та підсвітка
      nvim-treesitter.withAllGrammars

      # Пошук файлів та коду
      telescope-nvim

      # Навігація
      neo-tree-nvim
      nvim-web-devicons

      oil-nvim
      nvim-web-devicons
      # Інтерфейс та підказки
      which-key-nvim
      lualine-nvim
    ];

    # Підключення Lua-конфігу
    initLua = ''
      -- Встановлюємо Space як Leader
      vim.g.mapleader = " "

      -- Базові налаштування
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.shiftwidth = 2
      vim.opt.tabstop = 2
      vim.opt.expandtab = true

      -- Налаштування Which-Key
      require("which-key").setup()

      -- Налаштування Neo-tree (Space + e)
      -- vim.keymap.set('n', '<leader>e', ':NeoTreeRevealToggle<CR>', { silent = true })
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
      -- Налаштування Telescope (Space + ff, Space + fg)
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    '';
  };
}

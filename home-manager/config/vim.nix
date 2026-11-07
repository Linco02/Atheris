{ ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    # Базові опції Neovim (vim.opt)
    opts = {
      number = true;         # Показувати номери рядків
      relativenumber = true; # Відносні номери рядків (зручно для Vim-навігації)
      shiftwidth = 2;        # Розмір відступу
      tabstop = 2;
      expandtab = true;      # Пробіли замість Tab
      smartindent = true;
      termguicolors = true;  # Truecolor підтримка
      ignorecase = true;     # Ігнорувати регістр при пошуку
      smartcase = true;      # Зважати на регістр, якщо є великі літери
      cursorline = true;     # Підсвічувати поточний рядок
    };

    # Глобальна клавіша-лідер
    globals.mapleader = " ";

    # Підключення та налаштування плагінів
    plugins = {
      # Синтаксис та підсвічування
      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
        };
      };

      bufferline = {
        enable = true;
      };

      # Швидкий пошук (Telescope)
      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fg" = "live_grep";
          "<leader>fb" = "buffers";
          "<leader>fh" = "help_tags";
        };
      };

      # Дерево файлів (Neo-tree)
      neo-tree = {
        enable = true;
        settings = {
          closeIfLastWindow = true;
          filesystem.filteredItems.visible = true;
        };
      };

      # Автодоповнення (blink-cmp або nvim-cmp)
      cmp = {
        enable = true;
        settings = {
          autoEnableSources = true;
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
          ];
          mapping = {
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Tab>" = "cmp.mapping.select_next_item()";
            "<S-Tab>" = "cmp.mapping.select_prev_item()";
          };
        };
      };

      # Вбудований LSP підтягує сервери безпосередньо з nixpkgs
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;         # LSP для Nix
          lua_ls.enable = true;       # LSP для Lua
          bashls.enable = true;       # LSP для Bash/Fish scripts
          # Тут можна увімкнути будь-які інші мови: ts_ls, pyright, clangd тощо
        };
      };

      # Підказки для клавішних скорочень
      which-key.enable = true;

      # Статус-бар
      lualine.enable = true;

      # Автозакриття дужок
      nvim-autopairs.enable = true;
    };

    # Приклад прив'язки власних гарячих клавіш
    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Neotree toggle<CR>";
        options.desc = "Переключити Neo-tree";
      }
    ];
  };
}
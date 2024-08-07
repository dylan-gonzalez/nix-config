{ pkgs, ... }:

let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    ref = "main";
  });

in

{

  imports = [ nixvim.homeManagerModules.nixvim ];

  programs.nixvim = {
    enable = true;
    globals.mapleader = ",";

    clipboard.register = "unnamedplus";

    opts = {
      number = true;
      shiftwidth = 2;
      expandtab = true;
      tabstop = 2;
      mouse = "a";
    };

    keymaps = [
      {
        key = "jk";
        mode = "i";
        action = "<Esc>";
      }
      {
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<cr>";
      }
      {
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep<cr>";
      }
      {
        key = "<leader>fh";
        action = "<cmd>Telescope help_tags<cr>";
      }
    ];

    extraPlugins = with pkgs.vimPlugins; [
      vim-nix
      vim-devicons
    ];

    defaultEditor = true;

    colorschemes.gruvbox.enable = true;

    plugins = {
      startify.enable = true;
      #lightline.enable = true;
      neo-tree.enable = true;
      nvim-autopairs.enable = true;
      none-ls.enable = true;
      telescope.enable = true;
      lsp = {
        enable = true;
        servers = {
          html.enable = true;
          yamlls.enable = true;
          tsserver.enable = true;
        };
      };

      cmp = {
        enable = true;
        settings = {
          autoEnableSources = true;
          experimental = { ghost_text = true; };
          performance = {
            debounce = 60;
            fetchingTimeout = 200;
            maxViewEntries = 30;
          };

          snippet = { expand = "luasnip"; };
          formatting = { fields = [ "kind" "abbr" "menu" ]; };
          sources = [
            { name = "nvim_lsp"; }
            { name = "emoji"; }
            {
              name = "buffer"; # text within current buffer
              option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
              keywordLength = 3;
            }
            {
              name = "luasnip"; # snippets
              keywordLength = 3;
            }
          ];

          window = {
            completion = { border = "solid"; };
            documentation = { border = "solid"; };
          };

          mapping = {
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<C-j>" = "cmp.mapping.select_next_item()";
            "<C-k>" = "cmp.mapping.select_prev_item()";

            "<C-e>" = "cmp.mapping.abort()";
            "<C-b>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
          };

          cmp-nvim-lsp = { enable = true; }; # lsp
          cmp-buffer = { enable = true; };
          cmp-path = { enable = true; }; # file system paths
          cmp_luasnip = { enable = true; }; # snippets
          cmp-cmdline = { enable = false; }; # autocomplete for cmdline

        };
      };
    };

    viAlias = true;
    vimAlias = true;
  };
}

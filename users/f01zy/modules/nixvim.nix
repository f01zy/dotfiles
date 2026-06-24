{ pkgs, ... }: {
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    globals.mapleader = " ";

    opts = {
      number = true;
      relativenumber = false;
      shiftwidth = 2;
    };

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        transparent_background = true;
      };
    };

    plugins = {
      wakatime.enable = true;
      cmp-nvim-lsp.enable = true;
      nvim-tree.enable = true;
      web-devicons.enable = true;
      dressing.enable = true;
      gitsigns.enable = true;
      nvim-autopairs.enable = true;

      inc-rename = {
        enable = true;
        settings = {
          cmd_name = "IncRename";
        };
      };

      telescope = {
        enable = true;
        settings = {
          defaults = {
            file_ignore_patterns = [
              "^.git/"
              "^node_modules/"
              "target/"
            ];
            layout_config = {
              horizontal = {
                preview_width = 0.55;
              };
            };
          };
        };

        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fg" = "live_grep";
          "<leader>fb" = "buffers";
          "<leader>fh" = "help_tags";
        };
      };

      lualine = {
        enable = true;
        settings = {
          options = {
            disabled_filetypes = {
              __unkeyed-1 = "NvimTree";
              __unkeyed-2 = "alpha";
            };
            section_separators = {
              left = "";
              right = "";
            };
            component_separators = {
              left = "";
              right = "";
            };
            globalstatus = true;
          };
        };
      };

      lsp = {
        enable = true;
        servers = {
          clangd.enable = true;
          nixd.enable = true;
        };
      };

      cmp = {
        enable = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
          ];
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Tab>" = "cmp.mapping.select_next_item()";
            "<S-Tab>" = "cmp.mapping.select_prev_item()";
          };
        };
      };

      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            c = [ "clang-format" ];
            nix = [ "nixfmt" ];
          };
          format_on_save = {
            lsp_fallback = true;
            timeout_ms = 500;
          };
        };
      };

      alpha = {
        enable = true;
        theme = "dashboard";
      };

      bufferline = {
        enable = true;
        settings.options = {
          diagnostics = "nvim_lsp";
          offsets = [
            {
              filetype = "NvimTree";
              text = "File Explorer";
              text_align = "left";
              separator = true;
            }
          ];
        };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<C-s>";
        action = "<cmd>w<CR>";
        options = {
          silent = true;
          desc = "Save buffer";
        };
      }
      {
        mode = "n";
        key = "<C-n>";
        action = "<cmd>NvimTreeToggle<CR>";
        options = {
          silent = true;
          desc = "Toggle NvimTree";
        };
      }
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>NvimTreeFocus<CR>";
        options = {
          silent = true;
          desc = "Focus NvimTree";
        };
      }
      {
        mode = "n";
        key = "<leader>rn";
        action.__raw = "function() return ':IncRename ' .. vim.fn.expand('<cword>') end";
        options = {
          expr = true;
          desc = "LSP Incremental Rename";
        };
      }
      {
        mode = "n";
        key = "<Tab>";
        action = "<cmd>BufferLineCycleNext<CR>";
        options = {
          silent = true;
          desc = "Go to next buffer";
        };
      }
      {
        mode = "n";
        key = "<S-Tab>";
        action = "<cmd>BufferLineCyclePrev<CR>";
        options = {
          silent = true;
          desc = "Go to previous buffer";
        };
      }
      {
        mode = "n";
        key = "<leader>x";
        action = "<cmd>bdelete<CR>";
        options = {
          silent = true;
          desc = "Close current buffer";
        };
      }
    ];
  };
}

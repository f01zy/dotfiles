{ ... }: {
  programs.nixvim.plugins.alpha = {
    enable = true;
    settings = {
      layout = [
        {
          type = "padding";
          val = 4;
        }
        {
          type = "text";
          val = [
            "███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
            "████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
            "██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
            "██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
            "██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
            "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
          ];
          opts = {
            hl = "Type";
            position = "center";
          };
        }
        {
          type = "padding";
          val = 2;
        }
        {
          type = "group";
          val.__raw = ''
            (function()
              local leader = "SPC"
              
              local function make_button(sc, txt, keybind)
                local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")
                local opts = {
                  position = "center",
                  shortcut = sc,
                  cursor = 3,
                  width = 50,
                  align_shortcut = "right",
                  hl_shortcut = "Keyword",
                }
                
                if keybind then
                  opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true, nowait = true } }
                end

                local function on_press()
                  local key = vim.api.nvim_replace_termcodes(keybind or (sc_ .. "<Ignore>"), true, false, true)
                  vim.api.nvim_feedkeys(key, "t", false)
                end

                return {
                  type = "button",
                  val = txt,
                  on_press = on_press,
                  opts = opts,
                }
              end

              return {
                make_button("e",       "  New file",              "<cmd>ene <CR>"),
                make_button("SPC f f", "󰈞  Find file",             "<cmd>Telescope find_files<CR>"),
                make_button("SPC f h", "󰋚  Recently opened files", "<cmd>Telescope oldfiles<CR>"),
                make_button("SPC f g", "󰈬  Find word",             "<cmd>Telescope live_grep<CR>"),
                make_button("SPC f m", "  Jump to bookmarks",     "<cmd>Telescope marks<CR>"),
              }
            end)()
          '';
          opts = {
            spacing = 1;
          };
        }
        {
          type = "padding";
          val = 2;
        }
        {
          type = "text";
          val = "Even if you reject me, even if you deny me, i will never forget you.";
          opts = {
            position = "center";
            hl = "Keyword";
          };
        }
      ];
      opts = {
        margin = 5;
      };
    };
  };
}

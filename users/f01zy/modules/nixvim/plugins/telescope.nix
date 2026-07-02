{ ... }: {
  programs.nixvim.plugins.telescope = {
    enable = true;
    settings = {
      defaults = {
        file_ignore_patterns = [
          "^.git/"
          "^node_modules/"
          "target/"
        ];
      };
    };
    keymaps = {
      "<leader>ff" = "find_files";
      "<leader>fg" = "live_grep";
      "<leader>fb" = "buffers";
      "<leader>fh" = "help_tags";
    };
  };
}

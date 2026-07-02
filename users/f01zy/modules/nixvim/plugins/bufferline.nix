{ ... }: {
  programs.nixvim.plugins.bufferline = {
    enable = true;
    settings.options = {
      sort_by = "insert_at_end";
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
}

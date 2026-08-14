{ ... }: {
  imports = [
    ./alpha.nix
    ./telescope.nix
    ./bufferline.nix
    ./formatters.nix
    ./cord.nix
  ];

  programs.nixvim.plugins = {
    wakatime.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;
    nvim-tree.enable = true;
    web-devicons.enable = true;
    dressing.enable = true;
    gitsigns.enable = true;
    nvim-autopairs.enable = true;

    auto-session = {
      enable = true;
      settings = {
        autoRestore.enabled = true;
        autoSave.enabled = true;
      };
    };

    inc-rename = {
      enable = true;
      settings = {
        cmd_name = "IncRename";
      };
    };

    toggleterm = {
      enable = true;
      settings = {
        direction = "horizontal";
        size = 10;
      };
    };
  };
}

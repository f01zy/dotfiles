{ ... }: {
  imports = [
    ./plugins/main.nix
    ./keymaps.nix
  ];

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
        integrations = {
          cmp = true;
          nvimtree = true;
        };
      };
    };

    diagnostic.settings = {
      signs = false;
      virtual_text = {
        spacing = 4;
        prefix = "●";
      };
      underline = true;
      severity_sort = true;
    };
  };
}

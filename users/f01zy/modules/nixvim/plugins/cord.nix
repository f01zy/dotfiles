{ ... }: {
  programs.nixvim.plugins.cord = {
    enable = true;
    settings = {
      display = {
        flavor = "dark";
        theme = "catppuccin";
        view = "asset";
      };
      editor = {
        client = "neovim";
        tooltip = "The Superior Text Editor";
      };
    };
  };
}

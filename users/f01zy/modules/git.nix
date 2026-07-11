{ ... }: {
  programs.git = {
    enable = true;
    settings.alias = {
      ci = "commit";
      co = "checkout";
      s = "status";
    };
  };
}

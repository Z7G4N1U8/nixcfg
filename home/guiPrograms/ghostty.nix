{
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    installBatSyntax = true;

    settings = {
      adjust-box-thickness = 1;
      adjust-cursor-thickness = 1;

      confirm-close-surface = false;
      gtk-titlebar = false;

      window-padding-x = 7;
      window-padding-y = 7;
      window-padding-balance = true;
    };
  };
}

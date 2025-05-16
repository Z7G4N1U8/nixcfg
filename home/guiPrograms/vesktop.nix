{
  programs.vesktop = {
    enable = true;

    settings = {
      arRPC = true;
      customTitleBar = true;
      discordBranch = "stable";
      enableSplashScreen = false;
      hardwareAcceleration = true;
      minimizeToTray = true;
    };

    vencord.settings = {
      autoUpdate = false;
      autoUpdateNotification = false;
      notifyAboutUpdates = false;
      useQuickCss = true;
      themeLinks = [
        "https://raw.githubusercontent.com/refact0r/midnight-discord/refs/heads/master/themes/flavors/midnight-catppuccin-mocha.theme.css"
      ];
      transparent = true;
    };
  };

  home.file.".config/vesktop/settings/quickCss.css".text = ''
    #app-mount {
      border-radius: 25px !important;
      background-color: transparent !important;
    }
  '';
}

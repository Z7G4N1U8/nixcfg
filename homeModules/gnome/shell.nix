{
  pkgs,
  ...
}:

{
  programs.gnome-shell = {
    enable = true;
    extensions = [
      { package = pkgs.gnomeExtensions.paperwm; }
      { package = pkgs.gnomeExtensions.dash-to-dock; }
    ];
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          paperwm.extensionUuid
          dash-in-panel.extensionUuid
          user-themes.extensionUuid
        ];
        favorite-apps = [
          "zen.desktop"
          "com.mitchellh.ghostty.desktop"
          "org.telegram.desktop.desktop"
          "vesktop.desktop"
          "dev.zed.Zed.desktop"
        ];
      };
    };
  };
}

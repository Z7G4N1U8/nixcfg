{
  pkgs,
  user,
  ...
}:

{
  programs.gnome-shell = {
    enable = true;
    extensions = [
      { package = pkgs.gnomeExtensions.caffeine; }
      { package = pkgs.gnomeExtensions.dash-to-dock; }
      { package = pkgs.gnomeExtensions.boost-volume; }
      { package = pkgs.gnomeExtensions.paperwm; }
    ];
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          caffeine.extensionUuid
          dash-to-dock.extensionUuid
          paperwm.extensionUuid
          user-themes.extensionUuid
        ];
        favorite-apps = [
          "zen-beta.desktop"
          "com.mitchellh.ghostty.desktop"
          "org.telegram.desktop.desktop"
          "vesktop.desktop"
          "smartcode-stremio.desktop"
          "io.github.giantpinkrobots.varia.desktop"
          "org.gnome.Nautilus.desktop"
          "org.gnome.Extensions.desktop"
          "protonvpn-app.desktop"
          "dev.zed.Zed.desktop"
          "org.gnome.Settings.desktop"
        ];
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
      "org/gnome/desktop/background" = {
        picture-uri = "file://${user.assets}/wallpapers/sakura-pink-sword-wallpaper.png";
        picture-uri-dark = "file://${user.assets}/wallpapers/sakura-pink-sword-wallpaper.png";
      };
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };
}

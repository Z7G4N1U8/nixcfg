{
  dconf.settings = {

    "org/gnome/settings-daemon/plugins/media-keys".custom-keybindings = [
      "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
      "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
      "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
    ];

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Terminal";
      command = "ghostty";
      binding = "<Super>T";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      name = "Browser";
      command = "zen";
      binding = "<Super>B";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      name = "File Manager";
      command = "nautilus";
      binding = "<Super>E";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
      name = "Editor";
      command = "zeditor nixcfg";
      binding = "<Super><Shift>E";
    };

  };
}

{
  pkgs,
  inputs,
  ...
}:

{
  imports = [ inputs.catppuccin.homeModules.catppuccin ];

  catppuccin = {
    enable = true;
    accent = "blue";
    flavor = "mocha";
    cursors.enable = false;
    kvantum.enable = false;
    vesktop.enable = false;
    gtk.icon.enable = false;
  };

  qt = {
    enable = true;
    style.name = "adwaita";
    platformTheme.name = "adwaita";
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };

  stylix.targets = {
    librewolf = {
      enable = true;
      firefoxGnomeTheme.enable = true;
      profileNames = [ "default" ];
    };
    gtk.enable = true;
    gnome.enable = true;
  };
}

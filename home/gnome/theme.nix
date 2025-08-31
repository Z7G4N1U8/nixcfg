{
  inputs,
  ...
}:

{
  imports = [ inputs.catppuccin.homeModules.catppuccin ];

  catppuccin = {
    enable = true;
    cache.enable = true;
    gtk.icon.enable = false;
  };

  stylix.targets = {
    gtk.enable = true;
    gnome.enable = true;
    zen-browser.enable = true;
  };
}

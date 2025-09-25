{
  inputs,
  ...
}:

{
  imports = [ inputs.catppuccin.homeModules.catppuccin ];

  catppuccin = {
    enable = true;
    gtk.icon.enable = false;
    vesktop.enable = false;
  };

  stylix.targets = {
    gtk.enable = true;
    gnome.enable = true;
  };
}

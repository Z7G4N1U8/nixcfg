{
  inputs,
  ...
}:

{
  imports = [ inputs.catppuccin.homeModules.catppuccin ];

  catppuccin = {
    enable = true;
    accent = "blue";
    flavor = "mocha";
    #cache.enable = true;
    gtk.icon.enable = false;
    vesktop.enable = false;
  };
}

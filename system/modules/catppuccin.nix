{
  inputs,
  ...
}:

{
  imports = [ inputs.catppuccin.nixosModules.catppuccin ];

  catppuccin = {
    enable = true;
    cache.enable = true;
  };
}

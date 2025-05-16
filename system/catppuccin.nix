{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [ inputs.catppuccin.nixosModules.catppuccin ];

  catppuccin = {
    enable = true;
    accent = "blue";
    flavor = "mocha";
  };
}

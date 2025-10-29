{
  inputs,
  ...
}:

{
  imports = [ inputs.niri.nixosModules.niri ];
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  programs.niri.enable = true;
  environment.variables.NIXOS_OZONE_WL = "1";
}

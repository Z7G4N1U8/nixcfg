{
  pkgs,
  inputs,
  ...
}:

{
  services.displayManager.ly.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = 1;

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };
}

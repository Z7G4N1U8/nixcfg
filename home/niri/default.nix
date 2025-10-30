{
  pkgs,
  ...
}:

{
  imports = [
    ./keybinds.nix
    ./settings.nix
    ./theme.nix
  ];

  home.packages = with pkgs; [
    brightnessctl
    wofi
  ];
}

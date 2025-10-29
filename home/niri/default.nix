{
  pkgs,
  ...
}:

{
  imports = [
    ./keybinds.nix
    ./settings.nix
  ];

  home.packages = with pkgs; [
    brightnessctl
    wofi
  ];
}

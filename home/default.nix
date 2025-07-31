{
  pkgs,
  inputs,
  user,
  ...
}:

{
  imports = [
    ./cliPrograms
    ./guiPrograms
    ./hyprland
    ./gnome
  ];

  home = {
    username = "${user.name}";
    homeDirectory = "/home/${user.name}";
    stateVersion = "24.05";
  };

  programs = {
    bat.enable = true;
    btop.enable = true;
    imv.enable = true;
    gitui.enable = true;
    mpv.enable = true;
    obs-studio.enable = true;
  };

  home.packages = with pkgs; [
    catppuccinifier-cli
    celluloid
    fragments
    nautilus
    protonvpn-gui
    telegram-desktop
    varia
    inputs.zen-browser.packages.${pkgs.system}.default
  ];

  programs.home-manager.enable = true;
}

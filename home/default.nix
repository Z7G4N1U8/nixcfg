{
  pkgs,
  user,
  ...
}:

{
  imports = [
    ./cliPrograms
    ./guiPrograms
    ./gnome
    ./niri
  ];

  home = {
    username = "${user.name}";
    homeDirectory = "/home/${user.name}";
    stateVersion = "24.05";
  };

  programs = {
    bat.enable = true;
    btop.enable = true;
  };

  home.packages = with pkgs; [
    celluloid
    materialgram
    google-chrome
    protonvpn-gui
    varia
  ];

  programs.home-manager.enable = true;
}

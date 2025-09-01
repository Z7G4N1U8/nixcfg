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
    protonvpn-gui
    stremio
    telegram-desktop
    varia
  ];

  programs.home-manager.enable = true;
}

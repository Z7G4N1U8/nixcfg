{
  pkgs,
  ...
}:

{
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.gnome.excludePackages = with pkgs; [
    epiphany
    geary
    gnome-tour
    gnome-text-editor
    gnome-common
    gnome-console
    gnome-contacts
    gnome-logs
    gnome-maps
    gnome-software
    gnome-weather
    gnome-music
    gnome-connections
    seahorse
    totem
    yelp
  ];
}

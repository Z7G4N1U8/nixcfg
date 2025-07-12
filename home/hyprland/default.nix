{
  pkgs,
  ...
}:

{
  imports = [
    ./animations.nix
    ./anyrun.nix
    ./keybinds.nix
    ./settings.nix
    ./windowrules.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    systemd.variables = [ "--all" ];
  };

  home.packages = with pkgs; [
    brightnessctl
    clipse
    hyprshot
    playerctl
    wl-clipboard
    kdePackages.qt6ct
    kdePackages.qtwayland
  ];

  services = {
    blueman-applet.enable = true;
    gnome-keyring.enable = true;
    network-manager-applet.enable = true;
    udiskie.enable = true;
    mako = {
      enable = true;
      settings = {
        anchor = "top-center";
        borderRadius = 8;
        borderSize = 4;
        height = 300;
        width = 600;
        defaultTimeout = 5000;
      };
    };
  };

}

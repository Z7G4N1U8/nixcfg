{
  config,
  lib,
  pkgs,
  inputs,
  user,
  ...
}:

{
  imports = [
    inputs.stylix.homeManagerModules.stylix
    inputs.catppuccin.homeManagerModules.catppuccin
  ];

  catppuccin = {
    enable = true;
    accent = "blue";
    flavor = "mocha";
    cursors.enable = false;
  };

  stylix = {
    enable = true;
    autoEnable = false;
    image = ../../assets/wallpapers/nixos-catppuccin-mocha.png;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    # override.base04 = "b6d1fc";

    cursor = {
      name = "Bibata-Modern-Classic";
      size = 20;
      package = pkgs.bibata-cursors;
    };

    opacity = {
      applications = 1.0;
      desktop = 1.0;
      popups = 1.0;
      terminal = 1.0;
    };

    fonts = {
      monospace = {
        name = "JetBrainsMonoNF-SemiBold";
        package = pkgs.nerd-fonts.jetbrains-mono;
      };

      sizes = {
        applications = 10;
        desktop = 10;
        popups = 10;
        terminal = 12;
      };
    };

    targets = {
      gtk.enable = true;
      gnome.enable = true;
    };
  };

  qt = {
    enable = true;
    style.name = "kvantum";
    platformTheme.name = "kvantum";
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };

}

{
  pkgs,
  inputs,
  ...
}:

{
  imports = [ inputs.stylix.nixosModules.stylix ];

  stylix = {
    enable = true;
    image = ../../assets/wallpapers/nixos-catppuccin-mocha.png;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

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
      serif = {
        name = "Adwaita Sans";
        package = pkgs.adwaita-fonts;
      };

      sansSerif = {
        name = "Adwaita Sans";
        package = pkgs.adwaita-fonts;
      };

      monospace = {
        name = "JetBrainsMonoNF-SemiBold";
        package = pkgs.nerd-fonts.jetbrains-mono;
      };

      sizes = {
        applications = 11;
        desktop = 10;
        popups = 10;
        terminal = 12;
      };
    };

  };
}

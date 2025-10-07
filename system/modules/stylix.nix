{
  pkgs,
  inputs,
  ...
}:

{
  imports = [ inputs.stylix.nixosModules.stylix ];

  stylix = {
    enable = true;
    autoEnable = true;
    image = ../../assets/wallpapers/dark-star.jpg;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    override = {
      base00 = "#161b22";
      base01 = "#30363d";
      base02 = "#484f58";
      base03 = "#6e7681";
      base04 = "#8b949e";
      base05 = "#c9d1d9";
      base06 = "#f0f6fc";
    };

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
        name = "JetBrainsMono Nerd Font";
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

{
  description = "NixOS Flake Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    anyrun.url = "github:anyrun-org/anyrun";
    catppuccin.url = "github:catppuccin/nix";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    yazi.url = "github:sxyazi/yazi";
    yazi-plugins = {
      url = "github:yazi-rs/plugins";
      flake = false;
    };
  };

  nixConfig = {
    extra-substituters = [
      "https://anyrun.cachix.org"
      "https://catppuccin.cachix.org"
      "https://hyprland.cachix.org"
      "https://yazi.cachix.org"
    ];
    extra-trusted-public-keys = [
      "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
      "catppuccin.cachix.org-1:noG/4HkbhJb+lUAdKrph6LaozJvAeEEZj4N732IysmU="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k="
    ];
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      user = {
        name = "peace";
        host = "nixos";
        system = "x86_64-linux";
        assets = "$HOME/nixcfg/assets";
        email = "121939750+SomeEmptyBox@users.noreply.github.com";
      };
    in
    {

      nixosConfigurations = {
        ${user.host} = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs user; };
          modules = [ ./config.nix ];
        };

        nixiso = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs user; };
          modules = [ ./nixiso.nix ];
        };
      };

    };
}

{
  description = "NixOS Flake Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    yazi-plugins = {
      url = "github:yazi-rs/plugins";
      flake = false;
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    extra-substituters = [
      "https://catppuccin.cachix.org"
      "https://niri.cachix.org"
    ];
    extra-trusted-public-keys = [
      "catppuccin.cachix.org-1:noG/4HkbhJb+lUAdKrph6LaozJvAeEEZj4N732IysmU="
      "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
    ];
  };

  outputs =
    inputs:
    let
      user = {
        name = "peace";
        host = "laptop";
        system = "x86_64-linux";
        assets = "/home/${user.name}/nixcfg/assets";
        email = "121939750+Z7G4N1U8@users.noreply.github.com";
      };
    in
    {

      nixosConfigurations = {
        ${user.host} = inputs.nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs user; };
          modules = [ ./system/default.nix ];
        };

        nixiso = inputs.nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs user; };
          modules = [ ./system/iso.nix ];
        };
      };

    };
}

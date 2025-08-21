{
  description = "NixOS Flake Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    catppuccin.url = "github:catppuccin/nix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
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

  outputs =
    inputs:
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

{
  pkgs,
  user,
  ...
}:

{
  programs.helix = {

    enable = true;
    defaultEditor = true;

    settings.editor = {
      mouse = false;
      true-color = true;
      bufferline = "multiple";
      lsp = {
        display-inlay-hints = true;
        display-messages = true;
      };
      cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };

    extraPackages = with pkgs; [
      nixd
      nixfmt-rfc-style
    ];

    languages = {

      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "nixfmt";
          language-servers = [ "nixd" ];
        }
      ];

      language-server.nixd = {
        command = "nixd";
        args = [ "--inlay-hints=true" ];
        config.nixd = {
          nixpkgs.expr = "import (builtins.getFlake \"/home/${user.name}/nixcfg\")inputs.nixpkgs { }";
          options = {
            nixos.expr = "(builtins.getFlake \"/home/${user.name}/nixcfg\").nixosConfigurations.${user.host}.options";
            home_manager.expr = "(builtins.getFlake \"/home/${user.name}/nixcfg\").nixosConfigurations.${user.host}.options.home-manager.users.type.getSubOptions []";
          };
          diagnostic.suppress = [ "sema-extra-with" ];
        };
      };

    };

  };
}

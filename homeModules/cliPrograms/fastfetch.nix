{
  pkgs,
  user,
  ...
}:

{
  programs.fastfetch = {

    enable = true;
    package = pkgs.fastfetch;

    settings = {

      display = {
        separator = " ";
        # key.paddingLeft = 3;
        size.binaryPrefix = "si";
      };

      logo = {
        preserveAspectRatio = true;
        source = "${user.assets}/logos/nix-cat.png";
        type = "kitty";
        height = 9;
        padding.left = 1;
      };

      modules = [

        "break"
        {
          key = " ";
          type = "os";
          keyColor = "blue";
          format = "{3}";
        }

        {
          key = "󰌽 ";
          type = "kernel";
          keyColor = "yellow";
          format = "{1} {2} ({4})";
        }

        {
          key = "󰅐 ";
          type = "uptime";
          keyColor = "green";
        }

        {
          key = " ";
          type = "memory";
          keyColor = "white";
        }

        # {
        #   key = " ";
        #   keyColor = "blue";
        #   type = "btrfs";
        #   # format = "{1} / {2} ({3})";
        # }

        {
          key = " ";
          type = "packages";
          keyColor = "red";
        }

        {
          key = " ";
          type = "wm";
          keyColor = "cyan";
        }

        {
          key = " ";
          type = "colors";
          keyColor = "magenta";
          symbol = "circle";
        }
      ];

    };

  };
}

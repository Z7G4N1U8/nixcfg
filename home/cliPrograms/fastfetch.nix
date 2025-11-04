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
        size.binaryPrefix = "si";
      };

      logo = {
        preserveAspectRatio = true;
        source = "${user.assets}/logos/nix.png";
        recache = true;
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
          key = " ";
          type = "wm";
          keyColor = "cyan";
        }

        {
          key = " ";
          type = "memory";
          keyColor = "white";
        }

        {
          key = " ";
          keyColor = "red";
          type = "btrfs";
          format = "{5} / {7} ({8})";
        }

        {
          key = " ";
          type = "uptime";
          keyColor = "green";
          format = "{6} ({2}h, {3}m)";
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

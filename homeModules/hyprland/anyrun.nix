{
  inputs,
  pkgs,
  ...
}:

{
  imports = [ inputs.anyrun.homeManagerModules.default ];

  programs.anyrun = {
    enable = true;

    config = {
      x.fraction = 0.5;
      y.fraction = 0.5;
      width.absolute = 600;
      height.absolute = 400;
      hideIcons = false;
      hidePluginInfo = true;
      showResultsImmediately = true;
      layer = "overlay";
      closeOnClick = true;
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        dictionary
        rink
        shell
        symbols
        websearch
      ];
    };

    extraConfigFiles = {
      "websearch.ron".text = ''
        Config(
          prefix: "?",
          engines: [ DuckDuckGo ]
        )
      '';

      "dictionary.ron".text = ''
        Config(
          prefix: ":df",
          max_entries: 5,
        )
      '';
    };

    extraCss = ''
      * {
        transition: 200ms ease;
        font-family: JetBrainsMono Nerd Font;
        font-weight: bold;
        font-size: 16px;
      }

      #window,
      #match,
      #entry,
      #plugin,
      #main {
        background: transparent;
      }

      #match:selected {
        background: rgb(17, 17, 27);
      }

      #entry,
      #plugin:hover {
        border-radius: 8px;
        background: rgb(17, 17, 27);
      }

      #match {
        padding: 3px;
        border-radius: 8px;
      }

      box#main {
        background: rgb(30, 30, 46);
        border: 3px solid rgb(137, 180, 250);
        border-radius: 16px;
        padding: 8px;
      }
    '';

  };
}

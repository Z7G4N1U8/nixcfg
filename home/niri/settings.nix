{
  programs.niri.settings = {

    outputs."eDP-1" = {
      mode = {
        width = 1920;
        height = 1080;
        refresh = 60.0;
      };
      position = {
        x = 0;
        y = 0;
      };
      scale = 1.0;
    };

    prefer-no-csd = true;

    cursor.theme = "Bibata-Modern-Classic";
    cursor.size = 20;

    layout = {
      gaps = 15;
      center-focused-column = "always";
      always-center-single-column = true;
      default-column-width.proportion = 1.0;
      border = {
        enable = true;
        width = 3;
        active.color = "#ffffff";
        inactive.color = "#505050";
      };
      focus-ring.enable = false;
      struts = {
        left = 200;
        right = 200;
      };
    };

    window-rules = [
      {
        draw-border-with-background = false;
        geometry-corner-radius = {
          top-left = 12.0;
          top-right = 12.0;
          bottom-left = 12.0;
          bottom-right = 12.0;
        };
        clip-to-geometry = true;
      }
    ];

  };
}

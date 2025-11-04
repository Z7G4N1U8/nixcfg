{
  pkgs,
  user,
  inputs,
  ...
}:
let
  random-wall = pkgs.writeShellApplication {
    name = "random-wall";
    runtimeInputs = [ pkgs.swww ];
    text = ''
      swww-daemon &

      export SWWW_TRANSITION=center
      export SWWW_TRANSITION_FPS=60
      export SWWW_TRANSITION_STEP=2

      while true; do
        swww img "$(find ${user.assets}/wallpapers -type f | shuf -n 1)"
        sleep "30"
      done
    '';
  };
in
{
  imports = [ inputs.catppuccin.homeModules.catppuccin ];

  catppuccin = {
    enable = true;
    accent = "blue";
    flavor = "mocha";
    #cache.enable = true;
    gtk.icon.enable = false;
    vesktop.enable = false;
  };

  home.packages = [ "${random-wall}" ];
}

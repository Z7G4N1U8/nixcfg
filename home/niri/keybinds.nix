{
  config,
  ...
}:

{
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Mod+A".action = spawn-sh "wofi --show drun";
    "Mod+B".action = spawn "zen";
    "Mod+E".action = spawn "nautilus";
    "Mod+T".action = spawn "ghostty";

    "Mod+Shift+E".action = spawn "zeditor";

    "Mod+H".action = focus-column-left;
    "Mod+L".action = focus-column-right;
    "Mod+Shift+H".action = move-column-left;
    "Mod+Shift+L".action = move-column-right;

    "Mod+J".action = focus-workspace-down;
    "Mod+K".action = focus-workspace-up;
    "Mod+Shift+J".action = move-window-to-workspace-down;
    "Mod+Shift+K".action = move-window-to-workspace-up;

    "Mod+Q".action = close-window;
    "Mod+Shift+Q".action = quit;

    "Mod+Minus".action = set-column-width "-10%";
    "Mod+Equal".action = set-column-width "+10%";

    "Mod+F".action = toggle-windowed-fullscreen;
    "Mod+Shift+F".action = fullscreen-window;

    "Print".action.screenshot = [ ];
    "Shift+Print".action.screenshot-window = [ ];
    "Mod+Print".action.screenshot-screen = [ ];

    "XF86MonBrightnessUp".action = spawn-sh "brightnessctl set 10%+";
    "XF86MonBrightnessDown".action = spawn-sh "brightnessctl set 10%-";

    "XF86AudioMute".action = spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
    "XF86AudioRaiseVolume".action = spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+";
    "XF86AudioLowerVolume".action = spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
  };
}

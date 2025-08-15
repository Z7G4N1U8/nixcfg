{
  programs.librewolf.profiles.default.settings = {
    "browser.toolbars.bookmarks.visibility" = "never";
    "privacy.resistFingerprinting" = false;
    "privacy.clearOnShutdown.cookies" = false;
    "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
    "privacy.donottrackheader.enabled" = true;

    # firefox gnome theme
    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
    "browser.uidensity" = 0;
    "svg.context-properties.content.enabled" = true;
    "browser.theme.dark-private-windows" = false;
    "widget.gtk.rounded-bottom-corners.enabled" = true;
    "gnomeTheme.hideSingleTab" = false;
    "gnomeTheme.bookmarksToolbarUnderTabs" = true;
    "gnomeTheme.dragWindowHeaderbarButtons" = true;
    "gnomeTheme.oledBlack" = true;
    "layers.acceleration.force-enabled" = true;

    "browser.uiCustomization.state" = ''
      {
        "placements":{
          "unified-extensions-area":["ublock0_raymondhill_net-browser-action"],
          "nav-bar":["back-button","forward-button","stop-reload-button","new-tab-button","customizableui-special-spring1","urlbar-container","customizableui-special-spring2","downloads-button","unified-extensions-button"],
          "TabsToolbar":["tabbrowser-tabs"],
          "PersonalToolbar":["import-button","personal-bookmarks"]
        },
        "currentVersion":69
      }
    '';

  };
}

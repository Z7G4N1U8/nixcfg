{
  programs.firefox.profiles.default.settings = {
    "accessibility.typeaheadfind" = true;
    "dom.security.https_only_mode" = true;
    "extensions.autoDisableScopes" = 0;
    "browser.toolbars.bookmarks.visibility" = "never";
    # "privacy.resistFingerprinting" = false;
    # "privacy.clearOnShutdown.cookies" = false;
    # "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
    "privacy.donottrackheader.enabled" = true;
    "extensions.update.autoUpdateDefault" = false;
    "browser.tabs.tabbar.hidden" = true;
    "browser.download.autohideButton" = false;

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
          "unified-extensions-area":["78272b6fa58f4a1abaac99321d503a20_proton_me-browser-action","vpn_proton_ch-browser-action","_7a7a4a92-a2a0-41d1-9fd7-1e92480d612d_-browser-action","ublock0_raymondhill_net-browser-action"],
          "nav-bar":["back-button","forward-button","stop-reload-button","new-tab-button","customizableui-special-spring1","vertical-spacer","urlbar-container","customizableui-special-spring2","downloads-button","unified-extensions-button"],
          "TabsToolbar":["tabbrowser-tabs"],
          "PersonalToolbar":["import-button","personal-bookmarks"]
        },
        "currentVersion":21
      }
    '';
  };
}

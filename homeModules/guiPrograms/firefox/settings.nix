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

    # firefox gnome theme
    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
    "browser.uidensity" = 0;
    "svg.context-properties.content.enabled" = true;
    "browser.theme.dark-private-windows" = false;
    "widget.gtk.rounded-bottom-corners.enabled" = true;
    "gnomeTheme.hideSingleTab" = true;
    "gnomeTheme.bookmarksToolbarUnderTabs" = true;
    "gnomeTheme.dragWindowHeaderbarButtons" = true;
    "gnomeTheme.oledBlack" = true;
    "layers.acceleration.force-enabled" = true;
  };
}

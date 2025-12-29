{
  inputs,
  ...
}:
let
  mkSearchEngine = alias: name: url: {
    name = name;
    value = {
      urls = [ { template = url; } ];
      definedAliases = [ alias ];
    };
  };
  mkExtension = name: guid: private: {
    name = guid;
    value = {
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/${name}/latest.xpi";
      installation_mode = "normal_installed";
      private_browsing = private;
    };
  };
  mkBookmark = keyword: name: url: { inherit keyword name url; };
in
{
  imports = [ inputs.zen-browser.homeModules.default ];

  programs.zen-browser = {
    enable = true;
    profiles.default = {
      name = "default";
      id = 0;
      isDefault = true;

      bookmarks = {
        force = true;
        settings = [
          (mkBookmark "gh" "GitHub" "https://github.com")
          (mkBookmark "st" "Stremio" "https://web.stremio.com")
          (mkBookmark "yt" "YouTube" "https://youtube.com")
        ];
      };

      search = {
        force = true;
        default = "google";
        engines = builtins.listToAttrs [
          (mkSearchEngine "gh" "GitHub" "https://github.com/search?q={searchTerms}")
          (mkSearchEngine "hm" "Home Manager" "https://home-manager-options.extranix.com?query={searchTerms}&release=master")
          (mkSearchEngine "np" "NixOS Packages" "https://search.nixos.org/packages?channel=unstable&query={searchTerms}")
          (mkSearchEngine "no" "NixOS Options" "https://search.nixos.org/options?channel=unstable&query={searchTerms}")
          (mkSearchEngine "nw" "NixOS Wiki" "https://wiki.nixos.org/w/index.php?search={searchTerms}")
        ];
      };

      settings = {
        "zen.welcome-screen.seen" = true;
        "zen.view.experimental-no-window-controls" = true;
        "dom.security.https_only_mode" = true;
        "browser.search.separatePrivateDefault" = false;
        "network.trr.mode" = 3;
        "network.trr.uri" = "https://cloudflare-dns.com/dns-query";
        "extensions.formautofill.creditCards.enabled" = false;
        "signon.rememberSignons" = false;
      };
    };

    policies.ExtensionSettings = builtins.listToAttrs [
      (mkExtension "bitwarden-password-manager" "{446900e4-71c2-419f-a6a7-df9c091e268b}" true)
      (mkExtension "chrome-mask" "chrome-mask@overengineer.dev" false)
      (mkExtension "traduzir-paginas-web" "{036a55b4-5e72-4d05-a06c-cba2dfcc134a}" false)
      (mkExtension "ublock-origin" "uBlock0@raymondhill.net" true)
    ];
  };
}

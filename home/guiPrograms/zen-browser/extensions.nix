let
  mkExt = name: id: private: {
    name = id;
    value = {
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/${name}/latest.xpi";
      installation_mode = "normal_installed";
      private_browsing = private;
    };
  };
in
{
  programs.zen-browser.policies.ExtensionSettings = builtins.listToAttrs [
    (mkExt "bitwarden-password-manager" "{446900e4-71c2-419f-a6a7-df9c091e268b}" true)
    (mkExt "chrome-mask" "chrome-mask@overengineer.dev" false)
    (mkExt "traduzir-paginas-web" "{036a55b4-5e72-4d05-a06c-cba2dfcc134a}" false)
    (mkExt "ublock-origin" "uBlock0@raymondhill.net" true)
  ];
}

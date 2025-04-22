{
  imports = [
    ./bookmarks.nix
    ./extensions.nix
    ./policies.nix
    ./searchEngines.nix
    ./settings.nix
  ];

  programs.firefox = {
    enable = true;

    profiles.default = {
      name = "default";
      id = 0;
      isDefault = true;
      search = {
        force = true;
        default = "ddg";
        privateDefault = "ddg";
        order = [ "ddg" ];
      };
    };

  };
}

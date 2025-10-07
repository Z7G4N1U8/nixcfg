{
  inputs,
  ...
}:

{
  imports = [
    inputs.zen-browser.homeModules.default
    ./bookmarks.nix
    ./extensions.nix
    ./searchEngines.nix
    ./settings.nix
  ];

  programs.zen-browser = {
    enable = true;
    profiles.default = {
      name = "default";
      id = 0;
      isDefault = true;
    };
  };
}

{
  imports = [
    ./bookmarks.nix
    ./extensions.nix
    ./searchEngines.nix
    ./settings.nix
  ];

  programs.librewolf = {
    enable = true;
    profiles.default = {
      name = "default";
      id = 0;
      isDefault = true;
      extensions.force = true;
    };
  };
}

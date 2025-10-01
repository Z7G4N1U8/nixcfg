{
  inputs,
  ...
}:

{
  imports = [ inputs.flatpak.nixosModules.default ];

  services.flatpak = {
    enable = true;
    remotes."flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    packages = [ "flathub:app/com.stremio.Service//stable" ];
  };
}

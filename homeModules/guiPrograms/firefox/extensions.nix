{
  pkgs,
  inputs,
  ...
}:

{
  programs.firefox.profiles.default.extensions.packages =
    with inputs.firefox-addons.packages.${pkgs.system}; [
      darkreader
      decentraleyes
      privacy-badger
      proton-pass
      proton-vpn
      stylus
      ublock-origin
    ];
}

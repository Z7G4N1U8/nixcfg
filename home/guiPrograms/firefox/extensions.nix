{
  pkgs,
  inputs,
  ...
}:

{
  programs.firefox.profiles.default.extensions = {
    force = true;
    packages = with inputs.firefox-addons.packages.${pkgs.system}; [
      proton-pass
      proton-vpn
      stylus
      ublock-origin
    ];
  };
}

{
  inputs,
  ...
}:

{
  imports = [ inputs.nix-index.nixosModules.nix-index ];
  programs.nix-index-database.comma.enable = true;
}

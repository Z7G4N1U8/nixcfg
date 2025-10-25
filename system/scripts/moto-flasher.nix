{
  pkgs,
  ...
}:
let
  flash = pkgs.writeShellScriptBin "flash" (builtins.readFile ../../assets/scripts/moto-flasher.sh);
in
{
  environment.systemPackages = [ flash ];
}

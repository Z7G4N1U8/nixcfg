{
  pkgs,
  ...
}:
let
  src = pkgs.fetchFromGitHub {
    owner = "SomeEmptyBox";
    repo = "android_build_utils";
    rev = "1639e5c014e602218d9421ac4a1a276e05275e62";
    hash = "sha256-PqcCuKpTR/inGADt2N50pvlwtvSBDRa0ihhDtCJFMhY=";
  };
  flash = pkgs.writeShellScriptBin "flash" (builtins.readFile "${src}/scripts/flash.sh");
in
{
  environment.systemPackages = [ flash ];
}

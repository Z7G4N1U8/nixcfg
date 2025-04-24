{
  pkgs,
  ...
}:
let
  src = pkgs.fetchFromGitHub {
    owner = "lenowski";
    repo = "ipman";
    rev = "d8fd87422379286750b2ca7d60713a127dca94ee";
    hash = "sha256-uLaoGcXPb79h+BT7jSk6Ubu4X/SCpn1Q2kiAGlJ30AA=";
  };
  ipman = pkgs.writeShellScriptBin "ipman" (builtins.readFile "${src}/ipman");
in
{
  environment.systemPackages = [ ipman ];
}

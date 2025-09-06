{
  pkgs,
  ...
}:

{
  programs.fish = {

    enable = true;
    package = pkgs.fish;

    functions = {
      starship_transient_prompt_func = {
        body = "starship module character";
      };
      starship_transient_rprompt_func = {
        body = "starship module time";
      };
    };

    shellAliases = {
      "ff" = "fastfetch";
      "cat" = "bat";

      # nix helper
      "ns" = "nh os switch";
      "nsu" = "ns --update";
      "nt" = "nh os test";
      "ntu" = "nt --update";
      "nb" = "nh os boot";
      "nbu" = "nb --update";
      "nc" = "nh clean all";
      "nck" = "nc --keep 3";

      # git
      "gc" = "git commit";
      "gca" = "gc --amend";
      "ga" = "git add";
      "gaa" = "ga --all";
      "gp" = "git push";
      "gpf" = "gp --force";
      "gd" = "git diff";
      "gl" = "git log";
      "glo" = "gl --oneline";
      "gr" = "git reset";
      "grh" = "gr --hard";
    };

    interactiveShellInit = "fastfetch";
    shellInit = "set -g fish_greeting";
  };
}

{
  user,
  ...
}:

{
  programs.git = {
    enable = true;
    userName = "${user.name}";
    userEmail = "${user.email}";
    extraConfig = {
      init.defaultBranch = "main";
      gpg.format = "ssh";
      commit.gpgsign = true;
      user.signingkey = "~/.ssh/id_ed25519.pub";
    };
  };
}

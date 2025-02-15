{
  user,
  ...
}:

{
  programs.git = {
    enable = true;
    userName = "${user.name}";
    userEmail = "${user.email}";
    signing = {
      key = "~/.ssh/id_ed25519.pub";
      format = "ssh";
      signByDefault = true;
    };
    extraConfig.init.defaultBranch = "main";
  };
}

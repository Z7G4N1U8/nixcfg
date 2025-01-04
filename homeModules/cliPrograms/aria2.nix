{
  programs.aria2 = {
    enable = true;
    settings = {
      dir = "~/Downloads";
      split = 4;
      max-connection-per-server = 4;
      file-allocation = "falloc";
      # check-integrity = true;
      max-concurrent-downloads = 4;
      min-split-size = "5M";
      # show-files = true;
    };
  };
}

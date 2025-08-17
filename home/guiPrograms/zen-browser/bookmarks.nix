{
  programs.zen-browser.profiles.default.bookmarks = {

    force = true;
    settings = [

      {
        name = "Nix Sites";
        # toolbar = true;
        bookmarks = [

          {
            name = "NixOS Wiki";
            tags = [
              "nix"
              "wiki"
            ];
            keyword = "wiki";
            url = "https://wiki.nixos.org";
          }

          {
            name = "NixOS Status";
            tags = [
              "nix"
              "status"
            ];
            keyword = "status";
            url = "https://status.nixos.org";
          }

          {
            name = "NixOS Config";
            tags = [
              "nix"
              "config"
            ];
            keyword = "nixcfg";
            url = "https://github.com/SomeEmptyBox/nixcfg";
          }

        ];
      }

      {
        name = "Favorite";
        bookmarks = [

          {
            name = "YouTube";
            tags = [ "youtube" ];
            keyword = "yt";
            url = "https://youtube.com";
          }

          {
            name = "Catppuccin";
            tags = [ "theme" ];
            keyword = "ctp";
            url = "https://catppuccin.com";
          }

        ];
      }

      {
        name = "Proton Sites";
        # toolbar = true;
        bookmarks = [

          {
            name = "Proton Account";
            tags = [
              "proton"
              "account"
            ];
            keyword = "pa";
            url = "https://account.proton.me";
          }

          {
            name = "Proton Mail";
            tags = [
              "proton"
              "mail"
            ];
            keyword = "pm";
            url = "https://mail.proton.me";
          }

          {
            name = "Proton Drive";
            tags = [
              "proton"
              "drive"
            ];
            keyword = "pd";
            url = "https://drive.proton.me";
          }

        ];
      }

    ];
  };
}

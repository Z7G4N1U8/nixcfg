{
  programs.librewolf.profiles.default.bookmarks = {

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
            name = "Hyprland Wiki";
            tags = [
              "hypr"
              "wiki"
            ];
            keyword = "hw";
            url = "https://wiki.hyprland.org";
          }

          {
            name = "YouTube";
            tags = [ "youtube" ];
            keyword = "yt";
            url = "https://youtube.com";
          }

        ];
      }

      {
        name = "Proton Sites";
        # toolbar = true;
        bookmarks = [

          {
            name = "Proton Accout";
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

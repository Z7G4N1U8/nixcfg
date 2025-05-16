{
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  imports = [ "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix" ];

  nix.settings = {
    accept-flake-config = true;
    builders-use-substitutes = true;
    warn-dirty = false;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    trusted-users = [ "root" ];
  };

  services.getty = lib.mkForce {
    autologinUser = "root";
    helpLine = ''
      Network Manager is enabled so you can use 'nmcli' and 'nmtui' to connect to internet.
      Do 'rfkill unblock all' to enable wireless devices that have been blocked.
      Nix-command and Flakes are also enabled.
      You can start installation using 'nixos-install --flake github:owner/repo#config'.
      Some useful utilities are provided including aria2, btop, curl, disko, fzf, git, helix, tldr and yazi.
    '';
  };

  image.baseName = lib.mkForce "NixOS";
  zramSwap.enable = true;

  nixpkgs = {
    hostPlatform = "x86_64-linux";
    config = {
      allowUnfree = true;
      allowBroken = true;
    };
  };

  networking = {
    wireless.enable = false;
    networkmanager.enable = true;
  };

  environment = {
    sessionVariables.EDITOR = "hx";

    systemPackages = with pkgs; [
      aria2
      btop
      btrfs-progs
      curl
      disko
      fish
      fzf
      git
      helix
      tlrc
      yazi
    ];
  };

  programs.fish.enable = true;
  users.users.root.shell = pkgs.fish;
}

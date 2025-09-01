{
  pkgs,
  user,
  ...
}:

{
  imports = [
    ./boot.nix
    ./hardware.nix
    ./modules
    ./programs
    ./scripts
  ];

  nix.settings = {
    accept-flake-config = true;
    auto-optimise-store = true;
    builders-use-substitutes = true;
    warn-dirty = false;
    trusted-users = [
      "root"
      "@wheel"
    ];
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  nixpkgs.config = {
    permittedInsecurePackages = [ "qtwebengine-5.15.19" ];
    allowUnfree = true;
  };

  services = {
    libinput.enable = true;
    pipewire.enable = true;
    thermald.enable = true;
  };

  networking = {
    hostName = "${user.host}";
    networkmanager = {
      enable = true;
      wifi.powersave = true;
    };
    firewall.enable = false;
  };

  hardware.bluetooth.enable = true;
  time.timeZone = "Asia/Kolkata";

  users.users.${user.name} = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "networkmanager"
      "wheel"
      "adbusers"
    ];
  };

  programs.nh = {
    enable = true;
    flake = "/home/${user.name}/nixcfg";
    clean = {
      enable = true;
      dates = "daily";
      extraArgs = "--keep 3";
    };
  };

  programs = {
    adb.enable = true;
    fish.enable = true;
  };

  virtual.enable = true;

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    nerd-fonts.jetbrains-mono
  ];

  environment.systemPackages = with pkgs; [
    aria2
    btop
    btrfs-progs
    curl
    clang
    fastfetch
    fzf
    git
    jdk
    p7zip
    rustc
    speedtest-rs
    tlrc
    wget
  ];

  system.stateVersion = "24.05";
}

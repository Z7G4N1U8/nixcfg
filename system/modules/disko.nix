{
  inputs,
  ...
}:

{
  imports = [ inputs.disko.nixosModules.disko ];

  disko.devices.disk.main = {
    type = "disk";
    device = "/dev/nvme0n1";
    content.type = "gpt";
  };

  disko.devices.disk.main.content.partitions.ESP = {
    priority = 1;
    name = "ESP";
    start = "1M";
    end = "1G";
    type = "EF00";
    content = {
      type = "filesystem";
      format = "vfat";
      mountpoint = "/boot";
      mountOptions = [ "umask=0077" ];
    };
  };

  disko.devices.disk.main.content.partitions.root = {
    size = "100%";
    content = {
      type = "btrfs";
      extraArgs = [ "-f" ];
      subvolumes = {
        "root" = {
          mountpoint = "/";
        };

        "home" = {
          mountOptions = [ "compress=zstd" ];
          mountpoint = "/home";
        };

        "nix" = {
          mountOptions = [
            "compress=zstd"
            "noatime"
          ];
          mountpoint = "/nix";
        };

        "snap" = {
          mountOptions = [ "compress=zstd" ];
          mountpoint = "/snap";
        };
      };
    };
  };
}

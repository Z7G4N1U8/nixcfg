{
  config,
  lib,
  pkgs,
  user,
  ...
}:

{
  options.virtual.enable = lib.mkEnableOption "enables virtualisation";
  config = lib.mkIf config.virtual.enable {

    virtualisation.libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        swtpm.enable = true;
      };
    };

    services.spice-vdagentd.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;
    users.users.${user.name}.extraGroups = [
      "kvm"
      "libvirtd"
    ];
    programs.virt-manager.enable = true;

    environment.systemPackages = with pkgs; [
      gnome-boxes
      spice
      spice-gtk
      spice-protocol
      usbutils
      virt-manager
      virt-viewer
      # win-virtio
      win-spice
    ];

    home-manager.users.${user.name}.dconf.settings."org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };

  };
}

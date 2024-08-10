{ username, pkgs, lib, config, ... }:

{
  options = {
    libvirtModule.enable =
      lib.mkEnableOption "enables libvirtModule";
  };

  config = lib.mkIf config.libvirtModule.enable {
    virtualisation = {
      libvirtd = {
        enable = true;
        qemu = {
          package = pkgs.qemu_kvm;
          ovmf.enable = true;
          ovmf.packages = [ pkgs.OVMFFull.fd ];
        };
      };
      spiceUSBRedirection.enable = true;
    };
    environment.systemPackages = with pkgs; [
      spice
      spice-gtk
      spice-protocol
      virt-viewer
    ];
    programs.virt-manager.enable = true;
    users.users."${username}".extraGroups = [ "libvirtd" ];
  };
}

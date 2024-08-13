{ pkgs, lib, config, ... }:

{
  options = {
    amdModule.enable =
      lib.mkEnableOption "enables amdModule";
  };

  config = lib.mkIf config.amdModule.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
    systemd.tmpfiles.rules = [ "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}" ];
  };
}

{ pkgs, lib, config, ... }:

{
  options = {
    amdModule.enable =
      lib.mkEnableOption "enables amdModule";
  };

  config = lib.mkIf config.amdModule.enable {
    hardware.graphics.enable = true;
    systemd.tmpfiles.rules = [ "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}" ];
  };
}

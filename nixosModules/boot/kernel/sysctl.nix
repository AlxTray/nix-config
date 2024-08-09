{ lib, config, ... }:

{
  options = {
    sysctlModule.enable =
      lib.mkEnableOption "enables sysctlModule";
  };

  config = lib.mkIf config.kernelPackageModule.enable {
    boot.kernel.sysctl = {
      "vm.max_map_count" = 2147483642;
    };
  };
}

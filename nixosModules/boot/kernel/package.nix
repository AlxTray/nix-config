{ pkgs, lib, config, ... }:

{
  options = {
    kernelPackageModule.enable =
      lib.mkEnableOption "enables kernelPackagesModule";
  };

  config = lib.mkIf config.kernelPackageModule.enable {
    boot.kernelPackages = pkgs.linuxPackages_zen;
  };
}

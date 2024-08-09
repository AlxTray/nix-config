{ lib, ... }:

{
  imports = [
    ./package.nix
    ./sysctl.nix
  ];

  kernelPackageModule.enable =
    lib.mkDefault true;
  sysctlModule.enable = 
    lib.mkDefault true;
}

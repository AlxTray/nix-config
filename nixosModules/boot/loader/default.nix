{ lib, ... }:

{
  imports = [
    ./efi.nix
    ./systemdBoot.nix
  ];

  efiModule.enable =
    lib.mkDefault true;
  systemdBootModule.enable =
    lib.mkDefault true;
}

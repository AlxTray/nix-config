{ lib, ... }:

{
  imports = [
    ./efi.nix
    ./grub.nix
  ];

  efiModule.enable =
    lib.mkDefault true;
  grubModule.enable =
    lib.mkDefault true;
}

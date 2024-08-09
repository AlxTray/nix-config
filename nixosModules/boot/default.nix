{ lib, ... }:

{
  imports = [
    ./greetd.nix
    ./plymouth.nix

    ./kernel
    ./loader
  ];

  greetdModule.enable =
    lib.mkDefault true;
  plymouthModule.enable =
    lib.mkDefault true;
}

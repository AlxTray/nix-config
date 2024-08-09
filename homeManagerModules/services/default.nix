{ lib, ... }:

{
  imports = [
    ./dunst.nix
    ./udiskie.nix
  ];

  dunstModule.enable =
    lib.mkDefault true;
  udiskieModule.enable =
    lib.mkDefault true;
}

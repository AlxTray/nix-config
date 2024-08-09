{ lib, ... }:

{
  imports = [
    ./dconf.nix
    ./gnupg.nix
    ./java.nix
    ./steam.nix
    ./thunar.nix
  ];

  dconfModule.enable =
    lib.mkDefault true;
  gnupgModule.enable =
    lib.mkDefault true;
}

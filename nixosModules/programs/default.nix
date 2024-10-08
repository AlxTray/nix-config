{ lib, ... }:

{
  imports = [
    ./dconf.nix
    ./gnupg.nix
    ./hyprland.nix
    ./java.nix
    ./jetbrains.nix
    ./nvim.nix
    ./steam.nix
    ./thunar.nix
  ];

  dconfModule.enable =
    lib.mkDefault true;
  gnupgModule.enable =
    lib.mkDefault true;
  hyprlandSystemModule.enable =
    lib.mkDefault true;
  nvimModule.enable =
    lib.mkDefault true;
  thunarModule.enable =
    lib.mkDefault true;
}

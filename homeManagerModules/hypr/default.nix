{ lib, ... }:

{
  imports = [
    ./hypridle.nix
    ./hyprland.nix
    ./hyprlock.nix
  ];

  hyprlandModule.enable =
    lib.mkDefault true;
  hyprlockModule.enable =
    lib.mkDefault true;
}

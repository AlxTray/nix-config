{ lib, ... }:

{
  imports = [
    ./hypridle.nix
    ./hyprland.nix
    ./hyprlock.nix
  ];

  hyprlandHomeModule.enable =
    lib.mkDefault true;
}

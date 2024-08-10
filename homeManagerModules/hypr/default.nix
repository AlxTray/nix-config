{ lib, ... }:

{
  imports = [
    ./hypridle.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./hyprpaper.nix
  ];

  hyprlandModule.enable =
    lib.mkDefault true;
  hyprlockModule.enable =
    lib.mkDefault true;
  hyprpaperModule.enable =
    lib.mkDefault true;
}

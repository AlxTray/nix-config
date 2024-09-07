{ lib, ... }:

{
  imports = [
    ./imv.nix
    ./kitty.nix
    ./mpv.nix
    ./walker.nix
    ./waybar.nix
    ./wlogout.nix
  ];
  
  imvModule.enable =
    lib.mkDefault true;
  kittyModule.enable =
    lib.mkDefault true;
  mpvModule.enable =
    lib.mkDefault true;
  walkerModule.enable =
    lib.mkDefault true;
  waybarModule.enable =
    lib.mkDefault true;
  wlogoutModule.enable =
    lib.mkDefault true;
}

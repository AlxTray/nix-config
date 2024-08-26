{ lib, ... }:

{
  imports = [
    ./firefox.nix
    ./imv.nix
    ./kitty.nix
    ./mpv.nix
    ./vscode.nix
    ./walker.nix
    ./waybar.nix
    ./wlogout.nix
  ];

  firefoxModule.enable =
    lib.mkDefault true;
  imvModule.enable =
    lib.mkDefault true;
  kittyModule.enable =
    lib.mkDefault true;
  walkerModule.enable =
    lib.mkDefault true;
  waybarModule.enable =
    lib.mkDefault true;
  wlogoutModule.enable =
    lib.mkDefault true;
}

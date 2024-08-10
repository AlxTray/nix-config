{ lib, ... }:

{
  imports = [
    ./bluetooth.nix
    ./extraFonts.nix
    ./locale.nix
    ./generalPackages.nix
    ./networking.nix
    ./portals.nix
    ./stylix.nix

    ./nix
    ./programs
    ./services
    ./boot
    ./drivers
    ./security
    ./virt
  ];

  bluetoothModule.enable =
    lib.mkDefault true;
  extraFontsModule.enable =
    lib.mkDefault true;
  localeModule.enable =
    lib.mkDefault true;
  systemPackagesModule.enable =
    lib.mkDefault true;
  networkingModule.enable =
    lib.mkDefault true;
  portalsModule.enable =
    lib.mkDefault true;
  stylixSystemModule.enable =
    lib.mkDefault true;
}

{ lib, ... }:

{
  imports = [
    ./bluetooth.nix
    ./extraFonts.nix
    ./generalPackages.nix
    ./hyprland.nix
    ./jetbrains.nix
    ./locale.nix
    ./networking.nix
    ./portals.nix
    ./stylix.nix
    ./variables.nix
    ./zsh.nix

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
  hyprlandSystemModule.enable =
    lib.mkDefault true;
  networkingModule.enable =
    lib.mkDefault true;
  portalsModule.enable =
    lib.mkDefault true;
  stylixModule.enable =
    lib.mkDefault true;
  variablesModule.enable =
    lib.mkDefault true;
  zshSystemModule.enable =
    lib.mkDefault true;
}

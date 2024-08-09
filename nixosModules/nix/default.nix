{ lib, ... }:

{
  imports = [
    ./allowUnfree.nix
    ./settings.nix
    ./garbageCollection.nix
  ];

  unfreePackagesModule.enable =
    lib.mkDefault true;
  nixSettingsModule.enable =
    lib.mkDefault true;
  gcModule.enable =
    lib.mkDefault true;  
}

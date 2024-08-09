{ lib, ... }:

{
  imports = [
    ./polkit.nix
    ./rtkit.nix
    ./polkitAgent.nix
  ];

  polkitModule.enable =
    lib.mkDefault true;
  rtkitModule.enable =
    lib.mkDefault true;
  polkitAgentModule.enable =
    lib.mkDefault true; 
}

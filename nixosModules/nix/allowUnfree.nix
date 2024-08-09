{ lib, config, ... }:

{
  options = {
    unfreePackagesModule.enable =
      lib.mkEnableOption "enables unfreePackagesModule";
  };

  config = lib.mkIf config.unfreePackagesModule.enable {
    nixpkgs.config.allowUnfree = true;
  };
}

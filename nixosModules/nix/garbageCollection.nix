{ lib, config, ... }:

{
  options = {
    gcModule.enable =
      lib.mkEnableOption "enables gcModule";
  };

  config = lib.mkIf config.gcModule.enable {
    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}

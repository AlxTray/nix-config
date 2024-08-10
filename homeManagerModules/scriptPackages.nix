{ pkgs, lib, config, ... }:

{
  options = {
    scriptPackagesModule.enable =
      lib.mkEnableOption "enables scriptPackagesModule";
  };

  config = lib.mkIf config.scriptPackagesModule.enable {
    home.packages = [
      (import ../scripts/screenshot.nix { inherit pkgs; })
      (import ../scripts/wallpaperRandomiser.nix { inherit pkgs lib; })
    ];
  };
}

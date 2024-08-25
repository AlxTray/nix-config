{ pkgs, lib, config, ... }:

{
  options = {
    jetbrainsModule.enable =
      lib.mkEnableOption "enables jetbrainsModule";
  };

  config = lib.mkIf config.jetbrainsModule.enable {
    home.packages = with pkgs; [
      jetbrains.idea-community-bin
      jetbrains.pycharm-community-bin
      jetbrains.rust-rover
    ];
  };
}

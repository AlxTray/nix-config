{ inputs, pkgs, lib, config, ... }:

{
  options = {
    nvimModule.enable =
      lib.mkEnableOption "enables nvimModule";
  };

  config = lib.mkIf config.nvimModule.enable {
    nixpkgs.overlays = [
      inputs.nvim.overlays.default
    ];
    environment.systemPackages = [ pkgs.nvim-pkg ];
  };
}

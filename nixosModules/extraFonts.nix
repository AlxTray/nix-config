{ pkgs, lib, config, ... }:

{
  options = {
    extraFontsModule.enable =
      lib.mkEnableOption "enables extraFontsModule";
  };

  config = lib.mkIf config.extraFontsModule.enable {
    fonts.packages = with pkgs; [
      noto-fonts-cjk
      font-awesome
      (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    ];
  };
}

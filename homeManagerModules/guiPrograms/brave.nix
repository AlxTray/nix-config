{ pkgs, lib, config, ... }:

{
  options = {
    braveModule.enable =
      lib.mkEnableOption "enables braveModule";
  };

  config = lib.mkIf config.braveModule.enable {
    programs.chromium = {
      enable = true;
      package = pkgs.brave;
      dictionaries = [ pkgs.hunspellDictsChromium.en-gb ];
    };
  };
}

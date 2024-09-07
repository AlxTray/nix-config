{ pkgs, lib, config, ... }:

{
  options = {
    braveModule.enable =
      lib.mkEnableOption "enables braveModule";
  };

  config = lib.mkIf config.braveModule.enable {
    environment.systemPackages = [ pkgs.brave ];
    programs.chromium = {
      enable = true;
      extraOpts = {
        "SpellcheckEnabled" = true;
        "SpellcheckLanguage" = [ "en-GB" ];
      };
    };
  };
}

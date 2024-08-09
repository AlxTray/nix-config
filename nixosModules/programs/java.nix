{ lib, config, ... }:

{
  options = {
    javaModule.enable =
      lib.mkEnableOption "enables javaModule";
  };

  config = lib.mkIf config.javaModule.enable {
    programs.java.enable = true;
  };
}

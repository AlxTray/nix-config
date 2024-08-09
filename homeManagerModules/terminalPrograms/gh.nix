{ lib, config, ... }:

{
  options = {
    ghModule.enable =
      lib.mkEnableOption "enables ghModule";
  };

  config = lib.mkIf config.ghModule.enable {
    programs.gh.enable = true;
  };
}

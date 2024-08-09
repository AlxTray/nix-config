{ lib, config, ... }:

{
  options = {
    btopModule.enable =
      lib.mkEnableOption "enables btopModule";
  };

  config = lib.mkIf config.btopModule.enable {
    programs.btop = {
      enable = true;
      settings = { vim_keys = true; };
    };
  };
}

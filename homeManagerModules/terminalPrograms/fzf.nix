{ lib, config, ... }:

{
  options = {
    fzfModule.enable =
      lib.mkEnableOption "enables fzfModule";
  };

  config = lib.mkIf config.fzfModule.enable {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}

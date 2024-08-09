{ inputs, pkgs, lib, config, ... }:

{
  options = {
    yaziModule.enable =
      lib.mkEnableOption "enables yaziModule";
  };

  config = lib.mkIf config.yaziModule.enable {
    programs.yazi = {
      enable = true;
      package = inputs.yazi.packages.${pkgs.system}.default;
      enableZshIntegration = true;
      shellWrapperName = "y";
      settings = {
        opener = {
          edit = [
            {
              run = "kitty -e hx $@";
              desc = "Helix";
              orphan = true;
            }
          ];
        };
      };
    };
  };
}

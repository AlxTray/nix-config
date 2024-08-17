{ lib, config, ... }:

{
  options = {
    taskwarriorModule.enable =
      lib.mkEnableOption "enables taskwarriorModule";
  };

  config = lib.mkIf config.taskwarriorModule.enable {
    programs.taskwarrior = {
      enable = true;
    };
    services.taskwarrior-sync.enable = true;
  };
}

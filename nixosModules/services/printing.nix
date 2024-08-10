{ username, lib, config, ... }:

{
  options = {
    printingModule.enable =
      lib.mkEnableOption "enables printingModule";
  };

  config = lib.mkIf config.printingModule.enable {
    services.printing.enable = true;
    users.users."${username}".extraGroups = [ "lp" ];
  };
}

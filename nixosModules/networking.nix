{ username, host, options, lib, config, ... }:

{
  options = {
    networkingModule.enable =
      lib.mkEnableOption "enables networkingModule";
  };

  config = lib.mkIf config.networkingModule.enable {
    networking.networkmanager.enable = true;
    networking.hostName = host;
    networking.timeServers = options.networking.timeServers.default ++ [ "pool.ntp.org" ];
    users.users."${username}".extraGroups = [ "networkmanager" ];
  };
}

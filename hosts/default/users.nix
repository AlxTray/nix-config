{ pkgs, username, ... }:

{
  users.users = {
    "${username}" = {
      homeMode = "755";
      isNormalUser = true;
      description = "AlxTray";
      extraGroups = [
        "networkmanager"
        "wheel"
        "scanner"
        "lp"
      ];
      shell = pkgs.zsh;
      ignoreShellProgramCheck = true;
    };
  };
}

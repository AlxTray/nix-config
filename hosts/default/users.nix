{ pkgs, username, ... }:

{
  users.users = {
    "${username}" = {
      homeMode = "755";
      isNormalUser = true;
      description = "AlxTray";
      extraGroups = [ "wheel" ];
      shell = pkgs.zsh;
      ignoreShellProgramCheck = true;
    };
  };
}

{ pkgs, lib, config, ... }:

{
  options = {
    vscodeModule.enable =
      lib.mkEnableOption "enables vscodeModule";
  };

  config = lib.mkIf config.vscodeModule.enable {
    stylix.targets.vscode.enable = false;
    programs.vscode = {
      enable = true;
      package = pkgs.vscode-fhs;
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      extensions = with pkgs.vscode-extensions; [
        jdinhlife.gruvbox
        jnoortheen.nix-ide
        mkhl.direnv
        arrterian.nix-env-selector
        vscjava.vscode-java-pack
        visualstudioexptteam.vscodeintellicode
        redhat.java
        vscjava.vscode-java-debug
        vscjava.vscode-maven
        vscjava.vscode-java-test
        vscjava.vscode-java-dependency
        vscjava.vscode-gradle
        mathiasfrohlich.kotlin
        ms-python.python
        ms-vscode.cpptools
        yzhang.markdown-all-in-one
        esbenp.prettier-vscode
        christian-kohler.path-intellisense
        ban.spellright
        aaron-bond.better-comments
        eamodio.gitlens
      ];
      userSettings = {
        "editor.fontFamily" = "FiraCode";
        "editor.fontLigatures" = true;
        "workbench.colorTheme" = "Gruvbox Dark Hard";
        "window.titleBarStyle" = "custom";
        "redhat.telemetry.enabled" = false;
      };
    };
  };
}

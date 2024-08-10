{ pkgs, ... }:

pkgs.writeShellScriptBin "walkerLaunch" ''
  walker --gapplication-launch
  walker
''

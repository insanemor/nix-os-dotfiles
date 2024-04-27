{ config, pkgs, userSettings, ... }:

{

  programs.vscode = {

    userSettings = {
      "window.titleBarStyle" = "custom";
      "workbench.colorTheme" = "Github Dark Colorblind (Beta)";
      "editor.fontFamily" = "'M+1Code Nerd Font','Droid Sans Mono', 'monospace', monospace";
      "github.copilot.enable" = {
        "*" = true;
        "plaintext" = false;
        "markdown" = true;
        "scminput" = false;
      };

    };
  
  };



}

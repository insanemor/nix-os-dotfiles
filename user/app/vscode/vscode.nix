{ config, pkgs, userSettings, ... }:

{
  home.packages = with pkgs; [ 
    pkgs.vscode 
    pkgs.vscode-with-extensions 
  ];


  programs.vscode = {
    enable = true;
  };
}

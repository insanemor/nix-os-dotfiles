{ config, pkgs, userSettings, ... }:

{
  home.packages = [ pkgs.vscode ];


  programs.vscode = {
    enable = true;
    package = pkgs.vscode-with-extensions;
    extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-vscode.cpptools
      eamodio.gitlens
    ];
  };
}
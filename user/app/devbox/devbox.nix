{ pkgs, ... }:

{

  # Useful  tools
  environment.systemPackages = with pkgs; [
    devbox
  ];

  # home.file.".tool-versions".text = ''
  #     helm 3.14.3
  #     terraform 1.0.11
  #     nodejs 20.5.1
  
  # '';

}
{ lib, config, pkgs, userSettings, options, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  imports = [ 
    ../clientes/SBIT/nixos/main.nix
  ];



}

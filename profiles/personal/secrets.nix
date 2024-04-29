{ lib, config, pkgs, userSettings, options, ... }:

{
  
  options = {
    secrets.enable = 
      lib.mkEnableOption "Enable secrets";
  };

  config = lib.mkIf options.secrets.enable {

    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    home.username = userSettings.username;
    home.homeDirectory = "/home/"+userSettings.username;

    imports = [ 
      #../clientes/SBIT/nixos/main.nix
    ];

  };


}

{ config, lib, pkgs, userSettings, systemSettings, ... }:

{

   
    home.file."~/.tool-version".text = ''
        terraform 1.0.11
    
    
    
    '';

   

}
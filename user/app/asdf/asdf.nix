{ config, lib, pkgs, userSettings, systemSettings, ... }:

{

   
    home.file.".tool-versions".text = ''
        terraform 1.0.11
    
    
    
    '';

    home.file.".asdfrc".text = ''
        always_keep_download = yes
    
    
    
    '';   



}
{ config, lib, pkgs, userSettings, systemSettings, ... }:

{

   
    home.file.".tool-versions".text = ''
        terraform 1.0.11
        nodejs 20.5.1
    
    
    
    '';

    home.file.".asdfrc".text = ''
        always_keep_download = yes
    
    
    
    '';   



}
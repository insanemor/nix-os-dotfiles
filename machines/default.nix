{ config, pkgs, options, lib, ... }:

let
  
  # Auto HOST chooser based on device product name
  # Terminal:   cat /sys/devices/virtual/dmi/id/product_name
  #---------------------------------------------------------------------
  importfile = ( if builtins.readFile "/sys/devices/virtual/dmi/id/product_name" == "20RBS81L00\n" then
    ./LAPTOPS/20RBS81L00/20RBS81L00-configuration.nix

    else if builtins.readFile "/sys/devices/virtual/dmi/id/product_name" == "VirtualBox\n" then
      ./VBOX/001/001-configuration.nix

  
  else

    # Manually symlink host/machine
    # ---------------------------------------------
    /etc/nixos/hardware-configuration.nix

  );

in

{
  imports = [ 
    
    # call attribute thats declared above
    # ---------------------------------------------
    #importfile 
    ./20RBS81L00/20RBS81L00-configuration.nix  # bug nao consegui fazer funcionar a funcao de cima 
  ];

}
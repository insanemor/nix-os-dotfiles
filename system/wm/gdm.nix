{ config, lib, pkgs, ... }:

{


  # Configure keymap in X11
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    xkb = {
      layout = "br";
      variant = "";
      options = "caps:escape";
    };
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      enableHidpi = true;
      theme = "chili";
      package = pkgs.sddm;
    };


  };

}

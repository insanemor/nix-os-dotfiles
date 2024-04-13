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
      plasma6 {
        enable = true;
        theme = "breeze";
      };
      defaultSession = "plasma";

      };
      wayland.enable = true;
      enableHidpi = true;
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
    oxygen
  ];




}
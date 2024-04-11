{pkgs, ...}: 

{
  
  programs.hyprland = {
    # Install the packages from nixpkgs
    enable = true;
    # nvidiaPatches = true;
    xwayland.enable = true;
  };


  # environment.sessionVariables = {
  #   #If your cursor becomes invisible
  #   WLR_NO_HARDWARE_CURSORS = "1";
  #   Hint electron apps to use wayland
  #   NIXOS_OZONE_WL = "1";
  # };

  environment.systemPackages = [
    pkgs.waybar
    pkgs.eww
    pkgs.dunst
    pkgs.libnotify
    pkgs.hyprpaper
    pkgs.swaybg
    pkgs.mpvpaper
    pkgs.swww
    pkgs.kitty
    pkgs.wezterm # testar esse 
    pkgs.rofi-wayland
    pkgs.wofi
    pkgs.bemenu
    pkgs.fuzzel
    pkgs.tofi


    (pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
    )

  ];


  # xdg.portal.enable = true;
  # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];



  # rofi keybind
  # bind = $mainMod, S, exec, rofi -show drun -show-icons


    
}

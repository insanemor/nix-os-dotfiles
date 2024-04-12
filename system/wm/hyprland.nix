{pkgs, ...}: 

{
  
  programs.hyprland = {
    # Install the packages from nixpkgs
    enable = true;
<<<<<<< Updated upstream
    # nvidiaPatches = true;
=======
    nvidiaPatches = true;
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
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
=======
    libnotify
    hyprpaper
    swaybg
    mpvpaper
    swww
    kitty
    wezterm # testar esse 
    rofi-wayland
    wofi
    bemenu
    fuzzel
    tofi
>>>>>>> Stashed changes


    (pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
    )

  ];


<<<<<<< Updated upstream
  # xdg.portal.enable = true;
  # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
=======
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
>>>>>>> Stashed changes



  # rofi keybind
<<<<<<< Updated upstream
  # bind = $mainMod, S, exec, rofi -show drun -show-icons
=======
  bind = $mainMod, S, exec, rofi -show drun -show-icons
>>>>>>> Stashed changes


    
}

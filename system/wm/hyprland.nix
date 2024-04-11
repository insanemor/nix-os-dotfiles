{pkgs, ...}: 

{
  
  programs.hyprland = {
    # Install the packages from nixpkgs
    enable = true;
    nvidiaPatches = true;
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


    (pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
    )

  ];


  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];



  # rofi keybind
  bind = $mainMod, S, exec, rofi -show drun -show-icons


    
}

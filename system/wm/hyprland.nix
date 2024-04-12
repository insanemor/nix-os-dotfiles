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


    
}

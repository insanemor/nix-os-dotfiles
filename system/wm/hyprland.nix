{pkgs, ...}: 

{

    # Import wayland config
  imports = [ ./wayland.nix

            ];
  
  programs.hyprland = {
    # Install the packages from nixpkgs
    enable = true;
    xwayland = {
      enable = true;
    };
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
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

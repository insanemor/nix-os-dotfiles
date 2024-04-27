{ pkgs, ... }:
{
  
  programs._1password = {
    enable = true;
  };

  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "ins" ];
  };


  security.polkit = {
    enable = true;
  };

    # Enable 1password plugins on interactive shell init
  programs.zsh.interactiveShellInit = ''
    source /home/ins/.config/op/plugins.sh
  '';
  

  # Useful otherdevelopment tools
  # environment.systemPackages = with pkgs; [
    
  # ];

}
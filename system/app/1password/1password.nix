{ pkgs, ... }:
{
  
  programs._1password = {
    enable = true;
  };

  programs._1password-gui = {
    enable = true;
  };

  polkitPolicyOwners = [ "ins" ];

  # Useful otherdevelopment tools
  # environment.systemPackages = with pkgs; [
  # ];

}